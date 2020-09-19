// Author: Boxjan
// Datetime: 2020/4/22 15:38
// I don't know why, but it can work

package main

/*
#include <unistd.h>
int tickPreSec() {
	return sysconf(_SC_CLK_TCK);
}
int memPageSize() {
	return sysconf(_SC_PAGESIZE);
}
*/
import "C"

import (
	"bytes"
	"encoding/json"
	"errors"
	"flag"
	"fmt"
	"github.com/prometheus/procfs"
	"log"
	"os"
	"os/exec"
	"os/signal"
	"runtime"
	"strings"
	"sync"
	"syscall"
	"time"
)

// It is running in docker/kvm to get the time and memory used.
// The shim was designed running in docker (runc, runsc)

var tickPerSec int
var memPageSize uint64
var kernelTimeMod uint64

var (
	cmd          *exec.Cmd
	configString string
	stdinFile    *os.File
	stdoutFile   *os.File
	stderrFile   *os.File
	config       Config
	usage        Usage
	result       Result
	pids         map[int]bool
)

type Config struct {
	Command      string   `json:"command"`
	Args         []string `json:"args"`
	StdinFile    string   `json:"stdin_file"`
	StdoutFile   string   `json:"stdout_file"`
	StderrFile   string   `json:"stderr_file"`
	ProcWatch    bool     `json:"proc_watcher"`
	CpuTimeLimit int64    `json:"cpu_time_limit"` // ms
	TimeLimit    int64    `json:"time_limit"`     // ms
	MemoryLimit  uint64   `json:"memory_limit"`   // byte
	OutputLimit  uint64   `json:"output_limit"`   // byte
	ThreadCount  uint32   `json:"thread_count"`
}

type Usage struct {
	sync.RWMutex
	outputByte   uint64
	memoryUsed   uint64
	sysTimeUsed  uint64
	userTimeUsed uint64
	threadCount  uint32
}

type Result struct {
	SysTime                   int64              `json:"sys_time"`  // ms
	UserTime                  int64              `json:"user_time"` // ms
	RusageSystime             int64              `json:"rusage_systime"`
	RusageUsertime            int64              `json:"rusage_usertime"`
	CpuTime                   int64              `json:"cpu_time"`
	ClockTime                 int64              `json:"clock_time"`                     // ms
	MemoryUsed                uint64             `json:"memory_used"`                    // byte
	RusageMemoryUsed          uint64             `json:"rusage_memory_usage"`            // byte
	RusageMemoryUsedFromMinft uint64             `json:"rusage_memory_usage_from_minft"` // byte
	OutputBytes               uint64             `json:"output_bytes"`                   // byte
	Killer                    string             `json:"killer"`
	ExitStatus                syscall.WaitStatus `json:"exit_status"`
	ExitCode                  int                `json:"exit_code"`
}

func (r *Result) String() string {
	resultJson, err := json.Marshal(r)
	if err != nil {
		return ""
	}
	return string(bytes.Replace(resultJson, []byte("\n"), []byte(""), -1))
}

func cleanAndExit() {
	err := recover()
	if err != nil {
		if cmd.Process != nil {
			for pid := range pids {
				_ = syscall.Kill(pid, 9) // kill all child process
			}
		}

		// close all open file
		if stdinFile != nil {
			_ = stdinFile.Close()
		}
		if stdoutFile != nil {
			_ = stdoutFile.Close()
		}
		if stderrFile != nil {
			_ = stderrFile.Close()
		}
		log.Print(err)
		os.Exit(1)
	}

}

func handlerAllSig() {
	sigs := make(chan os.Signal, 1)
	signal.Notify(sigs, // will handle most of linux signal, to chcange
		syscall.SIGABRT, syscall.SIGALRM, syscall.SIGBUS, syscall.SIGCLD,
		syscall.SIGCONT, syscall.SIGFPE, syscall.SIGHUP, syscall.SIGILL, syscall.SIGINT,
		syscall.SIGIO, syscall.SIGIOT, syscall.SIGKILL, syscall.SIGPIPE, syscall.SIGPOLL,
		syscall.SIGPROF, syscall.SIGPWR, syscall.SIGQUIT, syscall.SIGSEGV, syscall.SIGSTKFLT,
		syscall.SIGSTOP, syscall.SIGSYS, syscall.SIGTERM, syscall.SIGTRAP, syscall.SIGTSTP,
		syscall.SIGTTIN, syscall.SIGTTOU, syscall.SIGUNUSED, syscall.SIGURG, syscall.SIGUSR1,
		syscall.SIGUSR2, syscall.SIGVTALRM, syscall.SIGWINCH, syscall.SIGXCPU, syscall.SIGXFSZ,
	)
	go func() {
		sig := <-sigs
		log.Print("catch sigs", sig.String())
		if cmd.Process != nil { // process have start run.
			for pid := range pids {
				_ = syscall.Kill(pid, sig.(syscall.Signal)) // exit
			}
		}
	}()
}

func init() {
	tickPerSec = int(C.tickPreSec())
	memPageSize = uint64(C.memPageSize())
	kernelTimeMod = uint64(1000 / float64(tickPerSec))

	runtime.GOMAXPROCS(1)

	defer cleanAndExit()
	handlerAllSig()
	flag.StringVar(&configString, "config", "", "config string in json")
}

func main() {
	flag.Parse()

	var err error
	result = Result{}
	if len(configString) == 0 {
		panic(errors.New("not run config"))
	}
	parseConfig(&configString)

	startTime := time.Now()
	err = cmd.Start()
	if err != nil {
		panic(err)
	}

	if config.ProcWatch {
		go upWatcher()
	}
	_ = cmd.Wait()

	endTime := time.Now()

	result.ExitCode = cmd.ProcessState.ExitCode()
	result.ExitStatus = cmd.ProcessState.Sys().(syscall.WaitStatus)
	result.ClockTime = endTime.Sub(startTime).Milliseconds()

	result.CpuTime = int64(usage.userTimeUsed + usage.sysTimeUsed)
	result.SysTime = int64(usage.sysTimeUsed)
	result.UserTime = int64(usage.userTimeUsed)

	result.RusageSystime = cmd.ProcessState.SystemTime().Milliseconds()
	result.RusageUsertime = cmd.ProcessState.UserTime().Milliseconds()

	result.MemoryUsed = usage.memoryUsed
	result.RusageMemoryUsed = uint64(cmd.ProcessState.SysUsage().(*syscall.Rusage).Maxrss) * 1024
	result.RusageMemoryUsedFromMinft = uint64(cmd.ProcessState.SysUsage().(*syscall.Rusage).Minflt) * memPageSize

	fmt.Println(result.String())
}

func parseConfig(configStr *string) {
	config = Config{}
	if err := json.Unmarshal([]byte(*configStr), &config); err != nil {
		panic(err)
	}

	var err error
	if len(config.Args) == 1 {
		cmd = exec.Command(config.Command, strings.Split(config.Args[0], " ")...)
	} else {
		cmd = exec.Command(config.Command, config.Args...)
	}

	if len(config.StdinFile) > 0 {
		cmd.Stdin, err = os.OpenFile(config.StdinFile, os.O_RDONLY, 0644)
		if err != nil {
			panic(err)
		}
	} else {
		cmd.Stdin = os.Stdin
	}

	if len(config.StdoutFile) > 0 {
		cmd.Stdout, err = os.OpenFile(config.StdoutFile, os.O_WRONLY|os.O_CREATE, 0644)
		if err != nil {
			panic(err)
		}
	} else {
		cmd.Stdout = os.Stdout
	}

	if len(config.StderrFile) > 0 {
		cmd.Stderr, err = os.OpenFile(config.StderrFile, os.O_WRONLY|os.O_CREATE, 0644)
		if err != nil {
			panic(err)
		}
	} else {
		cmd.Stderr = os.Stderr
	}
}

// watcher need one cpu core to collect data, so if server have poll cpu, don't use it.
func upWatcher() {
	usage = Usage{}
	nowUsage := &Usage{}
	errs := make([]error, 0, 8)
	pids = make(map[int]bool)

	pids[cmd.Process.Pid] = true

	fs, err := procfs.NewFS("/proc")
	if err != nil {
		panic(err)
	}

	go killer()

	for range time.NewTicker(4 * time.Millisecond).C {
		if cmd.Process == nil {
			continue
		}

		if cmd.ProcessState != nil && cmd.ProcessState.Exited() {
			break
		}

		usageClear(nowUsage)
		err = resourceUsageCollect(&fs, cmd.Process.Pid, nowUsage)
		if err != nil {
			errs = append(errs, err)
			if len(errs) == 8 {
				panic(errs)
			}
		}

		usage.Lock()
		usage.outputByte = maxUint64(usage.outputByte, nowUsage.outputByte)
		usage.sysTimeUsed = maxUint64(usage.sysTimeUsed, nowUsage.sysTimeUsed)
		usage.userTimeUsed = maxUint64(usage.userTimeUsed, nowUsage.userTimeUsed)
		usage.memoryUsed = maxUint64(usage.memoryUsed, nowUsage.memoryUsed)
		usage.threadCount = maxUint32(usage.threadCount, nowUsage.threadCount)
		usage.Unlock()

	}

}

func usageClear(u *Usage) {
	u.Lock()
	u.threadCount = 0
	u.memoryUsed = 0
	u.userTimeUsed = 0
	u.sysTimeUsed = 0
	u.outputByte = 0
	u.Unlock()
}

func resourceUsageCollect(fs *procfs.FS, pid int, nowUsage *Usage) error {
	procs, err := fs.AllProcs()
	if err != nil {
		panic(err)
	}

	for _, proc := range procs {
		procStat, err := proc.Stat()
		if err != nil {
			delete(pids, proc.PID) // the program may be end
			continue
		}

		if proc.PID == pid || pids[procStat.PPID] {
			pids[proc.PID] = true
			procIo, err := proc.IO()
			if err != nil {
				delete(pids, proc.PID)
				continue
			}
			nowUsage.outputByte += procIo.WChar
			nowUsage.memoryUsed += uint64(procStat.VSize)
			nowUsage.sysTimeUsed += uint64(procStat.STime) * kernelTimeMod
			nowUsage.userTimeUsed += uint64(procStat.UTime) * kernelTimeMod
			nowUsage.threadCount += uint32(procStat.NumThreads)
		}
	}

	return nil
}

func maxUint64(a, b uint64) uint64 {
	if a > b {
		return a
	}
	return b
}

func maxUint32(a, b uint32) uint32 {
	if a > b {
		return a
	}
	return b
}

func killer() {

	go clockTimeKiller()
	for range time.NewTicker(100 * time.Microsecond).C {

		if cmd.Process == nil {
			continue
		}

		if cmd.ProcessState != nil && cmd.ProcessState.Exited() {
			return
		}

		if checkResource() {
			_ = cmd.Process.Kill()
			return
		}
	}
}

func checkResource() (needKill bool) {
	usage.RLock()
	defer usage.RUnlock()

	if config.MemoryLimit > 0 && usage.memoryUsed > config.MemoryLimit {
		result.Killer = "memory"
		return true
	}
	if config.ThreadCount > 0 && usage.threadCount > config.ThreadCount {
		result.Killer = "thread"
		return true
	}
	if config.CpuTimeLimit > 0 && int64(usage.sysTimeUsed+usage.userTimeUsed) > config.CpuTimeLimit {
		result.Killer = "cpu_time"
		return true
	}
	if config.OutputLimit > 0 && usage.outputByte > config.OutputLimit {
		result.Killer = "output"
		return true
	}

	return false
}

func clockTimeKiller() {
	if config.TimeLimit > 0 {
		time.Sleep(time.Duration(config.TimeLimit+10) * time.Millisecond)
		if cmd.ProcessState == nil {
			_ = cmd.Process.Kill()
			result.Killer = "clock_time"
		}
	}
	return
}
