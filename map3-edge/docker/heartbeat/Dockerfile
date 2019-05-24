FROM elastic/heartbeat:7.1.0

COPY ./rootfs/heartbeat.yml /usr/share/heartbeat/heartbeat.yml

USER root

HEALTHCHECK CMD exit 0