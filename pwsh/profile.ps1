Set-Alias -Name d -Value docker.exe
Set-Alias -Name dc -Value docker-compose.exe
Set-Alias -Name k -Value kubectl.exe

function Set-PsEnv {
    [CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = 'Low')]
    param($localEnvFile = ".\.env")

    #return if no env file
    if (!( Test-Path $localEnvFile)) {
        Throw "could not open $localEnvFile"
    }

    #read the local env file
    $content = Get-Content $localEnvFile -ErrorAction Stop
    Write-Verbose "Parsed .env file"

    #load the content to environment
    foreach ($line in $content) {
        if ($line.StartsWith("#")) { continue };
        if ($line.Trim()) {
            $line = $line.Replace("`"", "")
            $kvp = $line -split "=", 2
            if ($PSCmdlet.ShouldProcess("$($kvp[0])", "set value $($kvp[1])")) {
                [Environment]::SetEnvironmentVariable($kvp[0].Trim(), $kvp[1].Trim(), "Process") | Out-Null
            }
        }
    }
}

# Dracula readline configuration. Requires version 2.0, if you have 1.2 convert to `Set-PSReadlineOption -TokenType`
Set-PSReadlineOption -Color @{
    "Command"   = [ConsoleColor]::Green
    "Parameter" = [ConsoleColor]::Gray
    "Operator"  = [ConsoleColor]::Magenta
    "Variable"  = [ConsoleColor]::White
    "String"    = [ConsoleColor]::Yellow
    "Number"    = [ConsoleColor]::Blue
    "Type"      = [ConsoleColor]::Cyan
    "Comment"   = [ConsoleColor]::DarkCyan
}
# Dracula Prompt Configuration
Import-Module posh-git
$GitPromptSettings.DefaultPromptPrefix.Text = "$([char]0x2192) " # arrow unicode symbol
$GitPromptSettings.DefaultPromptPrefix.ForegroundColor = [ConsoleColor]::Green
$GitPromptSettings.DefaultPromptPath.ForegroundColor = [ConsoleColor]::Cyan
$GitPromptSettings.DefaultPromptSuffix.Text = "$([char]0x203A) " # chevron unicode symbol
$GitPromptSettings.DefaultPromptSuffix.ForegroundColor = [ConsoleColor]::Magenta
# Dracula Git Status Configuration
$GitPromptSettings.BeforeStatus.ForegroundColor = [ConsoleColor]::Blue
$GitPromptSettings.BranchColor.ForegroundColor = [ConsoleColor]::Blue
$GitPromptSettings.AfterStatus.ForegroundColor = [ConsoleColor]::Blue
