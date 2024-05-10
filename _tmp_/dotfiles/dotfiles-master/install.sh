#!/bin/sh

# Copyright (c) 2023 reiyuchan <iwakura.rei.tk@gmail.com>
# Released under the MIT license
# http://opensource.org/licenses/mit-license.php

DIR=$(cd $(dirname $0); pwd)

DEST_DIRS="$DIR/_*"
file="install.sh"
for DIR in $DEST_DIRS; do
	if [ -e $DIR ] ; then
		cd $DIR
		if [ -e $file ]; then
			./install.sh
		fi
		cd ..	
	else
		echo ERROR:Failed to install..
		echo "$file" not found
		exit
	fi
done
