#!/usr/bin/env bash

list=$(docker ps -aq)

if ! [ -z $list ]
then
    docker stop $list
    docker rm $list
fi
docker ps -aq