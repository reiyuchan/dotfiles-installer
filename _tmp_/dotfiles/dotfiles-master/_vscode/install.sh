#!/bin/sh

# Copyright (c) 2023 reiyuchan <iwakura.rei.tk@gmail.com>
# Released under the MIT license
# http://opensource.org/licenses/mit-license.php

DIR=$(cd $(dirname $0); pwd)
if  [ "$XDG_CONFIG_HOME" = "" ]
then
	XDG_CONFIG_HOME="$HOME/.config"
fi
DESTDIR="$XDG_CONFIG_HOME/Code/User"
DESTDIR2="$XDG_CONFIG_HOME/Code - Insiders/User"
DESTDIR3="$XDG_CONFIG_HOME/Code - OSS/User"

DESTDIR_DATA="$HOME/.vscode/"
DESTDIR2_DATA="$HOME/.vscode-insiders/"
DESTDIR3_DATA="$HOME/.vscode-oss/"

mkdir -p "$DESTDIR" &>/dev/null
mkdir -p "$DESTDIR2" &>/dev/null
mkdir -p "$DESTDIR3" &>/dev/null
mkdir -p "$DESTDIR_DATA" &>/dev/null
mkdir -p "$DESTDIR2_DATA" &>/dev/null
mkdir -p "$DESTDIR3_DATA" &>/dev/null

ln -sf "$DIR/settings.json" "$DESTDIR/settings.json"
ln -sf "$DIR/settings.json" "$DESTDIR2/settings.json"
ln -sf "$DIR/settings.json" "$DESTDIR3/settings.json"
ln -sf "$DIR/argv.json" "$DESTDIR_DATA/argv.json"
ln -sf "$DIR/argv.json" "$DESTDIR2_DATA/argv.json"
ln -sf "$DIR/argv.json" "$DESTDIR3_DATA/argv.json"

if [ ! -e "$DESTDIR/settings.json" ]
then
	echo ERROR:Failed to install..
fi
