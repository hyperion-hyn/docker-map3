#!/bin/sh

IP=`wget -q -O -  http://whatismyip.akamai.com/`
(cat <<EOF
{
  "nodePublicIp": "113.66.217.71",
  "tileServer": "http://113.66.217.71/v1/api/tile/{z}/{x}/{y}.pbf"
}
EOF
) | sed -e "s,\(\"nodePublicIp\": \)\"[^\"]*\",\1\"$IP\",g" -e "s,\(http://\)[^/]*,\1$IP,g" > /tmp/node-info.json
cat /tmp/node-info.json > /usr/share/nginx/html/node-info.json
