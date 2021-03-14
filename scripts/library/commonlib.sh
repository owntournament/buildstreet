applicationRunning() {
    if [ -z "$1" ]; then
        return 0
    elif [ ! "$(docker ps -q -f name=$1)" ]; then
        if [ "$(docker ps -aq -f status=exited -f name=$1)" ]; then
            # cleanup
            docker rm $1
        fi
        return 1
    else
        return 0
    fi
}

startApplicationIfNotRunning() {
    if [ -z "$APPLICATION" ] || [ -z "$CONTAINERS" ] || [ -z "$COMPOSE_FILE" ]; then
        echo "ERROR: not enough parameters"
        return 1
    fi
    for container in ${CONTAINERS[@]}; do
        if applicationRunning $container; then
            echo "$APPLICATION is still running. Shut it down first."
            return 1
        fi
    done

    # run your container
    echo "Starting $APPLICATION..."
    docker-compose -f $COMPOSE_FILE up $COMPOSE_EXTRA_ARGS -d
}

shutdownApplication() {
    if [ -z "$COMPOSE_FILE" ]; then
        echo "ERROR: not enough parameters"
        return 1
    fi
    docker-compose -f $COMPOSE_FILE down
}

# Entrypoint
OPERATION=${1^^}
if [ -z "$OPERATION" ] || [[ $OPERATION != "START" && $OPERATION != "STOP" ]]; then
    echo "Operation required"
    echo ""
    echo "<script> start  - starts the application"
    echo "<script> stop   - stops the application"
elif [ $OPERATION == "START" ]; then
    startApplicationIfNotRunning
else
    shutdownApplication
fi
