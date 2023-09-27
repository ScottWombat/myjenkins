#!/bin/bash
ssh_key='/home/revit/.ssh/jenkins_agent_1.pub'
content=$(<"$ssh_key")
echo $content