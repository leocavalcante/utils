New-Alias -Name "dc" -Value docker-compose.exe

function Prompt {
  $p = Split-Path -Leaf -Path (Get-Location)
  $b = git rev-parse --abbrev-ref HEAD

  if ($b) {
    return "$p [$b]~ "
  }

  return "$p~ "
}

cmd /c "vcvars64.bat&set" |
foreach {
  if ($_ -match "=") {
    $v = $_.split("="); set-item -force -path "ENV:\$($v[0])"  -value "$($v[1])"
  }
}
