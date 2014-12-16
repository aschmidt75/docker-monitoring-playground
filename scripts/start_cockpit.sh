#!/bin/bash

# start cockpit, from https://github.com/cockpit-project/cockpit/blob/master/tools/Dockerfile 
# web ui is on :8504

NAME=cockpit

( sudo docker stop $NAME && sudo docker rm $NAME ) >/dev/null 2>&1
docker run --privileged -v /:/host -d \
	--name $NAME \
	-p 8504:9090 \
	stefwalter/cockpit-atomic:wip
