TITLE WinOptiMaze v0.1 
@echo off
cls
echo github.com/ny4rlk0/WinOptiMaze
echo _______________________________________________________________
if _%1_==_payload_  goto :payload

:getadmin
    echo %~nx0: Administrator permission level has been acquired.
    echo %~nx0: Resetting Windows settings.
    set vbs=%temp%\getadmin.vbs
    echo Set UAC = CreateObject^("Shell.Application"^)                >> "%vbs%"
    echo UAC.ShellExecute "%~s0", "payload %~sdp0 %*", "", "runas", 1 >> "%vbs%"
    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
goto :eof

:payload

::Kodu buraya yaz::
echo "Resetting Host file"
(echo https://github.com/ny4rlk0/WinOptiMaze) > "%SystemRoot%\System32\drivers\etc\hosts"
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
wsreset
wsreset /i
cls
echo "Resetting DNS Cache"
ipconfig /flushdns
netsh interface tcp set global autotuninglevel=highlyrestricted
cls
echo "Fixing Windows Update"
REG ADD "HKLM\SYSTEM\CurrentControlSet\Services\WaasMedicSvc" /v Start /f /t REG_DWORD /d 2
REG ADD "HKLM\SYSTEM\CurrentControlSet\Services\wuauserv" /v Start /f /t REG_DWORD /d 2
REG ADD "HKLM\SYSTEM\CurrentControlSet\Services\UsoSvc" /v Start /f /t REG_DWORD /d 2
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\DisableAntiSpyware" /v Start /f /t REG_DWORD /d 0
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
powershell "Get-AppXPackage -AllUsers | Foreach {Add-AppxPackage -DisableDevelopmentMode -Register """$($_.InstallLocation)\AppXManifest.xml"""}"
cls
echo "Search For System Problems"
sfc /scannow
cls
echo "Repairing Windows OS..."
echo "This might take a while (5-30 min)"
sfc /scannow
DISM /Online /Cleanup-Image /CheckHealth
DISM /Online /Cleanup-Image /ScanHealth
DISM /Online /Cleanup-Image /RestoreHealth
cls
echo "Resetting Theme"
start /b "ThemeReset" "%HOMEDRIVE%\Windows\Resources\Themes\aero.theme"
cls
echo "Setting Powershell Restrictions to Secure State"
powershell 'Set-ExecutionPolicy restricted'
start /b "" cmd /c del "%~f0"&exit /b
::Kodu buraya yaz::