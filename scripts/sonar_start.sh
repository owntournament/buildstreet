#!/bin/bash
docker-compose -f "sonarqube\docker-compose.yml" up -t 3600 -d --build