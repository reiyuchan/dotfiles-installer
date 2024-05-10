#!/bin/sh

# Copyright (c) 2023 reiyuchan <iwakura.rei.tk@gmail.com>
# Released under the MIT license
# http://opensource.org/licenses/mit-license.php

DIR=$(cd $(dirname $0); pwd)
DESTDIR=~/.config/powershell

mkdir -p "$DESTDIR" >/dev/null 2>&1
ln -sf $DIR/profile.ps1 $DESTDIR/profile.ps1

if [ ! -e ~/.config/powershell/profile.ps1 ]
then
	echo ERROR:Failed to install..
	rm $DESTDIR/profile.ps1
fi
