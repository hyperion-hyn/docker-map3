FROM nginx:1.15.8-alpine

COPY ./rootfs/config/nginx.conf /etc/nginx/nginx.conf
COPY ./rootfs/config/titan.conf /etc/nginx/conf.d/default.conf
COPY ./rootfs/launch.sh /launch.sh
COPY ./rootfs/public/ /usr/share/nginx/html/
COPY ./rootfs/public/node-info.json /usr/share/nginx/html/node-info.json

EXPOSE 80

STOPSIGNAL SIGTERM

CMD ["nginx", "-g", "daemon off;"]