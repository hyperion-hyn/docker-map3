FROM alpine

RUN apk add --update --no-cache curl bash \
    && rm -rf /var/cache/apk/*

# Download filebeat-7.1.0 linux x86_64 and move to /usr/share/filebeat
RUN curl -Lso - https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-7.1.0-linux-x86_64.tar.gz | \
    tar zxf - -C /tmp && \
    mv /tmp/filebeat-7.1.0-linux-x86_64 /usr/share/filebeat

# Insert glibc-2.29-r0.apk for running gcc application
RUN wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub \ 
    && wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.29-r0/glibc-2.29-r0.apk \ 
    && apk add glibc-2.29-r0.apk

ENV ELASTIC_CONTAINER true
ENV PATH=/usr/share/filebeat:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

# Add entrypoint wrapper script
ADD ./rootfs/docker-entrypoint /usr/local/bin
RUN chmod 755 /usr/local/bin/docker-entrypoint

# Provide a non-root user.
RUN addgroup -g 1000 -S filebeat && \
    adduser -u 1000 -G filebeat -h /usr/share/filebeat -S -D filebeat

# Provide a non-root user.
WORKDIR /usr/share/filebeat
RUN mkdir data logs && \
    chown -R root:filebeat . && \
    find /usr/share/filebeat -type d -exec chmod 0750 {} \; && \
    find /usr/share/filebeat -type f -exec chmod 0640 {} \; && \
    chmod 0750 /usr/share/filebeat/filebeat && \chmod 0770 modules.d && \
    chmod 0770 data logs

COPY ./rootfs/filebeat.yml /usr/share/filebeat/filebeat.yml
COPY ./rootfs/modules.d/ /usr/share/filebeat/modules.d/
COPY ./rootfs/default.json /usr/share/filebeat/module/nginx/access/ingest/default.json
COPY ./rootfs/nginx-access.yml /usr/share/filebeat/module/nginx/access/config/nginx-access.yml

USER root
ENTRYPOINT ["/usr/local/bin/docker-entrypoint"]
CMD ["-e"]