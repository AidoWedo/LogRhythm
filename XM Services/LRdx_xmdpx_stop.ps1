# Richard Bevan
# Stops Services for a Windows Based XM plus DX Services
# This is for 7.4 so you may need to tweak it for any other version
# Stop Common Services First Service Registry, API Gateway, Authentication API, SQL Service, Windows Authentication Service, Admin API
Stop-Service LogRhythmServiceRegistry
Stop-Service LogRhythmAPIGateway
Stop-Services LogRhythmAuthenticationAPI
Stop-Service LogRhythmSQLService
Stop-Service LogRhythmWindowsAuthenticationService
Stop-Service LogRhythmAdminAPI
# Stop Metrics
Stop-Service LogRhythmMetricsDatabase
Stop-Service LogRhythmMericsCollection
Stop-Service LogRhythmMetricsWebUI
# Stop DX Services assumption is that batch files are still in C:\Program Files\LogRhythm\Data Indexer\Tools if not change below
cmd.exe /c 'C:\Program Files\LogRhythm\Data Indexer\tools\Stop-all-services.bat'
# True Identity this is optional if its not there it will error and move on
Stop-service LogRhythmTrueIdentitySyncClient
# Stop LR Legacy Services Mediator, AIE Comms Manager, AIE Drilldown Cache, AIEngine, Alarming and Response, Job Manager, LogRhythm Notification Service, finally System Monitor Agent
Stop-Service scmedsvr
Stop-Service LRAIEComMgr
Stop-Service LogRhythmAIEngineCacheDrilldown
Stop-Service LRAIEEngine
Stop-Service scarm
Stop-Service LogRhythmNotificationService
Stop-Service scsm