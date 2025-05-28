@echo off
setlocal enabledelayedexpansion
TITLE WinOptiMaze v0.1 - GPU Drivers and DWM Restarter
cls
echo github.com/ny4rlk0/WinOptiMaze
echo _______________________________________________________________
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Requesting administrator privileges...
    powershell -Command "Start-Process '%~0' -Verb RunAs"
    exit /b
)
echo Restarting DWM
powershell -Command "Stop-Process -Name dwm -Force"
powershell -Command "Start-Process dwm"
cls
echo Restarting GPU Drivers
for /f "tokens=*" %%A in ('powershell -Command "Get-PnpDevice | Where-Object {$_.Class -eq 'Display'} | Select-Object -ExpandProperty InstanceId"') do (
    set "gpu=%%A"
    echo Restarting driver for: !gpu!
    powershell -Command "Get-PnpDevice -InstanceId '!gpu!' | Disable-PnpDevice -Confirm:$false"
	timeout /t 1 >nul 2>&1
	pnputil /disable-device "!gpu!" >nul 2>&1
	timeout /t 1 >nul 2>&1
	pnputil /enable-device "!audio!" >nul 2>&1
	timeout /t 1 >nul 2>&1
    powershell -Command "Get-PnpDevice -InstanceId '!gpu!' | Enable-PnpDevice -Confirm:$false"
)
::Go Back To Main Menu
curl -o MainMenu.bat https://raw.githubusercontent.com/ny4rlk0/WinOptiMaze/refs/heads/main/MainMenu.bat &&start /b "" cmd /c MainMenu.bat
::Exit From This Instance
start /b "" cmd /c del "%~f0"&exit /b
