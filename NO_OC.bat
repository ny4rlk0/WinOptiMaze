@echo off
TITLE WinOptiMaze v0.1 
cls
echo github.com/ny4rlk0/WinOptiMaze
echo _______________________________________________________________
if "%~1" neq "skip" goto getAdmin
:getAdmin
net session >nul 2>&1
if %errorlevel% neq 0 (
	echo %~nx0: Requesting Administrative privileges.
	echo %~nx0: Adjusting system for NO OVERCLOCK.
	powershell -Command "Start-Process '%~f0' -ArgumentList 'skip' -Verb RunAs"
	exit /b
)

::Kodu buraya yaz::
curl -o %HOMEDRIVE%\power_unlock.reg https://raw.githubusercontent.com/ny4rlk0/WinOptiMaze/refs/heads/main/power_unlock.reg
curl -o %HOMEDRIVE%\NO_OC_WinOptiMaze.pow https://raw.githubusercontent.com/ny4rlk0/WinOptiMaze/refs/heads/main/NO_OC_WinOptiMaze.pow
curl -o %HOMEDRIVE%\Balanced_WinOptiMaze.pow https://raw.githubusercontent.com/ny4rlk0/WinOptiMaze/refs/heads/main/Balanced_WinOptiMaze.pow
powershell -command "([regex]::Matches((powercfg -list), 'GUID: ([\w-]+)') | ForEach-Object { $_.Groups[1].Value }) | ForEach-Object { powercfg -delete $_ }"
regedit /s %HOMEDRIVE%\power_unlock.reg
powershell -command "powercfg /import %HOMEDRIVE%\NO_OC_WinOptiMaze.pow"
timout /t 1
powershell -command "powercfg /import %HOMEDRIVE%\Balanced_WinOptiMaze.pow"
timout /t 1
for /f "tokens=4" %%f in ('powercfg -list ^| findstr /C:"NO_OC_WinOptiMaze"') do set GUID=%%f
powercfg /S %GUID%
del %HOMEDRIVE%\power_unlock.reg
del %HOMEDRIVE%\NO_OC_WinOptiMaze.pow
del %HOMEDRIVE%\Balanced_WinOptiMaze.pow
start /b "" cmd /c del "%~f0"&exit /b
::Kodu buraya yaz:: 
