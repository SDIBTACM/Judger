// Author: Boxjan
// Datetime: 2020/5/5 11:55
// I don't know why, but it can work

package main

import (
	"encoding/json"
	"errors"
	"github.com/micro/go-micro/v2/config"
	"github.com/micro/go-micro/v2/config/source"
	"github.com/nats-io/nats.go"
	"gopkg.in/ini.v1"
	"gopkg.in/yaml.v2"
	"io/ioutil"
	"path/filepath"
	"time"
)

type Config struct {
	Env         string
	Nats        NatsOption `json:"nats" ini:"nats" yaml:"nats"`
	natsOptions *nats.Options
	Db          DbOption    `json:"database" ini:"database" yaml:"database"`
	Oj          OjOption    `json:"online-judge" ini:"online-judge" yaml:"online-judge"`
	Redis       RedisOption `json:"redis" ini:"redis" yaml:"redis"`
}

var conf Config

type NatsOption struct {
	Url             string   `json:"url" ini:"url" yaml:"url"`
	Servers         []string `json:"servers" ini:"servers,omitempty,allowshadow" yaml:"servers"`
	Name            string   `json:"name" ini:"name" yaml:"name"`
	Timeout         int      `json:"timeout" ini:"timeout" yaml:"timeout"`
	User            string   `json:"user" ini:"user,omitempty" yaml:"user"`
	Password        string   `json:"password" ini:"password,omitempty" yaml:"password"`
	Token           string   `json:"token" ini:"token,omitempty" yaml:"token"`
	NkeyFile        string   `json:"nkey_file" ini:"nkey_file,omitempty" yaml:"nkey_file"`
	CredentialsFile string   `json:"credentials_file" ini:"credentials_file,omitempty" yaml:"credentials_file" `
}

type DbOption struct {
	Type    string `json:"type" ini:"type" yaml:"type"`
	DSN     string `json:"dsn" ini:"dsn" yaml:"dsn"`
	Migrate bool   `json:"migrate" ini:"migrate" yaml:"migrate"` // create update false
}

type OjOption struct {
	TestDataStorePath     string `json:"test_data_store_path" ini:"test_data_store_path" yaml:"test_data_store_path"`
	TestDataTransportType string `json:"test_data_transport_type" ini:"test_data_transport_type" yaml:"test_data_transport_type"`
}

type RedisOption struct {
	Addr     string `json:"addr" ini:"addr" yaml:"addr"`
	Password string `json:"password" int:"password" yaml:"password"`
}

func init() {
	conf = Config{}
}

func InitConfigFromSource(Src source.Source) {
	confLoder, err := config.NewConfig()
	if err != nil {
		panic(err)
	}

	if err = confLoder.Load(Src); err != nil {
		panic(err)
	}

	configFilePath := confLoder.Get("config").String("")

	if configFilePath == "" {
		panic(errors.New("unknown config file path"))
	}

	switch filepath.Ext(configFilePath) {
	case ".json":
		err = parseJson(configFilePath)
	case ".ini":
		err = parseIni(configFilePath)
	case ".yaml":
		err = parseYaml(configFilePath)
	default:
		err = errors.New("unknown config format")
	}

	if err != nil {
		panic(err)
	}
	conf.parseNatsConfig()
}

func GetConfig() *Config {
	return &conf
}

func (c *Config) GetNatsOptions() nats.Options {
	return *conf.natsOptions
}

func (c *Config) parseNatsConfig() {
	var natsOption nats.Option
	var err error
	c.natsOptions = &nats.Options{}

	if c.Nats.CredentialsFile != "" {
		natsOption = nats.UserCredentials(c.Nats.CredentialsFile)
	} else if c.Nats.NkeyFile != "" {
		natsOption, err = nats.NkeyOptionFromSeed(c.Nats.NkeyFile)
		if err != nil {
			panic(err)
		}
	}

	if natsOption != nil {
		err = natsOption(c.natsOptions)
		if err != nil {
			panic(err)
		}
	}

	c.natsOptions.Url = c.Nats.Url
	c.natsOptions.Servers = c.Nats.Servers
	c.natsOptions.Name = c.Nats.Name
	c.natsOptions.AllowReconnect = true
	c.natsOptions.ReconnectWait = 1 * time.Second
	c.natsOptions.PingInterval = 1 * time.Second
	c.natsOptions.User = c.Nats.User
	c.natsOptions.Password = c.Nats.Password
	c.natsOptions.Token = c.Nats.Token

}

func parseJson(file string) error {
	bytes, err := ioutil.ReadFile(file)
	if err != nil {
		return err
	}
	return json.Unmarshal(bytes, &conf)
}

func parseIni(file string) error {
	return ini.MapTo(&conf, file)
}

func parseYaml(file string) error {
	bytes, err := ioutil.ReadFile(file)
	if err != nil {
		return err
	}
	return yaml.Unmarshal(bytes, &conf)
}
