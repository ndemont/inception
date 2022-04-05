#!/bin/bash

set -xve

whoami

mysql_install_db --user=mysql --data=/var/lib/mysql --auth-root-authentication-method=normal

whoami

service mysql start

whoami

echo "CREATE DATABASE IF NOT EXISTS wp;" | mysql -u root
echo "CREATE USER IF NOT EXISTS 'user'@'%' IDENTIFIED BY 'pwd';" | mysql -u root
echo "GRANT ALL ON wp.* TO 'user'@'%';" | mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root

# mv /tmp/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

service mysql status
/etc/init.d/mysql stop

mysqld --user=mysql