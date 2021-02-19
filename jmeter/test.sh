#!/bin/bash

T_DIR=test_jmx

R_DIR=${T_DIR}/report1
ls -la
rm -rf ${R_DIR} > /dev/null 2>&1
#rm -rf /var/lib/jenkins/workspace/test/jmeter/test_jmx/report1 > /dev/null 2>&1

mkdir -p ${R_DIR}

/bin/rm -f ${T_DIR}/SOAP_jmeter_IPR_finaly_4.jtl ${T_DIR}/jmeter.log > /dev/null 2>&1

./run.sh -Dlog_level.jmeter=DEBUG \
	-n -t ${T_DIR}/SOAP_jmeter_IPR_finaly_4.jmx -l ${T_DIR}/SOAP_jmeter_IPR_finaly_4.jtl -j ${T_DIR}/jmeter.log \
	-e -o ${R_DIR}
