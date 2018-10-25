FROM nginx:1.10

COPY ./conf/nginx/nginx.conf /etc/nginx/
ADD ./conf/nginx/vhost.conf /etc/nginx/conf.d/default.conf

WORKDIR /var/www