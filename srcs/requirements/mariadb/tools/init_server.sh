#!/bin/bash

set -xve

service mysql start

echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;" | mysql -u root --password=$MYSQL_ROOT_PASSWORD
echo "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD'" | mysql -u root --password=$MYSQL_ROOT_PASSWORD
echo "GRANT ALL ON $MYSQL_DATABASE .* TO '$MYSQL_USER'@'%'" | mysql -u root --password=$MYSQL_ROOT_PASSWORD
echo "FLUSH PRIVILEGES;" | mysql -u root --password=$MYSQL_ROOT_PASSWORD
echo "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('$MYSQL_ROOT_PASSWORD');" | mysql

service mysql stop

exec /usr/sbin/mysqld

bash