// Author: Boxjan
// Datetime: 2020/5/16 14:37
// I don't know why, but it can work

package public

import "time"

type SolutionStatus int32

const (
	SolutionStatusRejudgePending SolutionStatus = -5 + iota
	SolutionStatusPending
	SolutionStatusPreparing
	SolutionStatusCompiling
	SolutionStatusRunning
	SolutionStatusAccept
	SolutionStatusPresentationError
	SolutionStatusWrongAnswer
	SolutionStatusTimeLimitExceed
	SolutionStatusMemoryLimitExceed
	SolutionStatusOutputLimitExceed
	SolutionStatusRuntimeError
	SolutionStatusCompileError
	SolutionStatusSystemError
	SolutionStatusFailedOther
)

var ModelTimeZero = time.Date(1900, 01, 01, 00, 00, 00, 00, time.UTC)

const ()
