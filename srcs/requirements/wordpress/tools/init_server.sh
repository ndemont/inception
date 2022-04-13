#!/bin/bash

set -xve

rm /var/www/html/wordpress/wp-config.php
wp config create --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=$DB_HOST --path="$WP_PATH" --allow-root --skip-check
wp core install --url="$DOMAIN_NAME" --title="$TITLE" --admin_user="$ADMIN_USER" --admin_password="$ADMIN_PASSWORD" --admin_email="$ADMIN_EMAIL" --path="$WP_PATH" --allow-root

/usr/sbin/php-fpm7.3 -F