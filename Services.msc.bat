::start= <boot|system|auto|demand|disabled|delayed-auto>
@echo off
TITLE WinOptiMaze v1.0 
mode con: cols=75 lines=24
color F0
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
echo                         Optimize Services.MSC
echo ----------------------------------------------------------------------
if "%~1" neq "skip" goto getAdmin
:getAdmin
net session >nul 2>&1
if %errorlevel% neq 0 (
	mode con: cols=70 lines=22
	color F0
	cls
	echo %~nx0: Requesting Administrative privileges.
	echo %~nx0: Starting Services.msc.bat to Optimize Services.msc.
	powershell -Command "Start-Process '%~f0' -ArgumentList 'skip' -Verb RunAs"
	exit /b
)

::Kodu buraya yaz::
sc config AxInstSV start= demand
sc config AarSvc_74353 start= demand
sc config Netman start= demand
sc config NcdAutoSetup start= demand
sc config NcbService start= demand
sc config NcaSvc start= demand
sc config nsi start= auto
sc config NlaSvc start= demand
sc config NetSetupSvc start= demand
sc config netprofm start= demand
sc config nvagent start= demand
sc config AISpeechService start= demand
sc config SCardSvr start= auto
sc config ScDeviceEnum start= auto
sc config SCPolicySvc start= auto
sc config SensorService start= demand
sc config SensrSvc start= demand
sc config SensorDataService start= auto
sc config "AMD Crash Defender Service" start= auto
sc config "AMD External Events Utility" start= auto
sc config AppXSvc start= demand
sc config BITS start= demand
sc config BrokerInfrastructure start= auto
sc config AssignedAccessManagerSvc start= disabled
sc config BthAvctpSvc start= demand
sc config DeviceAssociationService start= demand
sc config DsmSvc start= demand
sc config DmEnrollmentSvc start= demand
sc config DeviceInstall start= demand
sc config lltdsvc start= demand
sc config CDPSvc start= demand
sc config DiagTrack start= auto
sc config dcsvc start= demand
sc config VSS start= demand
sc config BDESVC start= auto
sc config wbengine start= demand
sc config wbengine start= demand
sc config BTAGService start= demand
sc config BluetoothUserService_74353 start= demand
sc config PeerDistSvc start= demand
sc config CaptureService_74353 start= demand
sc config dmwappushservice start= auto
sc config cbdhsvc_74353 start= auto
sc config CloudBackupRestoreSvc_74353 start= demand
sc config KeyIso start= demand
sc config lfsvc start= demand
sc config EventSystem start= auto
sc config COMSysApp start= demand
sc config CDPUserSvc_74353 start= auto
sc config ConsentUxUserSvc_74353 start= demand
sc config PimIndexMaintenanceSvc_74353 start= demand
sc config CoreMessagingRegistrar start= auto
sc config CredentialEnrollmentManagerUserSvc_74353 start= demand
::sc config LenovoVantageService start= disabled
sc config WalletService start= demand
sc config workfolderssvc start= demand
sc config CscService start= demand
sc config TrkWks start= auto
sc config MSDTC start= auto
sc config KtmRm start= demand
sc config DcomLaunch start= auto
sc config StorSvc start= demand
sc config TieringEngineService start= demand
sc config DeviceAssociationBrokerSvc_74353 start= demand
sc config DevicePickerUserSvc_74353 start= demand
sc config DevicesFlowUserSvc_74353 start= demand
sc config DevQueryBroker start= demand
sc config Dhcp start= auto
sc config diagsvc start= demand
sc config DialogBlockingService start= demand
sc config LxpSvc start= demand
sc config Dnscache start= auto
sc config fhsvc start= demand
sc config StateRepository start= auto
sc config WpcMonSvc start= demand
sc config embeddedmode start= demand
sc config InventorySvc start= demand
sc config BcastDVRUserService_74353 start= demand
sc config GameInputSvc start= demand
sc config EapHost start= demand
sc config Schedule start= auto
sc config DisplayEnhancementService start= demand
sc config GraphicsPerfSvc start= demand
sc config gpsvc start= auto
sc config Power start= auto
sc config SstpSvc start= demand
sc config SamSs start= auto
sc config wscsvc start= delayed-auto
sc config autotimesvc start= auto
sc config HvHost start= auto
sc config vmcompute start= demand
sc config vmicvss start= demand
sc config vmicguestinterface start= auto
sc config vmicshutdown start= auto
sc config vmicvmsession start= auto
sc config vmms start= auto
sc config vmicheartbeat start= auto
sc config vmicrdv start= auto
sc config vmickvpexchange start= auto
sc config vmictimesync start= auto
sc config IKEEXT start= auto
sc config seclogon start= auto
sc config DispBrokerDesktopSvc start= auto
sc config MapsBroker start= demand
sc config hidserv start= demand
sc config SharedAccess start= auto
sc config IpxlatCfgSvc start= demand
sc config iphlpsvc start= auto
sc config PolicyAgent start= demand
sc config ClipSVC start= demand
sc config LanmanWorkstation start= auto
sc config FDResPub start= demand
sc config fdPHost start= demand
sc config dot3svc start= demand
sc config WlanSvc start= auto
sc config ShellHWDetection start= auto
sc config QWAVE start= disabled
sc config LocalKdc start= auto
sc config VaultSvc start= demand
sc config HNS start= demand
sc config HgClientService start= demand
sc config ProfSvc start= auto
sc config UserManager start= auto
sc config EntAppSvc start= demand
::sc config LenovoFnAndFunctionKeys start= disabled
sc config McpManagementService start= demand
sc config MessagingService_74353 start= demand
sc config TextInputManagementService start= auto
sc config AppVClient start= demand
sc config cloudidsvc start= demand
sc config MDCoreSvc start= auto
sc config WdNisSvc start= demand
sc config WinDefend start= auto
sc config smphost start= demand
sc config MicrosoftEdgeElevationService start= auto
sc config edgeupdate start= delayed-auto
sc config edgeupdatem start= delayed-auto
sc config wlidsvc start= demand
sc config MSiSCSI start= demand
sc config MsKeyboardFilter start= demand
sc config ClickToRunSvc start= demand
sc config NgcSvc start= demand
sc config NgcCtnrSvc start= demand
sc config InstallService start= auto
sc config SmsRouter start= demand
sc config swprv start= demand
sc config NahimicService start= auto
sc config NaturalAuthentication start= demand
sc config NetTcpPortSharing start= auto
sc config Netlogon start= demand
sc config svsvc start= demand
sc config NPSMSvc_74353 start= demand
sc config NVDisplay.ContainerLocalSystem start= auto
sc config ssh-agent start= demand
sc config UsoSvc start= demand
sc config tzautoupdate start= auto
sc config SEMgrSvc start= demand
sc config TroubleshootingSvc start= demand
sc config P9RdrService_74353 start= demand
sc config PenService_74353 start= demand
sc config RetailDemo start= auto
sc config pla start= demand
sc config PerfHost start= auto
sc config PrintWorkflowUserSvc_74353 start= demand
sc config PcaSvc start= demand
sc config RmSvc start= auto
sc config RtkAudioUniversalService start= auto
sc config refsdedupsvc start= demand
sc config WiaRpc start= demand
sc config RpcEptMapper start= auto
sc config vds start= demand
sc config CertPropSvc start= demand
sc config shpamsvc start= demand
sc config SystemEventsBroker start= auto
sc config SENS start= auto
sc config SNMPTrap start= auto
sc config wercplsupport start= demand
sc config SQLWriter start= auto
sc config SSDPSRV start= demand
sc config "Steam Client Service" start= demand
sc config LanmanServer start= auto
sc config defragsvc start= demand
sc config OneSyncSvc_74353 start= auto
sc config SysMain start= demand
sc config EFS start= demand
sc config CryptSvc start= auto
sc config PlugPlay start= auto
sc config DPS start= auto
sc config WdiServiceHost start= demand
sc config WdiSystemHost start= demand
sc config WPDBusEnum start= auto
sc config lmhosts start= demand
sc config TapiSrv start= demand
sc config PhoneSvc start= demand
sc config Themes start= auto
sc config BFE start= auto
sc config DoSvc start= auto
sc config UdkUserSvc_74353 start= demand
sc config upnphost start= demand
sc config UserDataSvc_74353 start= demand
sc config UnistoreSvc_74353 start= demand
sc config UevAgentService start= demand
sc config Appinfo start= demand
sc config AppReadiness start= demand
sc config ALG start= auto
sc config AppIDSvc start= demand
sc config AppMgmt start= demand
sc config RemoteRegistry start= demand
sc config TermService start= auto
sc config UmRdpService start= auto
sc config SessionEnv start= auto
sc config RasMan start= auto
sc config RasAuto start= demand
sc config RpcSs start= auto
sc config RpcLocator start= demand
sc config DusmSvc start= auto
sc config DsSvc start= demand
sc config vgc start= demand
sc config VSInstallerElevationService start= demand
sc config VSStandardCollectorService150 start= demand
sc config WaaSMedicSvc start= demand
sc config WarpJITSvc start= demand
sc config TokenBroker start= demand
sc config webthreatdefsvc start= auto
sc config webthreatdefusersvc_74353 start= auto
sc config WebClient start= demand
sc config WFDSConMgrSvc start= demand
sc config perceptionsimulation start= demand
sc config WpnService start= auto
sc config Wcmsvc start= auto
sc config WbioSrvc start= auto
sc config Sense start= demand
sc config mpssvc start= auto
sc config SecurityHealthService start= demand
sc config WerSvc start= demand
sc config wisvc start= demand
sc config msiserver start= demand
sc config FrameServer start= demand
sc config FrameServerMonitor start= demand
sc config LicenseManager start= auto
sc config WMPNetworkSvc start= demand
sc config icssvc start= demand
sc config TrustedInstaller start= demand
sc config EventLog start= auto
sc config Wecsvc start= demand
sc config FontCache3.0.0.0 start= demand
sc config WpnUserService_74353 start= auto
sc config PushToInstall start= demand
sc config StiSvc start= auto
sc config ApxSvc start= demand
sc config WSearch start= delayed-auto
sc config Audiosrv start= auto
sc config AudioEndpointBuilder start= auto
sc config WEPHOSTSVC start= demand
sc config wcncsvc start= demand
sc config W32Time start= demand
sc config wuauserv start= demand
sc config WinRM start= demand
sc config FontCache start= auto
sc config SDRSVC start= demand
sc config WManSvc start= demand
sc config Winmgmt start= auto
sc config WinHttpAutoProxySvc start= demand
sc config wmiApSrv start= demand
sc config WwanSvc start= demand
sc config XboxGipSvc start= auto
sc config XboxNetApiSvc start= auto
sc config XblAuthManager start= auto
sc config XblGameSave start= demand
sc config Spooler start= demand
sc config PrintNotify start= demand
sc config PrintDeviceConfigurationService start= demand
sc config sppsvc start= delayed-auto
sc config LSM start= auto
sc config wlpasvc start= demand
sc config camsvc start= demand
sc config RemoteAccess start= auto
sc config TimeBrokerSvc start= demand
::Go Back To Main Menu
curl -o "%temp%\MainMenu.bat" https://raw.githubusercontent.com/ny4rlk0/WinOptiMaze/refs/heads/main/MainMenu.bat &&start /b "" cmd /c %temp%\MainMenu.bat &exit
::Exit From This Instance
start /b "" cmd /c del "%~f0"&exit /b
::Kodu buraya yaz:: 
