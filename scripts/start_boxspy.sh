#!/bin/bash

# start Boxspy
# http web ui is on :8505
#

NAME=boxspy

( sudo docker stop $NAME && sudo docker rm $NAME ) >/dev/null 2>&1
sudo docker run \
  --volume=/:/rootfs:ro \
  --volume=/var/run:/var/run:rw \
  --volume=/sys:/sys:ro \
  --volume=/var/lib/docker/:/var/lib/docker:ro \
  --publish=8505:8080 \
  --detach=true \
  --name=$NAME \
  gwos/boxspy:canary

