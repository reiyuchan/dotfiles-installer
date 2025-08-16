#!/bin/bash

# Copyright (c) 2024 reiyuchan <iwakura.rei.tk@gmail.com>
# Released under the MIT license
# http://opensource.org/licenses/mit-license.php

OS=("windows" "darwin" "linux")
OSARCH=("amd64" 386)

SRC_DIR="src"
BUILD_DIR="../bin/"
WIN_EXT=".exe"

for os in "${OS[@]}"; do
	for os_arch in "${OSARCH[@]}"; do
		GOOS=$os
		GOARCH=$os_arch
		if [ "$os" == "windows" ]; then
		go build -C "$SRC_DIR" -o "$BUILD_DIR/app-$os-$os_arch$WIN_EXT" main.go
		else
		go build -C "$SRC_DIR" -o "$BUILD_DIR/app-$os-$os_arch" main.go
		fi
	done
done


