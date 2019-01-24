#!/bin/sh
set -e
/update-node-info.sh
exec /docker-entry.sh "$@"
