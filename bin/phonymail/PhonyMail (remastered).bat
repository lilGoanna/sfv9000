@echo off

title PhonyMail (remastered) v1.0

color 0E
mode con: cols=60 lines=20

goto service

:startup
cls
type PhonyMail.logo
echo.
echo.
echo.
goto :eof

:service
call :startup
echo 	Service { Select your service }
echo.
echo 	1) anonymousemail4nothing@gmail
echo 	2) pmservice9000@gmail.com
echo 	3) anonpmservice@gmail.com
echo.
echo 	Q) quit
echo.
choice/c:123q /n /m "Press a key representing the service (1-3): "
if %errorlevel%==4 (
echo.
echo Terminating...
timeout /t 2 >nul
exit
)
if %errorlevel%==3 set service="anonpmservice@gmail.com"
if %errorlevel%==2 set service="pmservice9000@gmail.com"
if %errorlevel%==1 set service="anonymousemail4nothing@gmail"

:from
call :startup
echo 	Service { %service% }
echo.
echo 	From { Enter Your Fake Email }
echo.
echo :	=-----------------------=
set /p fakie=:	= 

:rcpt
call :startup
echo 	Service { %service% }
echo.
echo 	From { %fakie% }
echo.
echo 	RCPT { Enter Recipient Email }
echo.
echo :	=-----------------------=
set /p rcpt=:	= 

:subject
call :startup
echo 	Service { %service% }
echo.
echo 	From { %fakie% }
echo.
echo 	RCPT { %rcpt% }
echo.
echo 	Subject { Enter Subject }
echo.
echo :	=-----------------------=
set /p subject=:	= 

:body
call :startup
echo 	Service { %service% }
echo.
echo 	From { %fakie% }
echo.
echo 	RCPT { %rcpt% }
echo.
echo 	Subject { %subject% }
echo.
echo 	Enter Body (end with "send" alone on last line)
echo.

goto send

:message
set /p body=": "
if "%body%"=="send" goto send
goto message

:send
call :startup
echo Enter Message - When finished CTRL+Z on it's own line
sendEmail.exe -f %fakie% -t %rcpt% -s smtp.gmail.com -xu %service% -xp ANONYMOUS01 -o tls=auto -u %subject% >nul
if %errorlevel%==1 echo Something Went Wrong... && ping localhost -n 3 >nul && exit
color a0
echo.
echo Message sent successfully!
echo.
echo ^> {%rcpt%] from ^> {%fakie%} ^> using service {%service%}
ping localhost -n 3 >nul
exit
