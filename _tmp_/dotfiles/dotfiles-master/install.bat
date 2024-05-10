:: Copyright (c) 2023 reiyuchan <iwakura.rei.tk@gmail.com>
:: Released under the MIT license
:: http://opensource.org/licenses/mit-license.php

@echo off


for /f "delims=" %%i in ('dir /A:D /b ^| find "_"') do (
	if not exist %%i (
	echo ^"%%i" not found..
	echo ERROR:Failed to install..
	exit /b
	)
	cd %%i
	install.bat
	cd ..
)
exit /b
