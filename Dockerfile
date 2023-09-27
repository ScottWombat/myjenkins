FROM jenkins/jenkins:lts

USER root

# install docker cli
RUN apt-get -y update; apt-get install -y sudo; apt-get install -y git wget unzip
RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers
RUN wget http://get.docker.com/builds/Linux/x86_64/docker-latest.tgz
RUN tar -xvzf docker-latest.tgz
RUN mv docker/* /usr/bin/

# update system and install chinese language support and maven nodejs
RUN apt-get update && apt-get install -y maven nodejs \
    && rm -rf /var/lib/apt/lists/* 


USER jenkins