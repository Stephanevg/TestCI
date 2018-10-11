Function Get-AppveyorCIVariableValues {

    $Standardvariables = Get-Variable | ? {$_.Name -like "CI*" -or $_.Name -like "*APPVEYOR_*" -or $_.Name -like "CONFIGURATION" -OR $_.Name -like "PLATFORM"}
    
    $return = $Standardvariables 
    return $return
}



if($env:APPVEYOR_REPO_COMMIT_MESSAGE -match ".*show_var.*"){
    Write-host "[VARIABLES] Exporting Variables"-ForegroundColor DarkGreen
    
    gci env:\ | sort Name | select Name,Value,Description
    
}

gci env:\ | sort Name | select Name,Value,Description