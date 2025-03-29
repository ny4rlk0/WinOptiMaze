::github.com/ny4rlk0/WinOptiMaze
::Detect Windows OS Version Vista 7 8 8.1 10 11
@echo off
for /f "tokens=4 delims=. " %%A in ('ver') do set OSVersionMajor=%%A
for /f "tokens=5 delims=. " %%A in ('ver') do set OSVersionMinor=%%A
for /f "tokens=6 delims=. " %%A in ('ver') do set OSBUILD=%%A
::Remove ] from OSBUILD
set OSBUILD=%OSBUILD:]=% >nul 2>&1
::Print OS Versions
::echo %OSVersionMajor%
::echo %OSVersionMinor%
::echo %OSBUILD%
if "%OSVersionMajor%" =="10" (
	if "%OSBUILD%" geq "22000" (
	::Windows 11
	echo "Windows 11"
	pause>nul
	)
	if "%OSBUILD%" lss "22000" (
	::Windows 10
	echo "Windows 10"
	pause>nul
	)
)
if "%OSVersionMajor%"=="6" (
	if "%OSVersionMinor%" =="0" (
	::Windows Vista
	echo "Windows Vista"
	pause>nul
	)
	if "%OSVersionMinor%" =="1" (
	::Windows 7
	echo "Windows 7"
	pause>nul
	)
	if "%OSVersionMinor%"=="2" (
	::Windows 8
	echo "Windows 8"
	pause>nul
	)
	if "%OSVersionMinor%"=="3" (
	::Windows 8.1
	echo "Windows 8.1"
	pause>nul
	)
)
exit /b
