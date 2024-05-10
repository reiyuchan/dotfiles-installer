:: Copyright (c) 2023 reiyuchan <iwakura.rei.tk@gmail.com>
:: Released under the MIT license
:: http://opensource.org/licenses/mit-license.php

@echo off

mklink /h %USERPROFILE%\cmdrc.bat %~dp0\cmdrc.bat
attrib +h %USERPROFILE%\cmdrc.bat
reg add "HKEY_CURRENT_USER\Software\Microsoft\Command Processor" /v AutoRun /d %USERPROFILE%\cmdrc.bat /f

if not exist %USERPROFILE%\cmdrc.bat (
    echo ERROR:Failed to install..
    reg delete "HKEY_CURRENT_USER\Software\Microsoft\Command Processor" /v AutoRun /f >NUL 2>&1
)
