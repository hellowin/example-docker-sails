#!/usr/bin/env bash
unamestr=`uname`

if [[ "$unamestr" == 'Linux' ]]; then
    # Linux users will have their Docker host running natively.
    DOCKER_ADDRESS='localhost'
elif [[ "$unamestr" == 'Darwin' ]]; then
    if type "docker-machine" &> /dev/null; then

        # create hellowin-dev machine first if it's not available
        value=$( docker-machine ls | grep -ic "default" )
        if [ $value -eq 1 ]
        then
          echo "docker-machine is used and required machine already exist"
        else
          echo "docker-machine is used and required machine is not exist, automatically create it"
          docker-machine create --driver virtualbox default
        fi

        docker-machine start default
        eval "$(docker-machine env default)"
        DOCKER_ADDRESS=`docker-machine ip default`
    else
       # This sets up a VM which runs a Docker engine
        boot2docker up;

        # This sets a few required environment variables for docker connection
        eval "$(boot2docker shellinit)";

        DOCKER_ADDRESS=`boot2docker ip`
    fi
fi

echo "Your Docker address: $DOCKER_ADDRESS";

docker-compose up -d
