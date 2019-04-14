@echo off

call info_gather.bat
mode con: cols=60 lines=3
echo     The Victims Computer Name	= 	%name%
echo     The Victims IPv4 Address	= 	%ipaddress%
pause >nul