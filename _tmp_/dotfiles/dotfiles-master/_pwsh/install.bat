:: Copyright (c) 2023 reiyuchan <iwakura.rei.tk@gmail.com>
:: Released under the MIT license
:: http://opensource.org/licenses/mit-license.php

@echo off

set DESDIR = "%USERPROFILE%\WindowsPowerShell"

mkdir %DESDIR%
mklink /h %DESDIR%\profile.ps1 %~dp0\profile.ps1 

if not exist %DESDIR%\profile.ps1 (
	echo ERROR:Failed to install..
	rm %DESDIR%\profile.ps1
)
