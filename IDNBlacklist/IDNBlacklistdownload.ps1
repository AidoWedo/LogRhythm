# Powershell Script to pull down IDN Character Domain List for popular Domains
# Author: Richard Bevan
# Version 1
# Tested with LogRhythm 7.4.5
# Powershell Version minimum 4
# Further information from theantisocialengineer.com
#
# Specify URL
$url= "http://theantisocialengineer.com/AntiSocial_Blacklist_Community_V1.txt"
# Where am I going to output it to
# This is using JobManager to update the list (Pre LogRhythm Version 7.3)
$output = "C:\Program Files\LogRhythm\LogRhythm Job Manager\config\list_import\IDN.txt"
# Use Bits Transfer to do the work for you
# Lots of options to add proxies, credentials, bypass, Retry Intervals etc (conversely retries can be done via scheduled task manager)
# If you choose asynchronous it will split the file into 1 or more .tmp files and not honour the output name.
# Import-Module BitsTransfer
# Start-BitsTransfer -Source $url -Destination $output -TransferType Download
Import-Module BitsTransfer
Start-BitsTransfer -Source $url -Destination $output
# Output has arrived as a string, convert the string (i.e. one large blob of text and convert this back to what it was data followed by new line
$OUTPUT = [string]::Join("`r`n",(get-content $output)) | OUT-File "C:\Program Files\LogRhythm\LogRhythm Job Manager\config\list_import\IDN.txt"
