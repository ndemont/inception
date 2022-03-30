#!/bin/bash

service mysql start

echo "CREATE DATABASE $MYSQL_DATABASE DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;" | mysql
echo "GRANT ALL ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD' WITH GRANT OPTION;" | mysql
echo "FLUSH PRIVILEGES;" | mysql
echo "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('$MYSQL_ROOT_PASSWORD');" | mysql

service mysql stop

exec mysqld --user=root
