#!/bin/sh

IP=`wget -q -O -  http://whatismyip.akamai.com/` && (cat /usr/share/nginx/html/node-info.json | sed -e "s,\(\"nodePublicIp\": \)\"[^\"]*\",\1\"$IP\",g" -e "s,\(http://\)[^/]*,\1$IP,g") > /tmp/node-info.json
cat /tmp/node-info.json > /usr/share/nginx/html/node-info.json
nginx -g "daemon off;"
    