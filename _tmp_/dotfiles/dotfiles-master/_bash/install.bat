:: Copyright (c) 2023 reiyuchan <iwakura.rei.tk@gmail.com>
:: Released under the MIT license
:: http://opensource.org/licenses/mit-license.php

@echo off

mklink /h %USERPROFILE%\.bashrc %~dp0\bashrc
attrib +h %USERPROFILE%\.bashrc

if not exist %USERPROFILE%\.bashrc (
    echo ERROR:Failed to install..
)
