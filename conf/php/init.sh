#!/bin/sh
if [ ! -e "/var/www/composer.lock" ]
then
    cd /var/www/ && composer update
fi
while ! nc -z $DB_HOST $DB_PORT;
do
  echo 'Waiting for database to be ready';
  sleep 1;
done;
cd /var/www/ && chmod -R 777 storage
cd /var/www/ && php artisan migrate:fresh && php artisan migrate --force
php-fpm
