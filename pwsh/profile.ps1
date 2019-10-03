Set-Alias -Name d -Value docker.exe
Set-Alias -Name dc -Value docker-compose.exe

function du {
  docker run --rm -it `
    -v "$(pwd):/usr/local/src" `
    -w /usr/local/src `
    -p "8000:80" `
    -p "8080:8080" `
    -p "3000:3000" `
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

# cmd /c "vcvars64.bat&set" |
# foreach {
#   if ($_ -match "=") {
#     $v = $_.split("="); set-item -force -path "ENV:\$($v[0])"  -value "$($v[1])"
#   }
# }
