# Richard Bevan
# Starts Services for a standalone LogRhythm Web Console (i.e. installed on its own Server)
# Use the other script LRwc_xmpm.ps1 if the web services are not stand alone
# stop case API
Start-service LogRhythmCaseAPI
# stop ThreatIntelligence API
Start-Service LogRhythmConsoleAPI
# stop Web Console UI service
Start-Service LogRhythmConsoleUI
# stop LogRhythm Web Indexer
Start-Service LogRhythmWebIndexer
# stop LogRhythm Webservices Host API
Start-Service LogRhythmWebServicesHostAPI