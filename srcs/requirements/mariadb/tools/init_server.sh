#!/bin/bash

set -xve

service mysql start

# chmod 777 /var/run/mysqld/mysqld.sock

# mysqld_safe &

# sleep 5

# pwd
# mysql < mariadb.sql

echo "CREATE DATABASE IF NOT EXISTS wp;" | mysql
echo "CREATE USER IF NOT EXISTS 'user'@'%' IDENTIFIED BY 'pwd';" | mysql
echo "GRANT ALL ON wp.* TO 'user'@'%';" | mysql
echo "FLUSH PRIVILEGES;" | mysql
echo "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('$MYSQL_ROOT_PASSWORD');" | mysql

# service mysql status

# service mysqld stop
# /etc/init.d/mysqld stop
# mysqladmin -u root -p shutdown

# chmod 777 /var/run/mysqld/mysqld.sock
# ls -l /var/run/mysqld/

# service mysql status
service mysql stop 

exec mysqld -u mysql
