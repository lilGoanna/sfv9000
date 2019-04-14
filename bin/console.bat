@echo off
title Console
mode con: cols=40 lines=30
call :checktitle
set /a number=0
cd bin\
del log.lmao
del command.bat
set exit=0
set matrix=0
set matrixspeed=normal

if not exist "reload.bat" (
start call "program.bat"
)
if exist "reload.bat" (
del "reload.bat"
)

for /l %%i in (1,1,100) do echo.
goto load

:checktitle
tasklist /fi "imagename eq cmd.exe" /fo list /v | find "Administrator:  Console" >nul
if %errorlevel%==0 goto checktitleadmin
bin\cmdow.exe "Console" /MOV 1 1 >nul
bin\cmdow.exe "Console" /ACT >nul

goto :eof


:checktitleadmin
bin\cmdow.exe "Administrator:  Console" /MOV 1 1 >nul 
bin\cmdow.exe "Administrator:  Console" /ACT >nul

goto :eof





:load
color 02
set /a number+=1
if %number%==100 goto active
title %random% %random% %random% %random% %random% %random%
echo %random% %random% %random% %random% %random% %random%
ping localhost -n 1 -w 0 >nul
goto load

:matrix
echo BOOTING DATASYSTEM [*]
timeout /t 2 >NUl
for /l %%i in (1,1,100) do echo.
goto top
:top
title %random% %random% %random% %random% %random% %random%
call command.bat >nul
if %matrix%==0 goto console
if %exit%==1 exit
color 02
echo %random% %random% %random% %random% %random% %random%
if %matrixspeed%==normal (
ping localhost -n 1 -w 0 >nul
)
goto top

:active
goto console

:console
title Console
color 0B
cls
if not exist log.lmao echo [Console] Welcome. >> log.lmao
if exist log.lmao type log.lmao
if not exist command.bat echo echo. >> command.bat
if exist command.bat call command.bat
if %matrix%==1 goto matrix
if %exit%==1 exit
ping localhost -n 1 >nul
goto console