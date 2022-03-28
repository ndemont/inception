#php
mkdir /run/php
echo "listen = 9000" >> /etc/php/7.3/fpm/pool.d/www.conf
#wordpress
mkdir -p /var/www/html
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

/usr/sbin/php-fpm7.3 -F

