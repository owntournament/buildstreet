#!/bin/bash

# Instructions following https://www.jenkins.io/doc/tutorials/build-a-java-app-with-maven/
docker-compose -f "jenkins\docker-compose.yml" up -t 120 -d --build