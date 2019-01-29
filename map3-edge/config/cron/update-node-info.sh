#!/bin/sh

IP=`wget -q -O -  http://whatismyip.akamai.com/`

if ! wget -O /dev/null --tries 1 --timeout 1 http://$IP ; then
  IP='127.0.0.1'
fi

(cat <<EOF
{
  "nodePublicIp": "113.66.217.71",
  "tileServer": "http://113.66.217.71/v1/api/tile/{z}/{x}/{y}.pbf"
}
EOF
) | sed -e "s,\(\"nodePublicIp\": \)\"[^\"]*\",\1\"$IP\",g" -e "s,\(http://\)[^/]*,\1$IP,g" > /tmp/node-info.json
cat /tmp/node-info.json > /usr/share/nginx/html/node-info.json
