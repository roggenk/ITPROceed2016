
#region Extending objects

# Create new object using type casting
$obj = [pscustomobject]@{Name='Kurt Roggen'; FirstName='Kurt'; LastName='Roggen'}
$obj

# Add AliasProperty 'FullName'
Add-Member -InputObject $obj -MemberType AliasProperty -Name FullName -Value Name
$obj
$obj | gm

# Add ScriptProperty 'MyFullName'
Add-Member -InputObject $obj -MemberType ScriptProperty -Name MyFullName -Value { $this.Firstname + ' ' + $this.LastName.ToUpper() }
$obj
$obj | gm

$obj
$obj.FirstName = 'Michelle'
$obj

# Add ScriptProperty 'IsUNC'
Add-Member -InputObject $obj -MemberType ScriptProperty -Name IsUNC -Value {$this.Name -match "^\\w*"}
$obj
$obj.Name = "\\server\share"
$obj
$obj.Name = $obj.myFullName

# Add ScriptMethod 'GetAddress'
Add-Member -InputObject $obj -MemberType ScriptMethod -Name GetAddress -Value $function:GetAddress
# Add-Member -InputObject $obj -MemberType ScriptMethod -Name GetAddress -Value { GetAddress }
$obj
$obj | gm  # See 'GetAddress' method
$obj.GetAddress()

# Helper function 'GetAddress' - Must be located/loaded before referencing 'ScriptMethod'
function GetAddress
{
    Write-Host "Locating address for '$($this.Name)'"
}

# Cleanup variable $obj
Remove-Variable $obj -ErrorAction SilentlyContinue

#endregion Extending objects
