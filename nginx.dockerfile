FROM nginx:1.10

ADD ./conf/nginx/vhost.conf /etc/nginx/conf.d/default.conf
WORKDIR /var/www