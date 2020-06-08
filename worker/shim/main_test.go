// Author: Boxjan
// Datetime: 2020/4/22 18:27
// I don't know why, but it can work

package main

import (
	"Judger/worker"
	"fmt"
	"testing"
	"time"
)

func TestMain(m *testing.M) {
	isTesting = true

	conf.Command = "usage"
	conf.Limit = worker.GetDefaultLimit()

	cmd := configToExec(&conf)

	startTime := time.Now()
	if err := cmd.Start(); err != nil {
		fmt.Print(err)
	}

	err := cmd.Wait()

	if err != nil {
		fmt.Print(err)
	}

	endTime := time.Now()
	fmt.Print(startTime, endTime)

}

func TestGet(t *testing.T) {

}
