# Create Objects

#region Using Add-Member
$OS = gwmi Win32_OperatingSystem
$ComputerName = $env:COMPUTERNAME

# Create new PS custom object
$Obj = New-Object –Type PSObject

# Add members
$Obj | Add-Member –Name OS           –Value $OS.Caption    –Type NoteProperty 
$Obj | Add-Member –Name ServicePack  –Value $OS.CSDVersion –Type NoteProperty 
$Obj | Add-Member –Name Version      –Value $OS.Version    –Type NoteProperty
$Obj | Add-Member –Name ComputerName –Value $ComputerName  –Type NoteProperty
$Obj | Add-Member –Name Name         –Value OS             –Type AliasProperty

# Return PS Object (to pipeline)
$Obj
$Obj | gm

#endregion 

#region Using New-Object with Hash table

$Properties = @{
    OS = $OS.Caption
	ServicePack = $OS.CSDVersion
	Version = $OS.Version
	ComputerName = $ComputerName
}
$Obj = New-Object –Type PSObject –Property $Properties

# Return PS Object (to pipeline)
$Obj
$Obj | gm

Remove-Variable Obj -Force

#endregion
