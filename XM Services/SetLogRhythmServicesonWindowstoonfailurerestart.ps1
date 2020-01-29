# Sets LogRhythm's Services for non Data Indexer services on an XM to restart automatically
# Services listed below are from a 7.4.9 system, service Display names may change in the future    
# You will need to change Server name to whatever your server is called
    function Set-LRServiceRecovery{
        [alias('Set-Recovery')]
        param
        (
            [string] [Parameter(Mandatory=$true)] $ServiceDisplayName,
            [string] [Parameter(Mandatory=$true)] $Server,
            [string] $action1 = "restart",
            [int] $time1 =  30000, # in miliseconds
            [string] $action2 = "restart",
            [int] $time2 =  30000, # in miliseconds
            [string] $actionLast = "restart",
            [int] $timeLast = 30000, # in miliseconds
            [int] $resetCounter = 4000 # in seconds
        )
        $serverPath = "\\" + $server
        $services = Get-CimInstance -ClassName 'Win32_Service' -ComputerName $Server| Where-Object {$_.DisplayName -imatch $ServiceDisplayName}
        $action = $action1+"/"+$time1+"/"+$action2+"/"+$time2+"/"+$actionLast+"/"+$timeLast
        foreach ($service in $services){
            
            $output = sc.exe $serverPath failure $($service.Name) actions= $action reset= $resetCounter
        }
    }
    Set-LRServiceRecovery -ServiceDisplayName "LogRhythm Admin AP" -Server "LRVM-XM"
    Set-LRServiceRecovery -ServiceDisplayName "LogRhythm AI Engine" -Server "LRVM-XM"
    Set-LRServiceRecovery -ServiceDisplayName "LogRhythmAIEngineCacheDrilldown" -Server "LRVM-XM"
    Set-LRServiceRecovery -ServiceDisplayName "LogRhythm AI Engine Communication Manager" -Server "LRVM-XM"
    Set-LRServiceRecovery -ServiceDisplayName "LogRhythm Alarming and Response Manager" -Server "LRVM-XM"
    Set-LRServiceRecovery -ServiceDisplayName "LogRhythm API Gatewa" -Server "LRVM-XM"
    Set-LRServiceRecovery -ServiceDisplayName "LogRhythm Authentication API" -Server "LRVM-XM"
    Set-LRServiceRecovery -ServiceDisplayName "LogRhythm Case API" -Server "LRVM-XM"
    Set-LRServiceRecovery -ServiceDisplayName "LogRhythm Job Manager" -Server "LRVM-XM"
    Set-LRServiceRecovery -ServiceDisplayName "LogRhythm Mediator Server Service" -Server "LRVM-XM"
    Set-LRServiceRecovery -ServiceDisplayName "LogRhythm System Monitor Service" -Server "LRVM-XM"