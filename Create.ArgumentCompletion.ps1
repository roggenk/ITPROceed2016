#region Creating Argument Completer

# Helper function to create argument completion results
function New-CompletionResult
{
   param(
        [Parameter(Mandatory)]
        [string]$CompletionText,
        [string]$ListItemText = $CompletionText,
        [string]$ToolTip = $CompletionText
    )

    New-Object System.Management.Automation.CompletionResult $CompletionText, $ListItemText, 'ParameterValue', $ToolTip
}

# VM Name ############################################

# Function that populates Argument completion results for 'Get-VM -Name'
function VMNameCompletion
{
    param($commandName, $parameterName, $wordToComplete, $commandAst, $fakeBoundParameter)    

    Hyper-V\Get-VM -Name "$wordToComplete*" | ForEach-Object { New-CompletionResult -CompletionText $_.Name }
} 

# Register Argument Completer
Register-ArgumentCompleter -CommandName Get-VM -ParameterName Name -ScriptBlock $function:VMNameCompletion

# Experience argument completion for -VMName <TAB>
Get-VM -Name

# VM Id ##############################################

# Function that populates Argument completion results for 'Get-VM -Id'
function VMIdCompletion
{
    param($commandName, $parameterName, $wordToComplete, $commandAst, $fakeBoundParameter)    

    Hyper-V\Get-VM -Name "$wordToComplete*" | ForEach-Object { New-CompletionResult -CompletionText $_.Id -ListItemText $_.Name -ToolTip $_.Status }
}

# Register Argument Completer
Register-ArgumentCompleter -CommandName Get-VM -ParameterName Id -ScriptBlock $function:VMIdCompletion

# Experience argument completion for -Id <TAB>
Get-VM -Id

#endregion Creating Argument Completer