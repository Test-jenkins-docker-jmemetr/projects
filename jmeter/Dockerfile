FROM alpine:3.12

MAINTAINER Gimaziev Ruslan


ARG JMETER_VERSION="5.3"
ENV JMETER_HOME /opt/apache-jmeter-${JMETER_VERSION}
ENV JMETER_BIN  ${JMETER_HOME}/bin
ENV JMETER_DOWNLOAD_URL https://archive.apache.org/dist/jmeter/binaries/apache-jmeter-${JMETER_VERSION}.tgz
ENV JMETER_PLUGINS_DOWNLOAD_URL https://jmeter-plugins.org/files/packages
ENV JMETER_PLAGIN_MANAGER https://repo1.maven.org/maven2/kg/apc/jmeter-plugins-manager/1.6
ENV JMETER_PLUGINS_FOLDER ${JMETER_HOME}/lib
#ENV JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk/jre

#WORKDIR /opt/apache-jmeter-5.2.1

#ARG TZ = "Europe/Moscow"
RUN apk update \
	&& apk upgrade \
	&& apk add ca-certificates \
	&& update-ca-certificates \
	&& apk add --update openjdk8-jre tzdata curl unzip bash \
	&& apk add --no-cache nss \
	&& rm -rf /var/cache/apk/* \
	&& mkdir -p /tmp/dependencies \
	&& curl -L --silent ${JMETER_DOWNLOAD_URL} > /tmp/dependencies/apache-jmeter-${JMETER_VERSION}.tgz \
	&& mkdir -p /opt \
	&& tar -xzf /tmp/dependencies/apache-jmeter-${JMETER_VERSION}.tgz -C /opt \
	&& rm -rf /tmp/dependencies \
	&& curl -OL https://raw.github.com/Test-jenkins-docker-jmemetr/projects/blob/main/jmeter/test_jmx/SOAP_jmeter_IPR_finaly_4.jmx > ${JMETER_HOME}/bin/SOAP_jmeter_IPR_finaly_4.jmx \
	&& curl -OL https://raw.github.com/Test-jenkins-docker-jmemetr/projects/blob/main/jmeter/test_jmx/USAgorod.txt > ${JMETER_HOME}/bin/USAgorod.txt

#RUN curl -OL --silent ${JMETER_PLAGIN_MANAGER}/jmeter-plugins-manager-1.6.jar > ${JMETER_PLUGINS_FOLDER}/ext/jmeter-plugins-manager-1.6.jar

RUN curl -OL --silent ${JMETER_PLUGINS_DOWNLOAD_URL}/bzm-random-csv-0.6.zip > ${JMETER_HOME}/bzm-random-csv-0.6.zip

RUN curl -OL --silent ${JMETER_PLUGINS_DOWNLOAD_URL}/jpgc-casutg-2.9.zip > ${JMETER_HOME}/jpgc-casutg-2.9.zip

RUN cd ${JMETER_HOME}/lib
RUN unzip bzm-random-csv-0.6.zip -d ${JMETER_HOME}
RUN unzip jpgc-casutg-2.9.zip -d ${JMETER_HOME}
RUN ls -la
RUN curl -L --silent ${JMETER_PLAGIN_MANAGER}/jmeter-plugins-manager-1.6.jar > ${JMETER_PLUGINS_FOLDER}/ext/jmeter-plugins-manager-1.6.jar
RUN ls -la \
    && cd ${JMETER_PLUGINS_FOLDER} \
    && ls -la
RUN cd ${JMETER_PLUGINS_FOLDER}/ext \
    && ls -la
ENV PATH $PATH:$JMETER_BIN

COPY entrypoint.sh /

WORKDIR ${JMETER_HOME}

ENTRYPOINT ["/entrypoint.sh"]
