#!/bin/bash


NAME="jmeter"
IMAGE="justb4/jmeter:5.3"

sudo docker stop ${NAME} > /dev/null 2>&1
sudo docker rm ${NAME} > /dev/null 2>&1
sudo docker run --name ${NAME} -i -v ${PWD}:${PWD} -w ${PWD} ${IMAGE} $@
