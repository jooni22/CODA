FROM store/marklogicdb/marklogic-server:9.0-9-dev-centos
USER root

# Get any CentOS updates then clear the Docker cache
RUN yum -y update && yum clean all

# Install Java and Gradle
RUN yum -y update && yum clean all
RUN yum -y install java-1.8.0-openjdk wget unzip

RUN wget https://services.gradle.org/distributions/gradle-4.3-bin.zip
RUN mkdir /opt/gradle
RUN unzip -d /opt/gradle gradle-4.3-bin.zip

ENV PATH="/opt/gradle/gradle-4.3/bin:${PATH}"
ENV JAVA_HOME=/usr/lib/jvm/jre-1.8.0-openjdk-1.8.0.222.b10-1.el7_7.x86_64

# add git
RUN yum install git -y

## logic to setup OpsDirector:
RUN wget https://developer.marklogic.com/download/binaries/opsdirector/opsdirector-2.0.1.zip 
RUN unzip -d /opt/ opsdirector-2.0.1.zip

# Expose MarkLogic Server ports and Middle-tier ports
# Also expose any ports your own MarkLogic App Servers use such as
# HTTP, REST and XDBC App Servers for your applications
# EXPOSE 7997 7998 7999 8000 8001 8002 8010 8015

# Start MarkLogic from init.d script.
# Define default command (which avoids immediate shutdown)
# CMD /etc/init.d/MarkLogic start && tail -f /dev/null





