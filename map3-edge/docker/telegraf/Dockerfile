FROM map3/telegraf-custom-plugin-alpine:1.11

RUN apk add --no-cache curl

COPY ./rootfs/config/telegraf.conf /etc/telegraf/telegraf.conf
COPY ./rootfs/optimize-influxdb.sh /optimize-influxdb.sh
COPY ./rootfs/telegraf.sh /telegraf.sh

EXPOSE 8125/udp 8092/udp 8094

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/telegraf.sh"]
