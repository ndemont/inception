FROM debian:buster

EXPOSE 9000

RUN apt-get update -yq
RUN apt-get upgrade -yq
RUN apt-get install curl -yq
RUN apt-get install vim -yq
RUN apt-get install php7.3 php7.3-fpm php7.3-mysql php-common php7.3-cli php7.3-common php7.3-json php7.3-opcache php7.3-readline -yq
RUN apt-get install php-curl php-gd php-intl php-mbstring php-soap php-xml php-xmlrpc php-zip -yq
RUN apt-get install openssl
RUN apt-get install gettext-base -yq

COPY ./tools/init_server.sh .
COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

# WORDPRESS CONFIGURATION
RUN mkdir /run/php
RUN mkdir -p /var/www/html
RUN curl -O https://wordpress.org/latest.tar.gz
RUN tar -xzvf latest.tar.gz -C /var/www/html/
RUN chmod 777 /var/www/html/wordpress

# WORDPRESS INSTALLATION
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
RUN wp core download --allow-root

CMD bash init_server.sh
