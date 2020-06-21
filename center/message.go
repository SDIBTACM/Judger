// Author: Boxjan
// Datetime: 2020/5/27 23:51
// I don't know why, but it can work

package main

import (
	"github.com/micro/go-micro/v2"
	"github.com/micro/go-micro/v2/client"
)

var (
	JobPipe micro.Event

	RealStatusMsgPipe  micro.Event
	FinalStatusMsgPipe micro.Event

	MachineStatusPipe micro.Event
)

func initMessageQue(client client.Client) {
	JobPipe = micro.NewEvent(namespace("topic.job"), client)

	RealStatusMsgPipe = micro.NewEvent(namespace("topic.realtime-status"), client)
	FinalStatusMsgPipe = micro.NewEvent(namespace("topic.final-status"), client)

	MachineStatusPipe = micro.NewEvent(namespace("topic.machine-status"), client)
}
