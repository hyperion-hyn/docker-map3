FROM blacklabelops/logrotate:latest

ENV LOGS_DIRECTORIES="/var/log/nginx/  /var/log/titan/ /var/log/reverse-proxy/" \
    LOGROTATE_INTERVAL="daily" \
    LOGROTATE_COPIES=7 \
    LOGROTATE_SIZE="500M"

ENTRYPOINT ["/sbin/tini","--","/usr/bin/logrotate.d/docker-entrypoint.sh"]
VOLUME ["/logrotate-status"]
CMD ["cron"]