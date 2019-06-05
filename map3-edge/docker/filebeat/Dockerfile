FROM elastic/filebeat:7.1.0

COPY ./rootfs/filebeat.yml /usr/share/filebeat/filebeat.yml
COPY ./rootfs/modules.d/ /usr/share/filebeat/modules.d/
COPY ./rootfs/default.json /usr/share/filebeat/module/nginx/access/ingest/default.json
COPY ./rootfs/nginx-access.yml /usr/share/filebeat/module/nginx/access/config/nginx-access.yml


USER root