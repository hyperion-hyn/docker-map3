#!/bin/sh

# IP=`wget -q -O -  http://whatismyip.akamai.com/` && (cat /usr/share/nginx/html/node-info.json | sed -e "s,\(\"nodePublicIp\": \)\"[^\"]*\",\1\"$IP\",g" -e "s,\(http://\)[^/]*,\1$IP,g") > /tmp/node-info.json
ORI_IP=`wget -q -O -  http://whatismyip.akamai.com/`
IP=`echo ${ORI_IP} | sed "s/\./-/g"` && (cat /usr/share/nginx/html/node-info.json | sed -e "s,\(\"nodePublicIp\": \)\"[^\"]*\",\1\"$ORI_IP\",g" -e "s,\(https://\)[^/]*,\1${IP}.tile.map3.network,g") > /tmp/node-info.json
cat /tmp/node-info.json > /usr/share/nginx/html/node-info.json
nginx -g "daemon off;"
    