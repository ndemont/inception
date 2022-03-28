#!/bin/bash

service mysql start

echo "CREATE DATABASE wordpress DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;" | mysql
echo "GRANT ALL ON wordpress.* TO 'wordpressuser'@'localhost' IDENTIFIED BY 'password';" | mysql
echo "FLUSH PRIVILEGES;" | mysql
echo "USE wordpress;" | mysql

service mysql stop

exec mysqld --user=root
