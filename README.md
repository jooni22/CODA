# Coda

Containerized OpsDirector Application

## About

Coda is a development environment for testing MarkLogic clusters and OpsDirector. **It is not for production**.

Coda uses **Docker** containers to create 2 MarkLogic clusters (Dev and OpsDirector). It uses **Docker Compose** to create and manage the containers.  Docker **Volumes** are added to persist data.

This application creates the following container topology, in a custom Docker network:

* A MarkLogic **dev** cluster
  * dev1.local 
  * dev2.local
  * dev3.local
* A MarkLogic single-node **OpsDirector** cluster
  * opsdirector.local
  

It also uses an installOpsDirector Gradle service separately from the docker-compose stack.

## Running Coda

(Only macOS is currently supported.)

To run this application you will need:

* [Docker](https://hub.docker.com/editions/community/docker-ce-desktop-mac) 

* A [DockerHub](https://hub.docker.com/) account

First, got to MarkLogic's [DockerHub](https://hub.docker.com/_/marklogic?tab=resources) page and **proceed to checkout**. Enter your details and click **get content**. Choose the version of MarkLogic server you want to use.

``docker pull store/marklogicdb/marklogic-server:9.0-9-dev-centos``

In the directory in which you copied this repo, change the permissions of the bash scripts so they're exectuable.

``sudo chmod a+x teardown.sh``

Create a .env file containing

```
ML_VERSION=yourVersion
ADMIN=yourAdminUserName
PASSWORD=yourAdminPassword
```

### Start Coda

``docker-compose up -d``

#### Install OpsDirector on opsdirector.local

Run the installOpsDirector service:

``docker run --net coda_marklogicCluster -e username=admin -e password=yourPassword registry.gitlab.com/stuartmoorhouse/install.marklogic.ops.director ``

Then, set up *opsdirector.local* and *dev1.local*  to be managed by OpsDirector. See https://docs.marklogic.com/guide/opsdir/GettingStarted

### Stop the containers

``docker-compose stop``

### Start the containers

``docker-compose start``

### Teardown Coda

``./teardown.sh``


* Stops and removes the containers, and removes any orphan containers

* Removes the contents of  /volumes 

* Removes the custom network (*coda_marklogicCluster*)

## Access to the MarkLogic services

The OpsDirector web application can be viewed from you local host at: http://localhost:52008

A bash session on any of the containers can be started (on your local machine) with:

``docker exec -it {container name} bash``

## Port mapping

| Container         | View Admin on local machine | View QConsole on local machine |
| ----------------- | --------------------------- | ------------------------------ |
| dev1.local        | http://localhost:18001      | http://localhost:18000         |
| dev2.local        | http://localhost:28001      | http://localhost:28000         |
| dev3.local        | http://localhost:38001      | http://localhost:38000         |
| opsdirector.local | http://localhost:52001      | http://localhost:52000         |

