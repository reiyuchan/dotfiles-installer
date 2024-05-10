:: Copyright (c) 2023 reiyuchan <iwakura.rei.tk@gmail.com>
:: Released under the MIT license
:: http://opensource.org/licenses/mit-license.php

@echo off

mklink /h %USERPROFILE%\.zshrc %~dp0\zshrc
attrib +h %USERPROFILE%\.zshrc

if not exist %USERPROFILE%\.zshrc (
    echo ERROR:Failed to install..
)
