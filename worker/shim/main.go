// Author: Boxjan
// Datetime: 2020/4/22 15:38
// I don't know why, but it can work

package main

import (
	"Judger/public"
	"os"
	"os/exec"
	"sync"
	"time"
)

// It is running in docker/kvm to get the time and memory used.
// The shim was designed running in docker (runc, runsc)

type Usage struct {
	sync.RWMutex
}

type Result struct {
}

func main() {

	var err error

	cmd := exec.Command()

	startTime := time.Now()

	err = cmd.Start()
	if err != nil {

	}

	go upWatcher(cmd.Process, cmd.ProcessState)
	err = cmd.Wait()
	if err != nil {

	}

	endTime := time.Now()

}

func upWatcher(process *os.Process, state *os.ProcessState) {

}

func killer(process *os.Process, state *os.ProcessState) {

	var timeKillerChan, memoryKillerChan, ioKillerChan chan struct{}
	var timeStopChan, memoryStopChan, ioStopChan chan struct{}
	timeKillerChan = make(chan struct{})
	memoryKillerChan = make(chan struct{})
	ioKillerChan = make(chan struct{})
	timeStopChan = make(chan struct{})
	memoryStopChan = make(chan struct{})
	ioStopChan = make(chan struct{})

	go timeKiller(timeKillerChan, timeStopChan)
	go memoryKiller(memoryKillerChan, memoryStopChan)
	go ioKiller(ioKillerChan, ioStopChan)

	for {
		select {
		case <-timeKillerChan:
			goto stop
		case <-memoryKillerChan:
			goto stop
		case <-ioKillerChan:
			goto stop
		default:
			if state.Exited() {
				goto stop
			}
		}
	}

stop:
	timeStopChan <- struct{}{}
	memoryStopChan <- struct{}{}
	ioStopChan <- struct{}{}
}

func timeKiller(tip chan struct{}, stop chan struct{}) {

	for {
		select {
		case <-stop:
			return
		default:
			{

				tip <- struct{}{}
			}
		}
	}

}

func memoryKiller(tip chan struct{}, stop chan struct{}) {
	for {
		select {
		case <-stop:
			return
		default:
			{

				tip <- struct{}{}
			}
		}
	}
}

func ioKiller(tip chan struct{}, stop chan struct{}) {
	for {
		select {
		case <-stop:
			return
		default:
			{

				tip <- struct{}{}
			}
		}
	}
}

func resourceCollect(process *os.ProcessState) {
	process.Exited()
}

func ioUsageCollect(stopChan chan struct{}) {

}

func memUsageCollect(stopChan chan struct{}) {

	select {
	case <-stopChan:

	}
}
