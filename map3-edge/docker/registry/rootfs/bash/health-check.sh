#!/bin/sh

valid_ip=false
recent_updated=false

ip=$(jq -r '.nodePublicIp' /usr/share/nginx/html/node-info.json)
if [[ $ip != "127.0.0.1" ]]; then
    valid_ip = true
fi

if test `find /usr/share/nginx/html/node-info.json -type f -mmin -1`; then
    recent_updated=true
fi

if [[ $valid_ip && $recent_updated ]]; then
    exit 0
else
    exit 1
fi