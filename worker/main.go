// Author: Boxjan
// Datetime: 2020/5/2 13:52
// I don't know why, but it can work

package main

import (
	"github.com/SDIBTACM/Judger/public/version"
	"github.com/micro/cli/v2"
	"github.com/micro/go-micro/v2"
	natsBroker "github.com/micro/go-micro/v2/broker/nats"
	"github.com/micro/go-micro/v2/config/source"
	cliSource "github.com/micro/go-micro/v2/config/source/cli"
	natsRegistry "github.com/micro/go-plugins/registry/nats/v2"
	natsTransport "github.com/micro/go-plugins/transport/nats/v2"
)

const namespaceBase = "cn.edu.sdtbu.onlinejudge.judger"

func init() {
	configLoader := micro.NewService()
	var cliSrc source.Source
	configLoader.Init(
		micro.Action(func(context *cli.Context) error {
			cliSrc = cliSource.NewSource(cliSource.Context(context))
			return nil
		}),
	)
	InitConfigFromSource(cliSrc)
}

func main() {

	reg := natsRegistry.NewRegistry(natsRegistry.Options(GetConfig().GetNatsOptions()))
	br := natsBroker.NewBroker(natsBroker.Options(GetConfig().GetNatsOptions()))
	tran := natsTransport.NewTransport(natsTransport.Options(GetConfig().GetNatsOptions()))

	service := micro.NewService(
		micro.Name(namespace("worker")),
		micro.Registry(reg),
		micro.Broker(br),
		micro.Transport(tran),
		micro.Version(version.Version),
	)

	service.Init()

	// Sent Job
	job := micro.NewEvent(namespace("topic.job"), service.Client())
	status := micro.NewEvent(namespace("topic.status"), service.Client())

}

func namespace(serviceName string) string {
	return namespaceBase + "." + serviceName
}
