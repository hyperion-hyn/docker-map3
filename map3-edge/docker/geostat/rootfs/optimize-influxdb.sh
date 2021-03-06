#!/bin/sh
# refer: https://pommi.nethuis.nl/collectd-influxdb-grafana-with-downsampling/

options=`cat /etc/geostat/geostat.json | grep -E '(port|host|database)' | sed -e 's/"[ ]*:[ ]*"/":"/g' -e 's/^[ ]*//' -e 's/,[ ]*$//'`
database=`printf "$options" | sed -n -e '/database/p' | sed -e 's/^[^:]*://' -e 's/"//g'`
host=`printf "$options" | sed -n -e '/host/p' | sed -e 's/^[^:]*://' -e 's/"//g'`
port=`printf "$options" | sed -n -e '/port/p' | sed -e 's/^[^:]*://' -e 's/"//g'`

if [[ ! -z "$host" -a ! -z "$port" -a ! -z "$database" ]]; then
url="http://$host:$port"

curl --retry 10 --retry-connrefused --retry-delay 1 "$url/ping"

curl -i -XPOST "$url/query" --data-urlencode "q=
CREATE DATABASE $database;
ALTER RETENTION POLICY \"autogen\" on $database DURATION 200m SHARD DURATION 1h;
CREATE RETENTION POLICY \"day\" ON $database DURATION 1d REPLICATION 1;
CREATE RETENTION POLICY \"week\" ON $database DURATION 7d REPLICATION 1;
CREATE RETENTION POLICY \"month\" ON $database DURATION 31d REPLICATION 1;
CREATE RETENTION POLICY \"year\" ON $database DURATION 366d REPLICATION 1;

CREATE CONTINUOUS QUERY \"cq_day\" ON \"$database\" BEGIN SELECT sum(count) as count INTO \"$database\".\"day\".:MEASUREMENT FROM /.*/ GROUP BY time(60s),* END;
CREATE CONTINUOUS QUERY \"cq_week\" ON \"$database\" BEGIN SELECT sum(count) as count INTO \"$database\".\"week\".:MEASUREMENT FROM /.*/ GROUP BY time(300s),* END;
CREATE CONTINUOUS QUERY \"cq_month\" ON \"$database\" BEGIN SELECT sum(count) as count INTO \"$database\".\"month\".:MEASUREMENT FROM /.*/ GROUP BY time(1800s),* END;
CREATE CONTINUOUS QUERY \"cq_year\" ON \"$database\" BEGIN SELECT sum(count) as count INTO \"$database\".\"year\".:MEASUREMENT FROM /.*/ GROUP BY time(21600s),* END;

CREATE RETENTION POLICY \"forever\" ON \"$database\" DURATION INF REPLICATION 1;
"


curl -i -XPOST "$url/write?db=$database&rp=forever" --data-binary "
rp_config,idx=1 rp=\"autogen\",start=0i,end=12000000i,interval=\"10s\" -9223372036854775806
rp_config,idx=2 rp=\"day\",start=12000000i,end=86401000i,interval=\"60s\" -9223372036854775806
rp_config,idx=3 rp=\"week\",start=86401000i,end=604801000i,interval=\"300s\" -9223372036854775806
rp_config,idx=4 rp=\"month\",start=604801000i,end=2678401000i,interval=\"1800s\" -9223372036854775806
rp_config,idx=5 rp=\"year\",start=2678401000i,end=31622401000i,interval=\"21600s\" -9223372036854775806
"

fi

exit 0
