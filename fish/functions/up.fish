function up --description "Starts a php:apache Docker container using the current path on a random port or the Docker compose"
    subl .

    if test -e ./docker-compose.yml
        cygstart http://docker:{$argv}
        docker-compose up
    else
        set -l cdir (pwd | string replace 'cygdrive' '')
        set -l port (shuf -i 8000-8099 -n 1)

        cygstart http://docker:{$port}
        docker run --rm -v {$cdir}:/var/www/html -p {$port}:80 php:apache
    end
end
