:: Copyright (©) 2023 Jesse Hodgson. All Rights Reserved.

echo Hello

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

reg add "HKEY_CURRENT_USER\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry /t REG_SZ /d "0" /f
sc config DiagTrack start= disabled

reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Search" /v BingSearchEnabled /t REG_SZ /d "0" /f
powershell -windowstyle hidden -command "Start-Process cmd -ArgumentList '/s,/c,REG Add "HKEY_CURRENT_USER\SOFTWARE\Policies\Microsoft\Windows\Explorer" /V DisableSearchBoxSuggestions /T REG_DWORD /D 1 /F' -Verb runAs"

reg add "HKEY_LOCAL_MACHINE\SYSTEM\Setup\LabConfig" /v BypassTPMCheck /t REG_SZ /d "1" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\Setup\LabConfig" /v BypassSecureBootCheck /t REG_SZ /d "1" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\Setup\LabConfig" /v BypassRAMCheck /t REG_SZ /d "1" /f

cleanmgr.exe /sagerun:1

C:/Windows/SysWOW64/Msinfo32.exe /nfo sysinfo.nfo

echo x=msgbox("Program complete! Your system will no longer spy on you. You may now close this window." ,0, "Windows Alerts") >> msgbox.vbs

start msgbox.vbs

DEL msgbox.vbs

taskkill /f /im explorer.exe
start explorer.exe

echo Command completed! You may now close this window.

pause