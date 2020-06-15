Set-Alias -Name d -Value docker.exe
Set-Alias -Name dc -Value docker-compose.exe
Set-Alias -Name k -Value kubectl.exe
Set-Alias -Name dn -Value doctl.exe
Set-Alias -Name r -Value rancher.exe

function dr {
    docker run --rm -it `
        -v "$(pwd):/opt" `
        -w /opt `
        @args
}

function prompt {
    $p = Split-Path -Leaf -Path (Get-Location)
    $b = git rev-parse --abbrev-ref HEAD

    if ($b) {
        return "$p [$b]~ "
    }

    return "$p~ "
}

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

# cmd /c "vcvars64.bat&set" |
# foreach {
#   if ($_ -match "=") {
#     $v = $_.split("="); set-item -force -path "ENV:\$($v[0])"  -value "$($v[1])"
#   }
# }
