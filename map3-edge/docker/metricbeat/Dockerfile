FROM elastic/metricbeat:6.5.4

COPY ./rootfs/metricbeat.yml /usr/share/metricbeat/metricbeat.yml
COPY ./rootfs/modules.d/ /usr/share/metricbeat/modules.d/

USER root

HEALTHCHECK CMD exit 0