// Author: Boxjan
// Datetime: 2020/5/6 10:42
// I don't know why, but it can work

package model

import "time"

type Problem struct {
	ID                int64
	CreatedAt         time.Time `gorm:"Column:create_at"`
	UpdatedAt         time.Time `gorm:"Column:update_at"`
	TimeLimit         int32
	MemoryLimit       int32
	SpecialJudge      bool
	SimilarFrom       int64
	TestDataUpdatedAt time.Time
}
