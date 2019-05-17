#!/bin/sh

ORI_IP=`wget -q -O -  http://whatismyip.akamai.com/`

if ! wget -O /dev/null --tries 1 --timeout 1 http://$ORI_IP ; then
  ORI_IP='127.0.0.1'
fi

IP=`echo ${ORI_IP} | sed "s/\./-/g"`
(cat <<EOF
{
  "nodePublicIp": "113.66.217.71",
  "tileServer": "https://113.66.217.71/v1/api/tile/{z}/{x}/{y}.pbf"
}
EOF
) | sed -e "s,\(\"nodePublicIp\": \)\"[^\"]*\",\1\"$ORI_IP\",g" -e "s,\(https://\)[^/]*,\1$IP.tile.map3.network,g" > /tmp/node-info.json
cat /tmp/node-info.json > /usr/share/nginx/html/node-info.json
