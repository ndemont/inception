FROM debian:buster

RUN apt-get update -yq
RUN apt-get upgrade -yq
RUN apt-get install wget -yq
RUN apt-get install vim -yq
RUN apt-get install php7.3 php7.3-fpm php7.3-mysql php-common php7.3-cli php7.3-common php7.3-json php7.3-opcache php7.3-readline -yq
RUN apt-get install php-curl php-gd php-intl php-mbstring php-soap php-xml php-xmlrpc php-zip -yq
RUN apt-get install openssl
RUN apt-get install gettext-base -yq

COPY ./srcs/init_server.sh .
COPY ./srcs/wordpress_config.php .
COPY ./srcs/phpmyadmin.conf .

CMD bash init_server.sh