// Author: Boxjan
// Datetime: 2020/5/6 11:11
// I don't know why, but it can work

package model

import "time"

// All Sql will write here

type Solution struct {
	ID             int64
	CreatedAt      time.Time `gorm:"Column:create_at"`
	UpdatedAt      time.Time `gorm:"Column:update_at"`
	Lang           int32
	Result         int32
	TimeUsed       int32
	MemoryUsed     int32
	SimilarAt      int64
	SimilarPercent int64
}

func (s *Solution) GetRunningCode() {

}
