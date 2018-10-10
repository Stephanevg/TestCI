Function Get-AppveyorCIVariableValues {

    $Standardvariables = Get-Variable | ? {$_.Name -like "CI*" -or $_.Name -like "*APPVEYOR_*" -or $_.Name -like "CONFIGURATION" -OR $_.Name -like "PLATFORM"}
    
    $return = $Standardvariables 
    return $return
}

Write-host "[VARIABLES] Exporting Variables (outside)"-ForegroundColor Green
Get-AppveyorCIVariableValues | Select Name,Value,Description | FT -AutoSize #| export-csv -path $ExportFile -NoTypeInformation
Get-Variable | ? {$_.Name -like "CI*" -or $_.Name -like "APPVEYOR_*" -or $_.Name -like "CONFIGURATION" -OR $_.Name -like "PLATFORM"} Select Name,Value
if($env:APPVEYOR_REPO_COMMIT_MESSAGE -match ".*show_var.*"){
    Write-host "[VARIABLES] Exporting Variables"-ForegroundColor DarkGreen
    #$ExportFile = join-Path -Path $BuildPath -ChildPath "CI_Variables.csv"
    Get-AppveyorCIVariableValues | Select Name,Value,Description | FT -AutoSize #| export-csv -path $ExportFile -NoTypeInformation
}
 