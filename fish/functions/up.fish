function up --description "Starts a php:apache Docker container using the current path on a random port"
    set -l port (shuf -i 8000-8099 -n 1)
    set -l cdir (pwd | string replace 'cygdrive' '')
    subl .
    cygstart http://docker:{$port}
    docker run --rm -v $cdir:/var/www/html -p {$port}:80 php:apache
end
