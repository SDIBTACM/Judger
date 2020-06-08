// Author: Boxjan
// Datetime: 2020/5/27 22:16
// I don't know why, but it can work

package model

import "time"

type SolutionFullResult struct {
	ID         int64
	CreatedAt  time.Time `gorm:"Column:create_at"`
	UpdatedAt  time.Time `gorm:"Column:update_at"`
	SolutionId int64
	Data       string `gorm:"Type(longtext)"`
}
