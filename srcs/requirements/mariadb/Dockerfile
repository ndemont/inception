FROM debian:buster

RUN apt-get update -yq
RUN apt-get upgrade -yq
RUN apt-get install vim -yq
RUN apt-get install mariadb-server -yq
RUN apt-get install mariadb-client -yq
RUN apt-get install procps -yq

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./tools/init_server.sh .

RUN chmod +x ./init_server.sh
RUN chmod 0444 /etc/mysql/mariadb.conf.d/50-server.cnf

EXPOSE 3306

CMD [ "./init_server.sh" ]
