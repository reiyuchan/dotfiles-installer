#!/bin/sh

# Copyright (c) 2023 reiyuchan <iwakura.rei.tk@gmail.com>
# Released under the MIT license
# http://opensource.org/licenses/mit-license.php

DIR=$(cd $(dirname $0);pwd)

ln -sf $DIR/zshrc ~/.zshrc

if [ ! -e ~/.zshrc ]
then
	echo ERROR:Failed to install..
fi
