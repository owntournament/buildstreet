#!/bin/bash

# Instructions following https://www.jenkins.io/doc/tutorials/build-a-java-app-with-maven/
docker run --name jenkins-docker --rm --detach \
  --privileged --network jenkins --network-alias docker \
  --env DOCKER_TLS_CERTDIR=/certs \
  --volume /data/jenkins/docker-certs:/certs/client \
  --volume /data/jenkins/data:/var/jenkins_home \
  --publish 3000:3000 \
  --publish 2376:2376 docker:dind


docker run --name jenkins-blueocean --rm --detach \
  --network jenkins --env DOCKER_HOST=tcp://docker:2376 \
  --env DOCKER_CERT_PATH=/certs/client --env DOCKER_TLS_VERIFY=1 \
  --publish 9085:8080 --publish 50000:50000 \
  --volume /data/jenkins/data:/var/jenkins_home \
  --volume /data/jenkins/docker-certs:/certs/client:ro \
  --volume /data/jenkins/home:/home \
  jenkins-blueocean:1.1

# docker run -d --rm -p 9085:8080 -p 50000:50000 --name jenkins -v /data/jenkins:/var/jenkins_home jenkins/jenkins:latest
