FROM nginx:1.15.8-alpine

COPY ./rootfs/config/nginx.conf /etc/nginx/nginx.conf
COPY ./rootfs/config/cache.conf /etc/nginx/conf.d/default.conf
COPY ./rootfs/public/favicon.ico /usr/share/nginx/html/favicon.ico

EXPOSE 80

STOPSIGNAL SIGTERM

CMD ["nginx", "-g", "daemon off;"]