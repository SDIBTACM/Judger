// Author: Boxjan
// Datetime: 2020/5/4 18:17
// I don't know why, but it can work

package main

import (
	"github.com/SDIBTACM/Judger/public/db"
	"github.com/SDIBTACM/Judger/public/redis"
	"github.com/SDIBTACM/Judger/public/version"
	"github.com/micro/cli/v2"
	"github.com/micro/go-micro/v2"
	natsBroker "github.com/micro/go-micro/v2/broker/nats"
	"github.com/micro/go-micro/v2/config/source"
	cliSource "github.com/micro/go-micro/v2/config/source/cli"
	natsRegistry "github.com/micro/go-plugins/registry/nats/v2"
	natsTransport "github.com/micro/go-plugins/transport/nats/v2"
	"log"
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
	db.InitDb(GetConfig().Db.Type, GetConfig().Db.DSN)
	redis.InitRedis(GetConfig().Redis.Addr, GetConfig().Redis.Password)
}

func main() {

	reg := natsRegistry.NewRegistry(natsRegistry.Options(GetConfig().GetNatsOptions()))
	br := natsBroker.NewBroker(natsBroker.Options(GetConfig().GetNatsOptions()))
	tran := natsTransport.NewTransport(natsTransport.Options(GetConfig().GetNatsOptions()))

	service := micro.NewService(
		micro.Name(namespace("center")),
		micro.Registry(reg),
		micro.Broker(br),
		micro.Transport(tran),
		micro.Version(version.Version),
	)

	service.Init()

	nc, err := (*conf.natsOptions).Connect()
	if err != nil {
		log.Fatal(err)
	}
	defer nc.Close()

	initMessageQue(service.Client())

	if err := service.Run(); err != nil {
		panic(err)
	}

}

func namespace(serviceName string) string {
	return namespaceBase + "." + serviceName
}
