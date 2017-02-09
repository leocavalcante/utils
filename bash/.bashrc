source ~/.git-completion.bash
source ~/.git-prompt.sh

export DOCKER_TLS_VERIFY="1"
export DOCKER_HOST="tcp://192.168.99.100:2376"
export DOCKER_CERT_PATH="C:\Users\Leo\.docker\machine\machines\default"
export DOCKER_MACHINE_NAME="default"
export COMPOSE_CONVERT_WINDOWS_PATHS="true"
export no_proxy="192.168.99.100"
export COMPOSE_CONVERT_WINDOWS_PATHS=1

PS1='\n\[\033]0;\[\033[33m\]\w\[\033[36m\]`__git_ps1`\[\033[0m\] λ '
