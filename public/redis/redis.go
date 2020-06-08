// Author: Boxjan
// Datetime: 2020/5/28 02:32
// I don't know why, but it can work

package redis

import (
	"github.com/go-redis/redis"
)

var redisCli *redis.Client

func GetRedis() *redis.Client {
	return redisCli
}

func InitRedis(addr, password string) {
	var err error
	redisCli = redis.NewClient(&redis.Options{
		Network:   "",
		Addr:      addr,
		Dialer:    nil,
		OnConnect: nil,
		Password:  password,
	})
	_, err = redisCli.Ping().Result()
	if err != nil {
		panic(err)
	}
}
