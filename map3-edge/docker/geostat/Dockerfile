FROM golang:1.12-alpine3.9 as builder

# install software packages 
RUN apk add --update --no-cache git build-base

# copy code
COPY ./src $GOPATH/src/github.com/hyperion-hyn/geostat

# build the dmapper server and crontab
WORKDIR $GOPATH/src/github.com/hyperion-hyn/geostat
RUN GO111MODULE=on go mod vendor && go build -a -ldflags="-w -s" && go install

###
FROM alpine:3.9

# install software packages
RUN apk add --update --no-cache ca-certificates curl

# copy files from builder
COPY --from=builder /go/bin/geostat /usr/bin/geostat

# copy config file
COPY ./src/geostat.json ./src/GeoIP2-City.mmdb /etc/geostat/
COPY ./rootfs/entrypoint.sh ./rootfs/optimize-influxdb.sh ./rootfs/geostat.sh /

ENTRYPOINT ["/entrypoint.sh"]

CMD ["/geostat.sh", "--config", "/etc/geostat/geostat.json", "--logfile", "/var/log/geostat/access.log", "--geodb", "/etc/geostat/GeoIP2-City.mmdb"]
