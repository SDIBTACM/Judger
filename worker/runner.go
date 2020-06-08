// Author: Boxjan
// Datetime: 2020/4/22 15:45
// I don't know why, but it can work

package main

import (
	"syscall"
	"time"
)

type Runner struct {
	Command string `json:"command"`
	Limit   `json:"limit"`
	InOuts  []InOut
	StartAt time.Time `json:"-"`
	EndAt   time.Time `json:"-"`
}

type Limit struct {
	MaxTime   int64  `json:"max_time"`   // ms
	MaxMemory uint64 `json:"max_memory"` // bytes
	MaxPid    int    `json:"max_pid"`
}

type InOut struct {
	InFile  string `json:"in_file"`
	OutFile string `json:"out_file"`
	ErrFile string `json:"err_file"`
}

func GetDefaultLimit() Limit {
	return Limit{
		MaxTime:   1000,             // 1s
		MaxMemory: 32 * 1024 * 1024, // 32 M
		MaxPid:    4,
	}
}

type Status struct {
	Runner      *Runner            `json:"-"`
	ClockTime   int64              `json:"clock_time"`
	SystemTime  int64              `json:"system_time"`
	UserTime    int64              `json:"user_time"`
	ProcMemory  uint64             `json:"proc_memory"`
	UsageMemory uint64             `json:"usage_memory"`
	Killer      bool               `json:"killer"`
	ExitCode    syscall.WaitStatus `json:"exit_code"`
}

const (
	KillerNull int = iota
	KillerMemory
	KillerSysTime
	KillerUserTime
	KillerClockTime
)
