@echo off >nul 2>&1
TITLE WinOptiMaze v1.0 
mode con: cols=100 lines=30
cls

if "%~1" neq "skip" goto getAdmin
:getAdmin
net session >nul 2>&1
if %errorlevel% neq 0 (
	mode con: cols=100 lines=30
	color F0
	TITLE WinOptiMaze v1.0
	cls
	echo   %~nx0: 
	echo     Requesting Administrative privileges.
	powershell -Command "Start-Process '%~f0' -ArgumentList 'skip' -Verb RunAs"
	::pause >nul 2>&1
	exit /b
)
del "%SystemDrive%\Services.msc.bat"
del "%SystemDrive%\ResetWindowsSettings.bat"
del "%SystemDrive%\NO_OC.bat"
del "%SystemDrive%\Balanced_OC.bat"
del "%SystemDrive%\Restart_DWM_GPU_DRIVERS.bat"
del "%SystemDrive%\Restart_GPU_AUDIO_DWM.bat"
cls
:menu
mode con: cols=100 lines=30
color F0
cls
echo ----------------------------------------------------------------------
echo "     __        ___        ___        _   _ __  __                  ";
echo "     \ \      / (_)_ __  / _ \ _ __ | |_(_)  \/  | __ _ _______    ";
echo "      \ \ /\ / /| | '_ \| | | | '_ \| __| | |\/| |/ _` |_  / _ \   ";
echo "       \ V  V / | | | | | |_| | |_) | |_| | |  | | (_| |/ /  __/   ";
echo "        \_/\_/  |_|_| |_|\___/| .__/ \__|_|_|  |_|\__,_/___\___|   ";
echo "                              |_|                                  ";
echo "                   github.com/ny4rlk0/WinOptiMaze                  ";
echo ----------------------------------------------------------------------
echo  Choose an option:
echo ----------------------------------------------------------------------
echo    1) Optimize Services.MSC
echo    2) Reset Windows Settings
echo    3) NO Overclock Power Settings
echo    4) Balanced Overclock Power Settings
echo    5) Restart DWM - GPU Drivers
echo    6) Restart DWM - GPU/Audio Drivers
echo    7) Activate Windows (Massgravel)
echo    8) Exit
echo ----------------------------------------------------------------------
set /p choice="Enter your choice: "

if "%choice%"=="1" call :_1
if "%choice%"=="2" call :_2
if "%choice%"=="3" call :_3
if "%choice%"=="4" call :_4
if "%choice%"=="5" call :_5
if "%choice%"=="6" call :_6
if "%choice%"=="7" call :_7
if "%choice%"=="8" call :_8
goto menu

:_1
curl -o "%SystemDrive%\Services.msc.bat" https://raw.githubusercontent.com/ny4rlk0/WinOptiMaze/refs/heads/main/Services.msc.bat &&start /b "" cmd /c %SystemDrive%\Services.msc.bat
goto menu
:_2
curl -o "%SystemDrive%\ResetWindowsSettings.bat" https://raw.githubusercontent.com/ny4rlk0/WinOptiMaze/refs/heads/main/ResetWindowsSettings.bat &&start /b "" cmd /c %SystemDrive%\ResetWindowsSettings.bat
goto menu
:_3
curl -o "%SystemDrive%\NO_OC.bat" https://raw.githubusercontent.com/ny4rlk0/WinOptiMaze/refs/heads/main/NO_OC.bat &&start /b "" cmd /c %SystemDrive%\NO_OC.bat
goto menu
:_4
curl -o "%SystemDrive%\Balanced_OC.bat" https://raw.githubusercontent.com/ny4rlk0/WinOptiMaze/refs/heads/main/Balanced_OC.bat &&start /b "" cmd /c %SystemDrive%\Balanced_OC.bat
goto menu
:_5
curl -o "%SystemDrive%\Restart_DWM_GPU_DRIVERS.bat" https://raw.githubusercontent.com/ny4rlk0/WinOptiMaze/refs/heads/main/Restart_DWM_GPU_DRIVERS.bat &&start /b "" cmd /c %SystemDrive%\Restart_DWM_GPU_DRIVERS.bat
goto menu
:_6
curl -o "%SystemDrive%\Restart_GPU_AUDIO_DWM.bat" https://raw.githubusercontent.com/ny4rlk0/WinOptiMaze/refs/heads/main/Restart_GPU_AUDIO_DWM.bat &&start /b "" cmd /c %SystemDrive%\Restart_GPU_AUDIO_DWM.bat
goto menu
:_7
powershell -Command "irm https://get.activated.win | iex" >nul 2>&1
goto menu
:_8
start /b "" cmd /c del "%temp%\MainMenu.bat"&exit /b
