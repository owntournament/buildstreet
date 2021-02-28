#!/bin/bash
docker run -d --rm -p 9079:8000 -p 9080:9000 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v /data/portainer:/data portainer/portainer-ce
