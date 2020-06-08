// Author: Boxjan
// Datetime: 2020/5/2 13:53
// I don't know why, but it can work

package main

import (
	"syscall"
)

var ()

// The shim is working in docker.

type RunConfig struct {
	Command string
}

type Result struct {
	TestCase    int                `json:"test_case"`
	ClockTime   int64              `json:"clock_time"`
	SystemTime  int64              `json:"system_time"`
	UserTime    int64              `json:"user_time"`
	ProcMemory  uint64             `json:"proc_memory"`
	UsageMemory uint64             `json:"usage_memory"`
	Killer      bool               `json:"killer"`
	ExitCode    syscall.WaitStatus `json:"exit_code"`
}

func main() {

}

func Killer() {

}

func UsageCollect() {

}
