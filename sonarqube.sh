#!/bin/bash
# Set vm.max_map_count, see https://www.elastic.co/guide/en/elasticsearch/reference/current/docker.html#_set_vm_max_map_count_to_at_least_262144 and https://hub.docker.com/_/sonarqube
APPLICATION="sonarqube"
CONTAINERS=("sonarqube" "sonarpostgres")
COMPOSE_FILE="$(dirname "$0")/sonarqube/docker-compose.yml"
COMPOSE_EXTRA_ARGS="-t 3600"

source $(dirname "$0")/library/commonlib.sh