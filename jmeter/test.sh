#!/bin/bash

JMETER_HOME=opt/apache-jmeter-5.3/bin

./run.sh -Dlog_level.jmeter=DEBUG \
	-n -t ${JMETER_HOME}/SOAP_jmeter_IPR_finaly_4.jmx -l SOAP_jmeter_IPR_finaly_4.jtl -j jmeter.log \
	-e -o tmp
