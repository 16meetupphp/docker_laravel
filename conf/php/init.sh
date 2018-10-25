#!/bin/sh
while ! nc -z $DB_HOST $DB_PORT;
do
  echo 'Waiting for database to be ready';
  sleep 1;
done;
cd /var/www/ && php artisan migrate:fresh && php artisan migrate --force
php-fpm
