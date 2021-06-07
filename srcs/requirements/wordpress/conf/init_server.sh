#phpmyadmin
wget https://files.phpmyadmin.net/phpMyAdmin/4.9.7/phpMyAdmin-4.9.7-all-languages.tar.gz
tar xvf phpMyAdmin-4.9.7-all-languages.tar.gz
mv phpMyAdmin-4.9.7-all-languages /var/www/html/phpmyadmin

#wordpress
wget https://wordpress.org/latest.tar.gz
tar -xzvf latest.tar.gz
chmod 765 wordpress
mv wordpress /var/www/html
mv wordpress_config.php /var/www/html/wordpress/wp-config.php