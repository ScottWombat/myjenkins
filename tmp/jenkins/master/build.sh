#!/bin/bash
set -o nounset

JENKINS_CONTAINER_NAME="jenkins_controller"
JENKINS_HOME=`pwd`/jenkins_configuration
echo "JENKINS HOME: $JENKINS_HOME"

CONTAINER_NAME=$JENKINS_CONTAINER_NAME JENKINS_HOME=$JENKINS_HOME docker-compose -f docker-compose.yml up --build -d

sleep 10

# Here we have just installed git for our controller node, install as many tools as you require
docker exec $JENKINS_CONTAINER_NAME bash -c "apt-get update -y -q && apt-get upgrade -y -q && apt-get install -y -q git"