#!/bin/bash

readonly URL=${URL:-"http://127.0.0.1:3000"}
readonly LOGIN=${LOGIN:-"admin:admin"}

initialize() {
    if [ ! -e /var/lib/grafana/.user-admin-initialized ]; then
        curl -sSf --retry 15 --retry-connrefused --connect-timeout 2 --retry-delay 2 --retry-max-time 60 $URL
        echo "grafana service ready."
        curl -X POST --user "$LOGIN" $URL/api/user/stars/dashboard/1
        curl -X PUT --user "$LOGIN" -H "Content-Type: application/json" -d '{"theme":"", "timezone":"", "homeDashboardId":1}' $URL/api/org/preferences
        touch /var/lib/grafana/.user-admin-initialized
    fi
}

initialize &

/run.sh