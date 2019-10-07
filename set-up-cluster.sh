#!/usr/bin/env bash

docker-compose up -d
sleep 15

docker cp OpsDirector/gradle.properties opsdirector.local:/opt/opsdirector-2.0.1/
docker exec  -w /opt/opsdirector-2.0.1/ opsdirector.local ./gradlew mlDeploy
























