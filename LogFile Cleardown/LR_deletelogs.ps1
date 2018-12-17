# Richard Bevan
# Based on Chris Martins Script
# Updated to cater for 7.4 stuff i.e. added new paths and removed old paths
# Chris's script here https://github.com/lrchma/LR-Utilities/blob/master/LR-DeleteLogs.ps1
# This script has been tested on 7.4.3 XM, anything else take with a large pinch of salt
# You know the drill - run at your own risk

param(
  [Parameter(Mandatory=$false)]
  [string]$testMode = "true",
  [Parameter(Mandatory=$true)]
  [int]$deleteFilesOlderThan = -30
)


#This script use Invoke-RestMethod which only comes with PowerShell 3.0 of higher.
if ($PSVersionTable.PSVersion -lt [Version]"3.0") {
  write-host "PowerShell version " $PSVersionTable.PSVersion "not supported.  This script requires PowerShell 3.0 or greater." -ForegroundColor Red
  exit
}


$logFiles = @(
# This will clear down installer logs if you use defaults
"C:\Program Files\LogRhythm\logs"
# LogRhythm Administration API Logs
"C:\Program Files\LogRhythm\LogRhythm Administration API\logs"
# AI Engine Logs mainly Comms Manager Logs
"C:\Program Files\LogRhythm\LogRhythm AI Engine\logs"
# AIE Engine Drill Down Cache Logs 
"C:\Program File\LogRhythm\LogRhythm AI Engine Cache Drilldown\logs"
# Alarm and Response logs
"C:\Program Files\LogRhythm\LogRhythm Alarming and Response Manager\logs"
# LogRhythm Authentication Service Logs (Auth, SQL and Windows Auth logs)
"C:\Program Files\LogRhythm\LogRhythm Authentication Services\logs"
# LogRhythm Common Services logs will also include Metrics in 7.4
"C:\Program Files\LogRhythm\LogRhythm Common\logs"
# Console Thick SIEM Console logs
"C:\Program Files\LogRhythm\LogRhythm Console\logs"
# Infrastrcuture Installer logs (i.e. LRII logs)
"C:\Program Files\LogRhythm\LogRhythm Infrastructure Installer\logs"
# Job Manager 
"C:\Program Files\LogRhythm\LogRhythm Job Manager\logs"
# Mediator Logs
"C:\Program Files\LogRhythm\LogRhythm Mediator Server\logs"
# LogRhythm Metrics additional logs (in addition to common logs)
"C:\Program Files\LogRhythm\LogRhythm Metrics\logs"
# LogRhythm Notification Service used when AIE DrillDown Cache Enabled
"C:\Program Files\LogRhythm\LogRhythm Notification Service\logs"
# System Monitor logs
"C:\Program Files\LogRhythm\LogRhythm System Monitor\logs"
# Web Services Logs (If this is a XM with Webservices installed)
"C:\Program Files\LogRhythm\LogRhythm Threat Intelligence Service\logs"
"C:\Program Files\LogRhythm\LogRhythm Web Console\logs"
"C:\Program Files\LogRhythm\LogRhythm Web Console UI\logs"
"C:\Program Files\LogRhythm\LogRhythm Web Services\logs"
"C:\Program Files\LogRhythm\LogRhythm Web Console\nginx\logs"
# Data Indexer on Windows Logs
"C:\Program Files\LogRhythm\Data Indexer\logs"
"C:\Program Files\LogRhythm\Data Indexer\logs\diags"
"C:\Program Files\LogRhythm\Data Indexer\elasticsearch\logs"
# Or if it has moved to d drive which is best practice
"D:\LRIndexer\elasticsearch\logs"
"C:\Program Files\LogRhythm\Data Indexer\grafana\logs"
# Threat Intelligence Service Logs
"C:\Program Files\LogRhythm\LogRhythm Threat Intelligence Service\logs\archive"
)

try  
{ 

if($testMode -eq "true"){

    #Test Mode - Don't delete files
    foreach ($logFile in $logFiles){
        if (Test-Path $logFile){
                $itemsToDelete = dir $logFile -Recurse -File *.log | Where LastWriteTime -lt ((get-date).AddDays($deleteFilesOlderThan)) 
        
                foreach($item in $itemsToDelete){
                    $tempFileSize = ((Measure-Object -inputObject $item -Property Length -Sum -ErrorAction Stop).Sum / 1MB) 
                    $totalSpaceReclaimed = $totalSpaceReclaimed + $tempFileSize
                    ("{0}\{1}" -f $item.DirectoryName, $item.Name) | Remove-Item -Verbose -WhatIf
                }
        }else
        {
            write-host "$logFile not found"
        }

}
                if ($totalSpaceReclaimed){
                        write-host "Total disk space reclaimed (MB): $totalSpaceReclaimed"
                }else{
                        write-host "Looks like no files met criteria."
                }
             }
             else{

     #Live Mode - Delete Files
     foreach ($logFile in $logFiles){
            if (Test-Path $logFile){
                $itemsToDelete = dir $logFile -Recurse -File *.log | Where LastWriteTime -lt ((get-date).AddDays($deleteFilesOlderThan)) 
    
                foreach($item in $itemsToDelete){
                        $tempFileSize = ((Measure-Object -inputObject $item -Property Length -Sum -ErrorAction Stop).Sum / 1MB) 
                        $totalSpaceReclaimed = $totalSpaceReclaimed + $tempFileSize
                        ("{0}\{1}" -f $item.DirectoryName, $item.Name) | Remove-Item -Verbose 
                    }   
            }else
            {
                write-host "$logFile not found"
            }
        }
        if ($totalSpaceReclaimed){
                write-host "Total disk space reclaimed (MB): $totalSpaceReclaimed"
        }else{
                write-host "Looks like no files met criteria."
        }
    }
}
 catch [System.UnauthorizedAccessException]
    {
        Write-Output "Unauthorized Access Exception: $logFile.  You shouldn't be here, but perhaps the folder path doesn't exist."
        Continue
    }
catch [System.IO.IOException]
{
        Write-Output "File In Use Exception: $item.Name.  Processes happen."
        Continue
}
catch {
        Write-Output "Exception: $_.Exception.  Well, this is awkward..."
}
Finally
{
}