#!/bin/sh

cd /src 

/usr/bin/docker-compose pull

/usr/bin/docker-compose up -d --no-build

exec tail -f /dev/null