#mysql
service mysql start
echo "CREATE DATABASE wordpress DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;" | mysql -u root
echo "GRANT ALL ON wordpress.* TO 'wordpressuser'@'localhost' IDENTIFIED BY 'password';" | mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root

#php
mkdir /run/php
mv php-fpm.conf /etc/php/7.3/fpm

#phpmyadmin
tar xvf phpMyAdmin-4.9.7-all-languages.tar.gz
mkdir -p /var/www/html

#wordpress
mv wordpress /var/www/html
mv wordpress_config.php /var/www/html/wordpress/wp-config.php

wget https://wordpress.org/latest.tar.gz
tar -xzvf latest.tar.gz -C /var/www/html/

#sll
cd /etc/ssl
openssl req -x509 -out server.crt -keyout server.key \
  -newkey rsa:2048 -nodes -sha256 \
  -subj '/CN=localhost' -extensions EXT -config <( \
  printf "[dn]\nCN=localhost\n[req]\ndistinguished_name = dn\n[EXT]\nsubjectAltName=DNS:localhost\nkeyUsage=digitalSignature\nextendedKeyUsage=serverAuth")
cd /

/usr/sbin/php-fpm7.3
