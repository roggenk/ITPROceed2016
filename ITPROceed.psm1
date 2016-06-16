
function Get-ITPEdition {
    Write-Output @{'Edition' = '2016'}
}

New-Alias -Name gitpro -Value Get-ITPEdition -Force

function Get-ITPLocation {
    Write-Output @{'Location' = 'Mechelen'}
}

function Set-ITPEdition {
}

New-Alias -Name sitpro -Value Set-ITPEdition -Force

function Set-ITPLocation {
}

# Variables
New-Variable -Name ITPROceed -Scope Global -Force

$global:ITPROceed = @{
    'Edition'  = '2016'
    'Location' = 'Mechelen'
}


