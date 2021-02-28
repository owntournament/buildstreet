#!/bin/bash
docker run -d --rm -p 9000:9000 \
	--name sonarqube \
	--stop-timeout 3600 \
	--net=host \
	-e SONARQUBE_JDBC_URL=jdbc:postgresql://localhost:5432/sonarqube \
	-e SONARQUBE_JDBC_USERNAME=sonarqube \
	-e SONARQUBE_JDBC_PASSWORD=Ikzf8kJlAPK6AoF3*4Gp*eIEua4EZf \
	-v sonarqube_conf:/opt/sonarqube/conf \
	-v sonarqube_extensions:/opt/sonarqube/extensions \
	-v sonarqube_logs:/opt/sonarqube/logs \
	-v sonarqube_data:/opt/sonarqube/data \
	sonarqube:lts
