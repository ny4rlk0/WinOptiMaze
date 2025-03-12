TITLE Service WinOptiMaze v0.1
cls
@echo off
echo github.com/ny4rlk0/WinOptiMaze
echo _______________________________________________________________
if _%1_==_payload_  goto :payload

:getadmin
    echo %~nx0: Administrator permission level has been acquired.
    echo %~nx0: Adjusting system for NO OVERCLOCK.
    set vbs=%temp%\getadmin.vbs
    echo Set UAC = CreateObject^("Shell.Application"^)                >> "%vbs%"
    echo UAC.ShellExecute "%~s0", "payload %~sdp0 %*", "", "runas", 1 >> "%vbs%"
    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
goto :eof

:payload

::Kodu buraya yaz:: 
curl -o %HOMEDRIVE%\power_unlock.reg https://raw.githubusercontent.com/ny4rlk0/WinOptiMaze/refs/heads/main/power_unlock.reg
curl -o %HOMEDRIVE%\NO_OC_WinOptiMaze.pow https://raw.githubusercontent.com/ny4rlk0/WinOptiMaze/refs/heads/main/NO_OC_WinOptiMaze.pow
curl -o %HOMEDRIVE%\Balanced_WinOptiMaze.pow https://raw.githubusercontent.com/ny4rlk0/WinOptiMaze/refs/heads/main/Balanced_WinOptiMaze.pow
powershell -command "([regex]::Matches((powercfg -list), 'GUID: ([\w-]+)') | ForEach-Object { $_.Groups[1].Value }) | ForEach-Object { powercfg -delete $_ }"
regedit /s %HOMEDRIVE%\power_unlock.reg
powershell -command "powercfg /import %HOMEDRIVE%\NO_OC_WinOptiMaze.pow"
timeout /t 1
powershell -command "powercfg /import %HOMEDRIVE%\Balanced_WinOptiMaze.pow"
for /f "tokens=4" %%f in ('powercfg -list ^| findstr /C:"NO_OC_WinOptiMaze"') do set GUID=%%f
powercfg /S %GUID%
pause
del %HOMEDRIVE%\power_unlock.reg
del %HOMEDRIVE%\NO_OC_WinOptiMaze.pow
del %HOMEDRIVE%\Balanced_WinOptiMaze.pow
start /b "" cmd /c del "%~f0"&exit /b
::Kodu buraya yaz:: 
