#!/bin/bash

JMETER_VERSION="5.3"

docker build --build-arg JMETER_VERSION=${JMETER_VERSION} -t "justb4/jmeter:${JMETER_VERSION}" . 
