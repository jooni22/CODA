#!/usr/bin/env bash

docker-compose up -d
sleep 15

docker exec -it dev1.local init-marklogic
docker exec -it dev2.local create-cluster dev1.local dev2.local
docker exec -it dev3.local create-cluster dev1.local dev3.local

docker exec -it prod1.local init-marklogic
docker exec -it prod2.local create-cluster prod1.local prod2.local
docker exec -it prod3.local create-cluster prod1.local prod3.local

docker exec -it opsdirector.local init-marklogic

docker cp OpsDirector/gradle.properties opsdirector.local:/opt/opsdirector-2.0.1/
docker exec  -w /opt/opsdirector-2.0.1/ opsdirector.local ./gradlew mlDeploy




























