# Richard Bevan
# Starts Services for a standalone LogRhythm Web Console (i.e. installed on its own Server)
# Use the other script LRwc_xmpm.ps1 if the web services are not stand alone
# stop case API
Stop-service LogRhythmCaseAPI
# stop ThreatIntelligence API
Stop-Service LogRhythmConsoleAPI
# stop Web Console UI service
Stop-Service LogRhythmConsoleUI
# stop LogRhythm Web Indexer
Stop-Service LogRhythmWebIndexer
# stop LogRhythm Webservices Host API
Stop-Service LogRhythmWebServicesHostAPI