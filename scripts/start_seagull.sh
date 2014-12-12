#!/bin/bash

# start seagull, from https://github.com/tobegit3hub/seagull
# web ui is on :8502

NAME=seagull

( sudo docker stop $NAME && sudo docker rm $NAME ) >/dev/null 2>&1
docker run -d -p 8502:10086 \
	--name $NAME \
	-v /var/run/docker.sock:/var/run/docker.sock \
	tobegit3hub/seagull
