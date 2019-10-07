# Coda

Containerized OpsDirector Application

##About

Coda is development environment for testing MarkLogic clusters and OpsDirector. **It is not for production**.

Coda uses **Docker** containers to create 3 MarkLogic clusters (Dev, Prod and OpsDirector). It uses **Docker Compose** to create and manage the containers and bash scripts to automate the containers' configuration. Docker **Volumes** are added to persist data.

This application creates the following container topology, in a custom Docker network:

* A MarkLogic **dev** cluster
  * dev1.local 
  * dev2.local
  * dev3.local
* A MarkLogic **prod** cluster
  * prod1.local
  * prod2.local
  * prod3.local
* A MarkLogic single-node **OpsDirector** cluster
  * opsdirector.local

## Running Coda

(Only macOS is currently supported.)

To run this application you will need:

* [Docker](https://hub.docker.com/editions/community/docker-ce-desktop-mac) 

* Access to the [MarkLogic Docker Registry](https://mlregistry.marklogic.com/repositories) 

In the directory in which you copied this repo, change the permissions of the bash scripts so they're exectuable.

``sudo chmod a+x set-up-cluster.sh``

``sudo chmod a+x teardown.sh``

###Bootstrap Coda

``./set-up-cluster.sh``

This script:

* builds the containers, runs them and then links the MarkLogic instances on them into clusters

* installs OpsDirector

Set up *opsdirector.local*, *dev1.local* and *prod1.local* to be managed by OpsDirector. See https://docs.marklogic.com/guide/opsdir/GettingStarted

###Stop the containers

``docker-compose stop``

###Start the containers

``docker-compose start``

###Teardown Coda

``./teardown.sh``

This script:

* Stops and removes the containers, and removes any orphan containers

* Removes the contents of  /volumes 

* Removes the custom network (*ops-director-cluster_marklogicCluster*)

##Access to the MarkLogic services

The OpsDirector web application can be viewed from you local host at: http://localhost:52008

A bash session on any of the containers can be started (on your local machine) with:

``docker exec -it {container name} bash``

##Port mapping

| Container         | View Admin on local machine | View QConsole on local machine |
| ----------------- | --------------------------- | ------------------------------ |
| dev1.local        | http://localhost:18001      | http://localhost:18000         |
| dev2.local        | http://localhost:28001      | http://localhost:28000         |
| dev2.local        | http://localhost:38001      | http://localhost:38000         |
| prod1.local       | http://localhost:48001      | http://localhost:48000         |
| prod2.local       | http://localhost:58001      | http://localhost:58000         |
| prod3.local       | http://localhost:51011      | http://localhost:68000         |
| opsdirector.local | http://localhost:52011      | http://localhost:78100         |

