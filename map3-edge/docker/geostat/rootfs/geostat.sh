#!/bin/sh

/optimize-influxdb.sh && /usr/bin/geostat "$@"

