set -vxe

#php set up
mkdir /run/php
mv www.conf /etc/php/7.3/fpm/pool.d/www.conf

#wordpress set up
mkdir -p /var/www/html
curl -O https://wordpress.org/latest.tar.gz
tar -xzvf latest.tar.gz -C /var/www/html/
chmod 777 /var/www/html/wordpress
envsubst < wp-config.php > /var/www/html/wordpress/wp-config.php
chmod 777 /var/www/html/wordpress/wp-config.php
#execution
/usr/sbin/php-fpm7.3 -F