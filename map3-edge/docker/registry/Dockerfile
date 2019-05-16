FROM arraylabs/docker-alpine-cron:latest

COPY ./rootfs/bash/entry.sh /entry.sh
COPY ./rootfs/bash/update-node-info.sh /update-node-info.sh

ENTRYPOINT ["/docker-entry.sh"]
CMD ["/docker-cmd.sh"]