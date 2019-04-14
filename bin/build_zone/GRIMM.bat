@echo off
echo this batch file is not ready
pause
exit

:loop
ping <IP Address> -l 65500 -w 1 -n 1
goto :loop