# Richard Bevan
# Starts Services for a Windows Based XM plus DX Services
# This is for 7.4 so you may need to tweak it for any other version
# Start Common Services First Service Registry, API Gateway, Authentication API, SQL Service, Windows Authentication Service, Admin API
Start-Service LogRhythmServiceRegistry
Start-Service LogRhythmAPIGateway
Start-Services LogRhythmAuthenticationAPI
Start-Service LogRhythmSQLService
Start-Service LogRhythmWindowsAuthenticationService
Start-Service LogRhythmAdminAPI
# Start Metrics
Start-Service LogRhythmMetricsDatabase
Start-Service LogRhythmMericsCollection
Start-Service LogRhythmMetricsWebUI
# start DX Services assumption is that batch files are still in C:\Program Files\LogRhythm\Data Indexer\Tools if not change below
cmd.exe /c 'C:\Program Files\LogRhythm\Data Indexer\tools\Start-all-services.bat'
# True Identity this is optional if its not there it will error and move on
start-service LogRhythmTrueIdentitySyncClient
# start LR Legacy Services Mediator, AIE Comms Manager, AIE Drilldown Cache, AIEngine, Alarming and Response, Job Manager, LogRhythm Notification Service, finally System Monitor Agent
Start-Service scmedsvr
Start-Service LRAIEComMgr
Start-Service LogRhythmAIEngineCacheDrilldown
Start-Service LRAIEEngine
Start-Service scarm
Start-Service LogRhythmNotificationService
Start-Service scsm