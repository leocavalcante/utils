New-Alias -Name "dc" -Value docker-compose.exe

function Prompt {
  $p = Split-Path -Leaf -Path (Get-Location)
  $b = git rev-parse --abbrev-ref HEAD

  if ($b) {
    return "$p [$b]~ "
  }

  return "$p~ "
}
