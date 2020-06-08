// Author: Boxjan
// Datetime: 2020/5/28 10:45
// I don't know why, but it can work

package db

import (
	"github.com/jinzhu/gorm"
	_ "github.com/jinzhu/gorm/dialects/mysql"
	_ "github.com/jinzhu/gorm/dialects/sqlite"
)

var db *gorm.DB

func GetDb() *gorm.DB {
	return db
}

func InitDb(dbType, dbDsn string) {
	var err error
	db, err = gorm.Open(dbType, dbDsn)
	if err != nil {
		panic(err)
	}
}
