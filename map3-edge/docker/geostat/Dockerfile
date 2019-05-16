FROM python:2.7.15-alpine3.8

ARG S6_OVERLAY_VERSION=v1.21.4.0

RUN set -eux; \
    wget -O /tmp/s6-overlay-amd64.tar.gz https://github.com/just-containers/s6-overlay/releases/download/${S6_OVERLAY_VERSION}/s6-overlay-amd64.tar.gz \
    && tar xzf /tmp/s6-overlay-amd64.tar.gz -C / \
    && rm -rf /tmp/*

COPY ./rootfs/ /

RUN cd /opt/geostat/ && pip install -r requirements.txt 

COPY rootfs /
COPY ./rootfs/config/settings.ini /opt/geostat/settings.ini

ENTRYPOINT ["/init"]