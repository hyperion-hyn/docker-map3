FROM grafana/grafana:5.4.3

COPY ./rootfs/entry.sh /entry.sh
COPY ./rootfs/conf /usr/share/grafana/conf
COPY ./rootfs/dashboards /var/lib/grafana/dashboards
COPY ./rootfs/img/fav32.png /usr/share/grafana/public/img/fav32.png
COPY ./rootfs/img/hyn_logo.svg /usr/share/grafana/public/img/grafana_icon.svg
COPY ./rootfs/img/map3_typelogo.svg /usr/share/grafana/public/img/grafana_typelogo.svg

ENV GF_PATHS_PROVISIONING="/usr/share/grafana/conf/provisioning" \
    GF_INSTALL_PLUGINS="grafana-clock-panel,grafana-worldmap-panel"

EXPOSE 3000

USER grafana
ENTRYPOINT [ "/run.sh" ]