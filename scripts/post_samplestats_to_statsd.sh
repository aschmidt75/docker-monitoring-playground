#!/bin/bash

while true; do	
	sleep 1
	FREE=`vmstat 1 1 | tail -1 | awk '{ print $4 }'`
	BUFF=`vmstat 1 1 | tail -1 | awk '{ print $4 }'`
	CACHE=`vmstat 1 1 | tail -1 | awk '{ print $4 }'`

	NUM_IMAGES=`docker images -q | wc -l`
	NUM_ALL_IMAGES=`docker images -q -a | wc -l`
	NUM_RUNNING_CONTAINERS=`docker ps -q | wc -l`
	NUM_ALL_CONTAINERS=`docker ps -q -a | wc -l`

	echo -n "localhost.vmstat.free:$FREE|g" | nc -w 1 -u 127.0.0.1 8125
	echo -n "localhost.vmstat.buff:$BUFF|g" | nc -w 1 -u 127.0.0.1 8125
	echo -n "localhost.vmstat.cache:$CACHE|g" | nc -w 1 -u 127.0.0.1 8125
	
	echo -n "localhost.docker.num_images:$NUM_IMAGES|g" | nc -w 1 -u 127.0.0.1 8125
	echo -n "localhost.docker.num_all_images:$NUM_ALL_IMAGES|g" | nc -w 1 -u 127.0.0.1 8125
	echo -n "localhost.docker.num_containers:$NUM_RUNNING_CONTAINERS|g" | nc -w 1 -u 127.0.0.1 8125
	echo -n "localhost.docker.num_all_containers:$NUM_ALL_CONTAINERS|g" | nc -w 1 -u 127.0.0.1 8125
done

