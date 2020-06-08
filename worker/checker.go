// Author: Boxjan
// Datetime: 2020/5/24 23:02
// I don't know why, but it can work

package main

import (
	"Judger/public"
	"io"
)

func doChecker(stdout, userOut io.Reader) public.SolutionStatus {

	return normalChecker()
}

func doSpecialJudge(stdinFilePath, stdoutFilePath, userOutFilePath string) public.SolutionStatus {

	return public.SolutionStatusAccept
}

func zojChecker() public.SolutionStatus {
	return public.SolutionStatusAccept
}

func normalChecker() public.SolutionStatus {
	return public.SolutionStatusAccept
}

func diffChecker() public.SolutionStatus {
	return public.SolutionStatusAccept
}
