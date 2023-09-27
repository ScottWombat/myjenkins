Implement controller/agent jenkins

1. create ssh pair key: > ssh-keygen -t rsa -f jenkins_agent

2. Broswe http://localhost:8080

3. Create a credential for an agent

3.1 On Dashboard,select Manage Jenkins/Crededential

3.2 Select global in Domain column

3.3 Click Add credentials

3.3.1 Fill info below:
    kind: SSH Username with private key
    scope: Global(Jenkins,nodes,items allchild item,etc)
    ID: Any name
3.3.2 Add ssh private key

3.4. Create node

Name: JenkinsAgent1

NumberOfExecutors: 1-2

RemoteRootDirectory: /home/jenkins/agent-1

Labels: linux, python # Space separated values, Can be useful to restrict jobs to run on a particular agent

Usage: Use this node as much as possible

Launch Method: Launch agents via SSH

Host: jenkins_agent # Agent's Hostname or IP to connect. (docker-compose service name if controller and agent is on the same machine)

Credentials: Select the Credential created in Step 2

HostKeyVerificationStrategy: Non verifying Verification Strategy

Launch Method > Advanced

ConnectionTimeoutInSeconds: 60
MaximumNumberOfRetries: 10
SecondsToWaitBetweenRetries: 15

Source:
https://dev.to/ashiqursuperfly/jenkins-controller-agent-master-slave-setup-in-10-minutes-using-docker-2a78


Nexus account
userid:admin username:admin password:rev123
userid:developement username:developer password:dev123
