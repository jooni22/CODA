FROM gradle:5.6 

RUN wget https://developer.marklogic.com/download/binaries/opsdirector/opsdirector-2.0.1.zip 

RUN unzip -d /opt/ opsdirector-2.0.1.zip

COPY gradle.properties /opt/opsdirector-2.0.1/

WORKDIR /opt/opsdirector-2.0.1/

CMD gradle mlDeploy