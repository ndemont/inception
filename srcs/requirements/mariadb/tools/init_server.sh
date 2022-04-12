#!/bin/bash

set -xve

service mysql start

echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;" | mysql
echo "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" | mysql
echo "GRANT ALL ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%';" | mysql
echo "FLUSH PRIVILEGES;" | mysql
echo "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('$MYSQL_ROOT_PASSWORD');" | mysql

service mysql stop 

exec mysqld -u mysql
