// Author: Boxjan
// Datetime: 2020/5/30 17:31
// I don't know why, but it can work

package healthy

import (
	"context"
	"github.com/SDIBTACM/Judger/public/proto/status"
	"github.com/micro/go-micro/v2"
	"github.com/micro/go-micro/v2/util/log"
	"github.com/shirou/gopsutil/host"
	"github.com/shirou/gopsutil/load"
	"github.com/shirou/gopsutil/mem"
	"time"
)

func SentMachineStatus(p micro.Publisher) {
	hostInfo, err := host.Info()
	if err != nil {
		log.Fatal(err)
	}
	machineStatus := &status.MachineStatus{
		Hostname: hostInfo.Hostname,
		HostUuid: hostInfo.HostID,
		Load:     &status.Load{},
		Memory:   &status.Memory{},
		Docker:   &status.Docker{},
		Disk:     nil,
	}

	ticker := time.NewTicker(15 * time.Second)

	go func() {
		for _ = range ticker.C {
			if err := CollectMachineStatus(machineStatus); err != nil {
				log.Error("collect machine status failed with error:", err)
			}
			if err := p.Publish(context.Background(), machineStatus); err != nil {
				log.Warn("sent machine status failed with error:", err)
			}
		}
	}()
}

func CollectMachineStatus(ms *status.MachineStatus) error {
	errs := make([]error, 0, 3)

	if misc, err := load.Misc(); err == nil {
		ms.Load.ProcTotal = int32(misc.ProcsTotal)
		ms.Load.ProcRunning = int32(misc.ProcsRunning)
		ms.Load.ProcBlocked = int32(misc.ProcsBlocked)
	} else {
		errs = append(errs, err)
	}

	if avg, err := load.Avg(); err == nil {
		ms.Load.OneMinLoad = float32(avg.Load1)
		ms.Load.FifteenMinLoad = float32(avg.Load5)
		ms.Load.FifteenMinLoad = float32(avg.Load15)
	} else {
		errs = append(errs, err)
	}

	if m, err := mem.VirtualMemory(); err == nil {
		ms.Memory.TotalMem = m.Total
		ms.Memory.FreeMem = m.Free
		ms.Memory.TotalSwap = m.SwapTotal
		ms.Memory.FreeSwap = m.SwapFree
	} else {
		errs = append(errs, err)
	}

	return nil
}
