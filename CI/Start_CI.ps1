Function Get-AppveyorCIVariableValues {

    $Standardvariables = Get-Variable | ? {$_.Name -like "CI*" -or $_.Name -like "*APPVEYOR_*" -or $_.Name -like "CONFIGURATION" -OR $_.Name -like "PLATFORM"}
    
    $return = $Standardvariables 
    return $return
}


if($env:APPVEYOR_REPO_COMMIT_MESSAGE -match ".*show_var.*"){
    Write-host "[VARIABLES] Exporting Variables"-ForegroundColor DarkGreen
    
    gci env:\ | sort Name | select Name,Value,Description
   
}

write-host "Vars: Local" -ForeGroundColor "Yellow"

Get-Variable -Scope Local

write-host "Vars: Script" -ForeGroundColor "red"

Get-Variable -Scope Script

write-host "Vars: Global" -ForeGroundColor "DarkMagenta"

Get-Variable -Scope Global




 