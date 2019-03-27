FROM nginx:1.15.8-alpine

COPY ./rootfs/config/nginx.conf /etc/nginx/nginx.conf
COPY ./rootfs/config/proxy.conf /etc/nginx/conf.d/default.conf:ro
COPY ./rootfs/public/favicon.ico /usr/share/nginx/html/favicon.ico

EXPOSE 80
EXPOSE 443

STOPSIGNAL SIGTERM

CMD ["nginx", "-g", "daemon off;"]