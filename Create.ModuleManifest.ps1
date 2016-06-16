# Module manifest name
$File = 'D:\PS\ITPROceed\ITPROceed.psd1'

# Create module manifest .psd1
New-ModuleManifest -Path $File -Author 'Kurt Roggen [BE]' -ModuleVersion '1.0' 

# Open module manifest
ise $File

# Test module manifest
Test-ModuleManifest -Path $File -Verbose | fl *

# Load module
Import-Module $File -Verbose -Force

# Show module
Get-Module -Name ITPROceed | fl *

# Show exported cmdlets, aliases
(Get-Command -Module ITPROceed).Count
(Get-Alias | where ModuleName -eq 'ITPROceed').Count
