#!/bin/bash

# Copyright (c) 2024 reiyuchan <iwakura.rei.tk@gmail.com>
# Released under the MIT license
# http://opensource.org/licenses/mit-license.php

OS=("windows" "darwin" "linux")
OSARCH=("amd64" 386)

SRC_DIR="src"
BUILD_DIR="../bin/"
WIN_EXT=".exe"
APP_NAME="workshopdl"

pwd="$(dirname "$0")"
cd $pwd/$SRC_DIR
for os in "${OS[@]}"; do
	for os_arch in "${OSARCH[@]}"; do
		if [ "$os" == "windows" ]; then
		if [ "$os_arch" == "amd64" ]; then
		goversioninfo -64 -icon ../res/icon.ico
		else
		goversioninfo -icon ../res/icon.ico
		fi
		GOOS=$os GOARCH=$os_arch go build -ldflags "-s -w" -o "$BUILD_DIR/$APP_NAME-$os-$os_arch$WIN_EXT" main.go
		else
		GOOS=$os GOARCH=$os_arch go build -ldflags "-s -w" -o "$BUILD_DIR/$APP_NAME-$os-$os_arch" main.go
		fi
	done
done

rm -rf resource.syso
cd $pwd
