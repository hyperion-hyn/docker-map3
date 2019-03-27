FROM influxdb:1.7-alpine

COPY ./rootfs/config/influxdb.conf /etc/influxdb/influxdb.conf

EXPOSE 8086

VOLUME /var/lib/influxdb

ENTRYPOINT ["/entrypoint.sh"]
CMD ["influxd"]
