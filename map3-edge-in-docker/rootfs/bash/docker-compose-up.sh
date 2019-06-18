#!/bin/sh

docker pull map3/map3
docker pull map3/titan
docker pull map3/caddy
docker pull map3/registry:1.0.0
docker pull map3/influxdb:1.7
docker pull map3/telegraf:1.9
docker pull map3/grafana:5.4
docker pull map3/filebeat:7.1
docker pull map3/metricbeat:7.1
docker pull map3/heartbeat:7.1
docker pull map3/logrotate:1.3
docker pull map3/geostat:1.0.0
docker pull map3/ouroboros

cd /src && exec /usr/bin/docker-compose up --no-build