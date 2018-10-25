FROM php:7-fpm

RUN apt-get update && apt-get install -y libmcrypt-dev mysql-client netcat \
    && pecl install mcrypt-1.0.1 && docker-php-ext-enable mcrypt && docker-php-ext-install pdo_mysql

COPY ./conf/php/init.sh /home/init.sh

RUN sed -i -e 's/\r$//' /home/init.sh

CMD ["/home/init.sh"]

WORKDIR /var/www
