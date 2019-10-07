#!/usr/bin/env bash

docker-compose down --remove-orphans
sleep 15
rm -rf ./volumes/*
docker network rm ops-director-cluster_marklogicClusters
