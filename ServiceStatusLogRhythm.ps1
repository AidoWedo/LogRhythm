# Richard Bevan
# List all LogRhythm Services
get-service | where-object {$_.DisplayName -like '*LogRhythm*'} | Format-List -Property Status, Name