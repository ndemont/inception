FROM debian:buster

ARG MYSQL_DATABASE
ARG MYSQL_USER
ARG MYSQL_PASSWORD
ARG MYSQL_ROOT_PASSWORD

RUN apt-get update -yq
RUN apt-get upgrade -yq
RUN apt-get install wget -yq
RUN apt-get install vim -yq
RUN apt-get install mariadb-server mariadb-client -yq
RUN apt-get install gettext-base -yq
RUN apt-get install procps -yq
RUN mkdir /run/mysqld
RUN chown mysql /run/mysqld
RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql --auth-root-authentication-method=normal

COPY ./conf/my.cnf /etc/mysql/
COPY ./conf/init_server.sh .

RUN chmod +x ./init_server.sh

EXPOSE 3306

CMD bash init_server.sh
