FROM debian:buster

RUN apt-get update -yq
RUN apt-get upgrade -yq
RUN apt-get install vim -yq
RUN apt-get install mariadb-server mariadb-client -yq

COPY ./conf/my.cnf /etc/mysql/my.cnf
COPY ./conf/mysql.sl .
COPY ./tools/init_server.sh .

RUN chmod +x ./init_server.sh
RUN chmod 0444 /etc/mysql/my.cnf

#RUN service mysql start
#RUN mysql < mysql.sl

EXPOSE 3306

CMD ["./init_server.sh"]
