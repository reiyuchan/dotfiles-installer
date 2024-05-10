:: Copyright (c) 2023 reiyuchan <iwakura.rei.tk@gmail.com>
:: Released under the MIT license
:: http://opensource.org/licenses/mit-license.php

@echo off

set DEST_DIR=%USERPROFILE%\dotfiles
set GH_USER=reiyuchan
set GH_REPO=dotfiles
set GH_BRANCH=master

set GH_REPO_URL=https://github.com/%GH_USER%/%GH_REPO%

set OG_PWD=%cd%

if exist %DEST_DIR% (
	echo %DEST_DIR% already exists
	exit /b
)

where /q git
if %ERRORLEVEL% == 0 (
	echo Downloading the files..
	git clone "%GH_REPO_URL%" "%DEST_DIR%"
	cd %DEST_DIR%
	echo Installing..
	install.bat
	cd %OG_PWD%
	exit /b
)
