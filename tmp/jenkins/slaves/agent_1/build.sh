#!/bin/bash
set -o nounset

ssh_key='/home/revit/.ssh/jenkins_agent_1.pub'
content=$(<"$ssh_key")
echo $content

JENKINS_CONTAINER_NAME="jenkins_controller"
JENKINS_AGENT_SSH_PUBKEY=$(<"$ssh_key")

CONTAINER_NAME=$JENKINS_CONTAINER_NAME JENKINS_AGENT_SSH_PUBKEY=$JENKINS_AGENT_SSH_PUBKEY docker-compose -f docker-compose.yml up --build -d

sleep 10

# Here we have just installed tools that help us create a python virtual environment for our agent node, install as many tools as you require
docker exec $JENKINS_CONTAINER_NAME bash -c "apt-get update -y -q && apt-get upgrade -y -q && apt-get install -y -q git python3 python3-venv"