FROM debian:buster
EXPOSE 3306

RUN apt-get update -yq
RUN apt-get upgrade -yq
RUN apt-get install mariadb-server -yq
RUN apt-get install mariadb-client -yq
RUN apt-get install procps -yq

COPY ./tools/init_server.sh .
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

RUN mkdir /run/mysqld
RUN chown mysql /run/mysqld

RUN chmod +x ./init_server.sh
RUN chmod +x /etc/mysql/mariadb.conf.d/50-server.cnf
RUN mysql_install_db --user=mysql --data=/var/lib/mysql --auth-root-authentication-method=normal

CMD ["bash", "init_server.sh"]