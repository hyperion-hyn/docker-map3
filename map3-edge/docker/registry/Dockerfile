FROM arraylabs/docker-alpine-cron:latest

RUN apk add --no-cache jq
COPY ./rootfs/bash/entry.sh /entry.sh
COPY ./rootfs/bash/update-node-info.sh /update-node-info.sh
COPY ./rootfs/bash/health-check.sh /health-check.sh

ENTRYPOINT ["/docker-entry.sh"]
CMD ["/docker-cmd.sh"]