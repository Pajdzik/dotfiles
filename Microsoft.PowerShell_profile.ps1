function Install-ModuleIfNotAvailable {
    param (
        [string] $moduleName
    )
    
    if (-not (Get-Module -ListAvailable -Name $moduleName))
    {
        PowerShellGet\Install-Module $moduleName -Scope CurrentUser
    }
}

# Create profile symlink if missing
if (-not (Test-Path -Path $PROFILE))
{
    $symbolicLinkCommand = "New-Item -ItemType SymbolicLink -Path $PROFILE -Value $PSCommandPath"
    Start-Process powershell -Verb runAs -ArgumentList $symbolicLinkCommand
}

# Install modules
Install-ModuleIfNotAvailable oh-my-posh
Install-ModuleIfNotAvailable posh-git
Install-ModuleIfNotAvailable PSReadLine

# Configure modules
Set-PoshPrompt -Theme agnosterplus

if ($host.Name -eq 'ConsoleHost')
{
    Import-Module PSReadLine

    Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
    Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward
}

# Aliases
Set-Alias -Name code-insiders -Value code-insiders.cmd
Set-Alias -Name code -Value code-insiders