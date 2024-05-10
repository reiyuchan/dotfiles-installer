#!/bin/bash

# Copyright (c) 2023 reiyuchan <iwakura.rei.tk@gmail.com>
# Released under the MIT license
# http://opensource.org/licenses/mit-license.php

DEST_DIR="$(HOME)/dotfiles"
GH_USER="reiyuchan"
GH_REPO="dotfiles"
GH_BRANCH="master"

GH_REPO_URL="https://github.com/$(GH_USER)/$(GH_REPO)"
#GH_REPO_SSH="git@github.com:$(GH_USER)/$(GH_REPO)"

OG_PWD=$(pwd)

if [ -e "$DEST_DIR" ]
then
	echo "$DEST_DIR already exists"
	exit
fi

if type git &>/dev/null
then
	echo Downloading the files..
	git clone "$GH_REPO_URL" -b "$GH_BRANCH" "$DEST_DIR"
	cd "$DEST_DIR"
	echo Installing..
	./install.sh
	cd $OG_PWD
	exit
else
	echo git not found installation failed..
	exit
fi

