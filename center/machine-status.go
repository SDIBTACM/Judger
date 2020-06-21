// Author: Boxjan
// Datetime: 2020/5/28 00:44
// I don't know why, but it can work

package main

import (
	"context"
	"encoding/json"
	"github.com/SDIBTACM/Judger/public/proto/status"
	"github.com/SDIBTACM/Judger/public/redis"
	"github.com/micro/go-micro/v2/util/log"

	"time"
)

type MachineStatus struct {
}

func (ms *MachineStatus) Process(ctx context.Context, machineStatus *status.MachineStatus) {

	machineStatusJson, err := json.Marshal(machineStatus)
	if err != nil {
		log.Warn("marshal machine status to json meet error", err)
	}

	redisRes := redis.GetRedis().Set("oj:judger:machine:"+machineStatus.HostUuid+":status",
		string(machineStatusJson), 45*time.Second) // will update at every 15s
	if redisRes.Err() != nil {
		log.Warn("redis update machine status failed with error", redisRes.Err())
	}

}
