:: Copyright (c) 2023 reiyuchan <iwakura.rei.tk@gmail.com>
:: Released under the MIT license
:: http://opensource.org/licenses/mit-license.php

@echo off

mklink /h %USERPROFILE%\.vimrc %~dp0\vimrc
attrib +h %USERPROFILE%\.vimrc

if not exist %USERPROFILE%\.vimrc (
echo ERROR:Failed to install..
)
