#!/usr/bin/env bash
unamestr=`uname`

if [[ "$unamestr" == 'Linux' ]]; then
    # Linux users will have their Docker host running natively.
    docker-compose stop
elif [[ "$unamestr" == 'Darwin' ]]; then
    if type "docker-machine" &> /dev/null; then
        eval "$(docker-machine env default)"
        docker-compose stop
        docker-machine stop default
    else
        # This sets a few required environment variables for docker connection
        eval "$(boot2docker shellinit)";
        docker-compose stop
        boot2docker down
    fi
fi
