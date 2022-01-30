#!/bin/sh

cd /var/www/html
php artisan key:generate
php artisan cms:initialize --seed
chown -R www-data:www-data /var/www/html/storage
php-fpm
