#Get LogicDisks for machine with Temporary Disks
$LogicalDisks = Get-WmiObject Win32_LogicalDisk | Where-Object VolumeName -EQ 'Windows'

#Set Pagefile on Temp disk if exists
If ($LogicalDisks){
    
    Write-Host "Setting PageFile on" $($LogicalDisks.DeviceID) "Drive"
    $pagefile = Get-WmiObject Win32_ComputerSystem -EnableAllPrivileges
    $pagefile.AutomaticManagedPagefile = $false
    $pagefile.put() | Out-Null
    $pagefileset = Get-WmiObject Win32_pagefilesetting
    $pagefileset.InitialSize = 20480
    $pagefileset.MaximumSize = 20480
    $pagefileset.Put() | Out-Null
    $pagefileset.Put() | Out-Null
}
Restart-Computer