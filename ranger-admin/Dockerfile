FROM centos:latest

LABEL author="Nathaniel Vala" email="nathanielvala@hotmail.com"
LABEL version="0.1-beta"

ARG RANGER_VERSION=2.0.0
ENV JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk
ENV RANGER_HOME=/opt/ranger-${RANGER_VERSION}-admin
ENV passwd=security


COPY binary/ranger-${RANGER_VERSION}-admin.tar.gz /opt
COPY ranger-entrypoint.sh /opt


ADD https://jdbc.postgresql.org/download/postgresql-42.2.1.jar /opt
RUN yum update && yum install -y wget python maven git net-tools vim lsof mysql-connector-java bc


WORKDIR /opt
RUN chmod +x /opt/ranger-entrypoint.sh \
    && tar -xvzf ranger-${RANGER_VERSION}-admin.tar.gz


COPY install.properties ${RANGER_HOME}

EXPOSE 6080

ENTRYPOINT ["/opt/ranger-entrypoint.sh"]