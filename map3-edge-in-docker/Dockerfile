FROM docker:18.09-dind

ARG S6_OVERLAY_VERSION=v1.21.4.0

RUN set -eux; \
    wget -O /tmp/s6-overlay-amd64.tar.gz https://github.com/just-containers/s6-overlay/releases/download/${S6_OVERLAY_VERSION}/s6-overlay-amd64.tar.gz \
    && tar xzf /tmp/s6-overlay-amd64.tar.gz -C / \
    && rm /tmp/*

RUN apk add --no-cache py-pip 
RUN pip install --upgrade pip && pip install docker-compose

COPY ./map3-edge-in-docker/rootfs/ /

COPY ./map3-edge /src

EXPOSE 80 3000

ENTRYPOINT [ "/init" ]
