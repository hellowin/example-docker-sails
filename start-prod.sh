#!/usr/bin/env bash

unamestr=`uname`

if [[ "$unamestr" == 'Linux' ]]; then
    # Linux users will have their Docker host running natively.
    DOCKER_ADDRESS='localhost'
elif [[ "$unamestr" == 'Darwin' ]]; then
    if type "docker-machine" &> /dev/null; then
        DOCKER_ADDRESS=`docker-machine ip default`
    else
        DOCKER_ADDRESS=`boot2docker ip`
    fi
fi

echo "Your Docker address: $DOCKER_ADDRESS";

MYSQL_PORT_3306_TCP_ADDR=$DOCKER_ADDRESS \
MYSQL_PORT_3306_TCP_PORT=3306 \
MYSQL_ENV_MYSQL_USER=docker \
MYSQL_ENV_MYSQL_PASSWORD=dockerpassword \
MYSQL_ENV_MYSQL_DATABASE=docker_example \
NODE_ENV=production \
node app.js