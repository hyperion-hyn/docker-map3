FROM elastic/filebeat:7.1.0

COPY ./rootfs/filebeat.yml /usr/share/filebeat/filebeat.yml
COPY ./rootfs/modules.d/ /usr/share/filebeat/modules.d/
COPY ./rootfs/default.json /usr/share/filebeat/module/nginx/access/ingest/default.json

USER root