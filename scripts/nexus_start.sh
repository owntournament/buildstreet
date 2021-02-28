#!/bin/bash
docker run -d --rm -p 8082:8082 -p 8083:8083 -p 9081:8081 --name nexus -v /data/nexus-data:/nexus-data sonatype/nexus3
