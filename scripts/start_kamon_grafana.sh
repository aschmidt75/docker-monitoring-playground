#!/bin/bash

# start kamon-grafana-dashboard
# http web ui is on :8503
# statsd metrics can be posted to 172.16.0.42:8125 (see post-..sh)
#

NAME=kamon-grafana-dashboard

( sudo docker stop $NAME && sudo docker rm $NAME ) >/dev/null 2>&1
sudo docker run -d -p 8503:80 -p 172.17.42.1:8125:8125/udp -p 8126:8126 \
	--name $NAME \
	kamon/grafana_graphite

