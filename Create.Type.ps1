#region Use types manifest

# Cleanup 
Remove-Module ITPROceed -ErrorAction SilentlyContinue

# Use types manifest
$File = 'D:\PS\ITPROceed\ITPROceed.types.ps1xml'

# Open type manifest
# Contains AliasProperty 'MyName', 'MyFamily'
ise $File

# See the current content and structure of $obj
$obj
$obj | gm -MemberType AliasProperty,NoteProperty

# Update type data (in memory)
Update-TypeData -AppendPath $File

# Show current
# Look for AliasProperty 'MyName', 'MyFamily'
$obj | gm -MemberType AliasProperty,NoteProperty

# Show type data (in memory)
Get-TypeData -TypeName MyObject

#endregion Use types manifest
