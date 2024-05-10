:: Copyright (c) 2023 reiyuchan <iwakura.rei.tk@gmail.com>
:: Released under the MIT license
:: http://opensource.org/licenses/mit-license.php

@echo off

set DESTDIR=%APPDATA%\Code\User
set DESTDIR_DATA=%USERPORFILE%\.vscode

mkdir %DESTDIR%
mkdir %DESTDIR_DATA%

mklink /h %DESTDIR%\settings.json %~dp0\settings.json
mklink /h %DESTDIR_DATA%\argv.json %~dp0\argv.json
