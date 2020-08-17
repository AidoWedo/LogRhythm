# Author Richard Bevan
# Intentionally bad data
# Create 3 Text Files for LogRhythm Admin Exercise for unidentified Log Messages
# Variables for current date and time
$currentdateandtime = Get-Date -Format "MMM-dd yyyy HH:mm:ss"
# Lets make sure the folder is empty
remove-item C:\Logmessages\*.*
# Create a new file unknown content 1
# Variable for File Path unknow file 1
$contentunknownfile1 = "C:\LogMessages\unknown1.txt"
# Lets check does it exist if not lets do something about that
if(!(Test-Path -path $contentunknownfile1))
    {
        New-Item -Path "C:\LogMessages\unknown1.txt"
        Start-Sleep -s 15
        Add-Content -Path $contentunknownfile1 -Value "${currentdateandtime}: 02.com at 192.168.1.3"
    }
else
# Replace Date and time of current file to current date and time (fairly redundant now as we delete everything and insert files as we were gettting file locking and replace was not being seen as a new file by LR)
    {
        $contentunknownfile1 = $contentunknownfile1 -replace '(\w{3})\s(\d{2})\s(\d{4})\s(\d{2}):(\d{2}):(\d{2})', ('$currentdateandtime')
    
}
# Variable for File Path unknown file 2
$contentunknownfile2 = "C:\LogMessages\unknown2.txt"
# Lets check does it exist if not lets do something about that
if(!(Test-Path -path $contentunknownfile2))
    {
        New-Item -Path "C:\LogMessages\unknown2.txt"
        Start-Sleep -s 15 
        Add-Content -Path $contentunknownfile2 -Value "${currentdateandtime}: 03.com at UserPC8"
    }
else
# Replace Date and time of current file to current date and time (fairly redundant now as we delete everything and insert files as we were gettting file locking and replace was not being seen as a new file by LR)
    {
        $contentunknownfile2 = $contentunknownfile2 -replace '(\w{3})\s(\d{2})\s(\d{4})\s(\d{2}):(\d{2}):(\d{2})', ('$currentdateandtime')
   
}
# Variable for File Path unknown file 3
$contentunknownfile3 = "C:\LogMessages\unknown3.txt"
# Lets check does it exist if not lets do something about that
if(!(Test-Path -path $contentunknownfile3))
    {
        New-Item -Path "C:\LogMessages\unknown3.txt"
        Start-Sleep -s 15
        Add-Content -Path $contentunknownfile3 -Value "${currentdateandtime}: application pptp"
    }
else
# Replace Date and time of current file to current date and time (fairly redundant now as we delete everything and insert files as we were gettting file locking and replace was not being seen as a new file by LR)
    {
        $contentunknownfile3 = $contentunknownfile3 -replace '(\w{3})\s(\d{2})\s(\d{4})\s(\d{2}):(\d{2}):(\d{2})', ('$currentdateandtime')

}
# Variable for File Path unknown file 4
$contentunknownfile4 = "C:\LogMessages\unknown4.txt"
# Lets check does it exist if not lets do something about that
if(!(Test-Path -path $contentunknownfile4))
    {
        New-Item -Path "C:\LogMessages\unknown4.txt"
        Start-Sleep -s 15
        Add-Content -Path $contentunknownfile4 -Value "${currentdateandtime}: :8080 Bytes In: 193 Bytes Out: 210 Packets In: 2 Packets Out: 4"
    }
else
# Replace Date and time of current file to current date and time (fairly redundant now as we delete everything and insert files as we were gettting file locking and replace was not being seen as a new file by LR)
    {
        $contentunknownfile4 = $contentunknownfile4 -replace '(\w{3})\s(\d{2})\s(\d{4})\s(\d{2}):(\d{2}):(\d{2})', ('$currentdateandtime')
   
}
# Variable for File Path unknown file 5
$contentunknownfile5 = "C:\LogMessages\unknown5.txt"
# Lets check does it exist if not lets do something about that
if(!(Test-Path -path $contentunknownfile5))
    {
        New-Item -Path "C:\LogMessages\unknown5.txt"
        Start-Sleep -s 15
        Add-Content -Path $contentunknownfile5 -Value "${currentdateandtime}: cellaneous log message"
    }
else
# Replace Date and time of current file to current date and time (fairly redundant now as we delete everything and insert files as we were gettting file locking and replace was not being seen as a new file by LR)
    {
        $contentunknownfile5 = $contentunknownfile5 -replace '(\w{3})\s(\d{2})\s(\d{4})\s(\d{2}):(\d{2}):(\d{2})', ('$currentdateandtime')
   
}
# Variable for File Path unknown file 6
$contentunknownfile6 = "C:\LogMessages\unknown6.txt"
# Lets check does it exist if not lets do something about that
if(!(Test-Path -path $contentunknownfile6))
    {
        New-Item -Path "C:\LogMessages\unknown6.txt"
        Start-Sleep -s 15
        Add-Content -Path $contentunknownfile6 -Value "${currentdateandtime}: Misc log message"
    }
else
# Replace Date and time of current file to current date and time (fairly redundant now as we delete everything and insert files as we were gettting file locking and replace was not being seen as a new file by LR)
    {
        $contentunknownfile6 = $contentunknownfile6 -replace '(\w{3})\s(\d{2})\s(\d{4})\s(\d{2}):(\d{2}):(\d{2})', ('$currentdateandtime')
   
}
# Variable for File Path unknown file 7
$contentunknownfile7 = "C:\LogMessages\unknown7.txt"
# Lets check does it exist if not lets do something about that
if(!(Test-Path -path $contentunknownfile7))
    {
        New-Item -Path "C:\LogMessages\unknown7.txt"
        Start-Sleep -s 15
        Add-Content -Path $contentunknownfile7 -Value "${currentdateandtime}: 172.10.1.1: successful object access for user User024 from UserPC10.  Object = c:\My Documents\Spreadsheet022.xls Session ID: c6785772-4456-4c0d-b247-c7fb0f5ada85"
    }
else
# Replace Date and time of current file to current date and time (fairly redundant now as we delete everything and insert files as we were gettting file locking and replace was not being seen as a new file by LR)
    {
        $contentunknownfile7 = $contentunknownfile7 -replace '(\w{3})\s(\d{2})\s(\d{4})\s(\d{2}):(\d{2}):(\d{2})', ('$currentdateandtime')
   
}
# Variable for File Path unknown file 8
$contentunknownfile8 = "C:\LogMessages\unknown8.txt"
# Lets check does it exist if not lets do something about that
if(!(Test-Path -path $contentunknownfile8))
    {
        New-Item -Path "C:\LogMessages\unknown8.txt"
        Start-Sleep -s 15
        Add-Content -Path $contentunknownfile8 -Value "${currentdateandtime}: at 192.168.1.26"
    }
else
# Replace Date and time of current file to current date and time (fairly redundant now as we delete everything and insert files as we were gettting file locking and replace was not being seen as a new file by LR)
    {
       $contentunknownfile8 = $contentunknownfile8 -replace '(\w{3})\s(\d{2})\s(\d{4})\s(\d{2}):(\d{2}):(\d{2})', ('$currentdateandtime')
   
}
