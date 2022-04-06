FROM debian:buster
EXPOSE 3306

RUN apt-get update -yq
RUN apt-get upgrade -yq
RUN apt-get install mariadb-server -yq
RUN apt-get install mariadb-client -yq
RUN apt-get install procps -yq

RUN mkdir /run/mysqld
RUN chown mysql /run/mysqld
RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql --auth-root-authentication-method=normal

COPY ./tools/init_server.sh .
COPY ./tools/mariadb.sql .
COPY ./conf/my.cnf /etc/mysql/my.cnf
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

RUN chmod 777 /var/lib/mysql
RUN chmod 777 ./init_server.sh
RUN chmod 777 ./mariadb.sql
RUN chmod +x /etc/mysql/mariadb.conf.d/50-server.cnf

# RUN mysqld -umysql &\
#     sleep 5 && \
#     echo "CREATE DATABASE IF NOT EXISTS wp;" | mysql && \
#     echo "CREATE USER IF NOT EXISTS 'wpuser'@'%' IDENTIFIED BY 'wppwd';" | mysql && \
#     echo "GRANT ALL ON wp.* TO 'wpuser'@'%';" | mysql && \
#     echo "FLUSH PRIVILEGES;" | mysql && \
#     echo "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('rootpwd');" | mysql

CMD ["./init_server.sh"]
# CMD ["mysqld", "--user=mysql"]