#wordpress
wget https://wordpress.org/latest.tar.gz
tar -xzvf latest.tar.gz
chmod 765 wordpress
mv wordpress /var/www/html
mv wordpress_config.php /var/www/html/wordpress/wp-config.php