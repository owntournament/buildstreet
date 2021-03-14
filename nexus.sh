#!/bin/bash

APPLICATION="nexus"
CONTAINERS=("nexus")
COMPOSE_FILE="$(dirname "$0")/nexus/docker-compose.yml"
COMPOSE_EXTRA_ARGS="-t 120"

source $(dirname "$0")/library/commonlib.sh