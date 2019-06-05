#!/bin/sh

ORI_IP=`wget -q -O -  http://whatismyip.akamai.com/`

if ! wget -O /dev/null --tries 1 --timeout 1 http://$ORI_IP ; then
  ORI_IP='127.0.0.1'
  (cat <<EOF
{
  "nodePublicIp": "127.0.0.1",
  "domain": "127.0.0.1",
  "tileServer": "http://127.0.0.1/v1/api/tile/{z}/{x}/{y}.pbf"
}
EOF
  ) > /tmp/node-info.json
else
  IP=`echo ${ORI_IP} | sed "s/\./-/g"`
  (cat <<EOF
{
  "nodePublicIp": "113.66.217.71",
  "domain": "113-66-217-71.tile.map3.network",
  "tileServer": "https://113.66.217.71/v1/api/tile/{z}/{x}/{y}.pbf"
}
EOF
  ) | sed -e "s,\(\"nodePublicIp\": \)\"[^\"]*\",\1\"$ORI_IP\",g" -e "s,\(\"domain\": \)\"[^\"]*\",\1\"$IP.tile.map3.network\",g" -e "s,\(https://\)[^/]*,\1$IP.tile.map3.network,g" > /tmp/node-info.json
fi

cat /tmp/node-info.json > /usr/share/nginx/html/node-info.json
