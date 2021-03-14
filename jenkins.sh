#!/bin/bash
# Instructions following https://www.jenkins.io/doc/tutorials/build-a-java-app-with-maven/
APPLICATION="jenkins"
CONTAINERS=("jenkins-docker" "jenkins-blueocean")
COMPOSE_FILE="$(dirname "$0")/jenkins/docker-compose.yml"
COMPOSE_EXTRA_ARGS="-t 120 --build"

source $(dirname "$0")/library/commonlib.sh