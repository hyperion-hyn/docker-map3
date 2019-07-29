#!/bin/sh

/optimize-influxdb.sh && /usr/bin/telegraf "$@"

