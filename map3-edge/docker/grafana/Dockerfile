FROM alpine:3.9

LABEL maintainer "ChenBin <chenbin@hyn.space>"

ENV GRAFANA_VERSION=6.2.5

ARG GRAFANA_URL="https://s3-us-west-2.amazonaws.com/grafana-releases/release/grafana-${GRAFANA_VERSION}.linux-amd64.tar.gz"
ARG GF_UID="472"
ARG GF_GID="472"

ENV PATH=/usr/share/grafana/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin \
    GF_PATHS_CONFIG="/etc/grafana/grafana.ini" \
    GF_PATHS_DATA="/var/lib/grafana" \
    GF_PATHS_HOME="/usr/share/grafana" \
    GF_PATHS_LOGS="/var/log/grafana" \
    GF_PATHS_PLUGINS="/var/lib/grafana/plugins" \
    GF_PATHS_PROVISIONING="/etc/grafana/provisioning"

RUN apk add --update --no-cache fontconfig libc6-compat \
    curl \
    ca-certificates \
    bash && \
    mkdir -p "$GF_PATHS_HOME/.aws" && \
    curl "$GRAFANA_URL" | tar xfvz - --strip-components=1 -C "$GF_PATHS_HOME" && \
    addgroup -g $GF_GID -S grafana && \
    adduser -u $GF_UID -G grafana -D grafana && \
    mkdir -p "$GF_PATHS_PROVISIONING/datasources" \
    "$GF_PATHS_PROVISIONING/dashboards" \
    "$GF_PATHS_LOGS" \
    "$GF_PATHS_PLUGINS" \
    "$GF_PATHS_DATA" && \
    cp "$GF_PATHS_HOME/conf/sample.ini" "$GF_PATHS_CONFIG" && \
    cp "$GF_PATHS_HOME/conf/ldap.toml" /etc/grafana/ldap.toml && \
    chown -R grafana:grafana "$GF_PATHS_DATA" "$GF_PATHS_HOME/.aws" "$GF_PATHS_LOGS" "$GF_PATHS_PLUGINS" && \
    chmod 777 "$GF_PATHS_DATA" "$GF_PATHS_HOME/.aws" "$GF_PATHS_LOGS" "$GF_PATHS_PLUGINS" && \
    install -m 755 /usr/share/grafana/bin/grafana-server /usr/local/bin/ && rm -rf /usr/share/grafana/bin/grafana-server && \
    install -m 755 /usr/share/grafana/bin/grafana-cli /usr/local/bin/ && rm -rf /usr/share/grafana/bin/grafana-cli

COPY ./rootfs/entry.sh /entry.sh
COPY ./rootfs/conf /usr/share/grafana/conf
COPY ./rootfs/dashboards /usr/share/grafana/dashboards
COPY ./rootfs/img/fav32.png /usr/share/grafana/public/img/fav32.png
COPY ./rootfs/img/hyn_logo.svg /usr/share/grafana/public/img/grafana_icon.svg
COPY ./rootfs/img/map3_typelogo.svg /usr/share/grafana/public/img/grafana_typelogo.svg

VOLUME /var/lib/grafana

ENV GF_PATHS_PROVISIONING="/usr/share/grafana/conf/provisioning" \
    GF_INSTALL_PLUGINS="grafana-clock-panel,grafana-worldmap-panel"

COPY ./src/run.sh /run.sh

EXPOSE 8300

USER grafana
WORKDIR /
ENTRYPOINT [ "/run.sh" ]