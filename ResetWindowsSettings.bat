@echo off
TITLE WinOptiMaze v1.0 
cls
mode con: cols=70 lines=22
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
echo            Reset Windows/Group Policy settings to default!
echo ----------------------------------------------------------------------
if "%~1" neq "skip" goto getAdmin
:getAdmin
net session >nul 2>&1
if %errorlevel% neq 0 (
	mode con: cols=70 lines=22
	color F0
	cls
	echo %~nx0: Requesting Administrative privileges.
	powershell -Command "Start-Process '%~f0' -ArgumentList 'skip' -Verb RunAs"
	exit /b
)

::Kodu buraya yaz::
echo "Resetting Host file"
(echo #https://github.com/ny4rlk0/WinOptiMaze) > "%SystemRoot%\System32\drivers\etc\hosts"
cls
echo "Resetting Group Policy Rules to Default"
RD /S /Q "%WinDir%\System32\GroupPolicy"
RD /S /Q "%WinDir%\System32\GroupPolicyUsers"
gpupdate /force
cls
echo "Enable Firewall"
netsh firewall set opmode mode=ENABLE
netsh advfirewall set allprofiles state on
cls
echo "Reset Firewall to Default Values"
netsh firewall reset
netsh advfirewall reset
cls
echo "Resetting Windows Store"
wsreset >nul 2>&1
wsreset /i >nul 2>&1
timeout /t 5
taskkill /IM "WinStore.App.exe" /f  >nul 2>&1
cls
echo "Resetting DNS Cache"
ipconfig /flushdns
netsh interface tcp set global autotuninglevel=highlyrestricted
cls
echo "Resetting Windows Update Settings"
REG ADD "HKLM\SYSTEM\CurrentControlSet\Services\WaasMedicSvc" /v Start /f /t REG_DWORD /d 2
REG ADD "HKLM\SYSTEM\CurrentControlSet\Services\wuauserv" /v Start /f /t REG_DWORD /d 2
REG ADD "HKLM\SYSTEM\CurrentControlSet\Services\UsoSvc" /v Start /f /t REG_DWORD /d 2
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\DisableAntiSpyware" /v Start /f /t REG_DWORD /d 0
cls
echo "Resetting Windows Update Cache"
net stop wuauserv
net stop bits
net stop cryptsvc
rmdir /S /Q %WinDir%\SoftwareDistribution
rmdir /S /Q %WinDir%\system32\catroot2
md %WinDir%\system32\catroot2
icacls.exe %WinDir%\system32\catroot2 /grant "NT SERVICE\CryptSvc:(OI)(CI)(F)"
net start wuauserv
net start bits
net start cryptsvc
cls
echo "Resetting Defender settings to default"
powershell 'Set-MpPreference -DisableRealtimeMonitoring $false'
powershell 'Set-MpPreference -DisableIOAVProtection $false'
powershell "$pathExclusions = Get-MpPreference | select ExclusionPath; foreach ($exclusion in $pathExclusions) {if ($exclusion.ExclusionPath -ne $null) {Remove-MpPreference -ExclusionPath $exclusion.ExclusionPath}}"
powershell "$extensionExclusion = Get-MpPreference | select ExclusionExtension; foreach ($exclusion in $extensionExclusion) {if ($exclusion.ExclusionExtension -ne $null) {Remove-MpPreference -ExclusionExtension $exclusion.ExclusionExtension}}"
powershell "$processExclusions = Get-MpPreference | select ExclusionProcess; foreach ($exclusion in $processExclusions) {if ($exclusion.ExclusionProcess -ne $null) {Remove-MpPreference -ExclusionProcess $exclusion.ExclusionProcess}}"
powershell 'Set-MpPreference -ScanScheduleTime "02:00:00"'
powershell 'Set-MpPreference -ScanScheduleQuickScanTime "02:00:00"'
powershell 'Set-MpPreference -DisableCatchupFullScan $false'
powershell 'Set-MpPreference -DisableCatchupQuickScan $false'
powershell 'Set-MpPreference -DisableArchiveScanning $false'
powershell 'Set-MpPreference -DisableRemovableDriveScanning $false'
powershell 'Set-MpPreference -DisableScanningNetworkFiles $false'
powershell 'Set-MpPreference -SignatureUpdateInterval 6'
powershell 'Set-MpPreference -SignatureUpdateCatchupInterval 1'
powershell 'Set-MpPreference -SignatureDisableUpdateOnStartupWithoutEngine $false'
powershell 'Set-MpPreference -SignatureFallbackOrder "MicrosoftUpdateServer|MMPC"'
powershell 'Set-MpPreference -QuarantinePurgeItemsAfterDelay 90'
cls
echo "Reinstall all Windows Apps"
powershell -Command "Get-AppXPackage -AllUsers | Foreach {Add-AppxPackage -DisableDevelopmentMode -Register """$($_.InstallLocation)\AppXManifest.xml"""}" 2>nul
cls
echo "Search For System Problems"
sfc /scannow
cls
echo "Repairing Windows OS..."
echo "This might take a while (5-30 min)"
DISM /Online /Cleanup-Image /CheckHealth
DISM /Online /Cleanup-Image /ScanHealth
DISM /Online /Cleanup-Image /RestoreHealth
cls
echo "Resetting Theme"
start /b "ThemeReset" cmd /c "%HOMEDRIVE%\Windows\Resources\Themes\aero.theme" >nul 2>&1
timeout /t 5
start /b "ThemeReset" cmd /c "%HOMEDRIVE%\Windows\Resources\Themes\dark.theme" >nul 2>&1
taskkill /IM "SystemSettings.exe" /f  >nul 2>&1
cls
echo "Setting Powershell Restrictions to Secure State"
powershell 'Set-ExecutionPolicy restricted'
echo "Setting Services.msc"
curl -o Services.msc.bat https://raw.githubusercontent.com/ny4rlk0/WinOptiMaze/refs/heads/main/Services.msc.bat &&start /b "" cmd /c Services.msc.bat
start /b "" cmd /c del "%~f0"&exit /b
::Kodu buraya yaz::
