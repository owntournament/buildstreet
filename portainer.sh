#!/bin/bash

APPLICATION="portainer"
CONTAINERS=("portainer")
COMPOSE_FILE="$(dirname "$0")/portainer/docker-compose.yml"

source $(dirname "$0")/library/commonlib.sh