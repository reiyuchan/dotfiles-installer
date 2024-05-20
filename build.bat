:: Copyright (c) 2024 reiyuchan <iwakura.rei.tk@gmail.com>
:: Released under the MIT license
:: http://opensource.org/licenses/mit-license.php

@echo off

set OS=windows linux darwin
set OSARCH=amd64 386

set SRC_DIR=src
set BUILD_DIR=..\bin
set WIN_EXT=.exe

for %%o in (%OS%) do (
	for %%a in (%OSARCH%) do (
		set GOOS=%%o
		set GOARCH=%%a
		if "%%o"=="windows" (
		go build -C "%SRC_DIR%" -o "%BUILD_DIR%\app-%%o-%%a%WIN_EXT%" main.go
		)
		go build -C "%SRC_DIR%" -o "%BUILD_DIR%\app-%%o-%%a" main.go
	)
)

