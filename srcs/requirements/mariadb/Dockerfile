FROM debian:buster

RUN apt-get update -yq
RUN apt-get upgrade -yq
RUN apt-get install wget -yq
RUN apt-get install vim -yq
RUN apt-get install mariadb-server mariadb-client -yq
RUN apt-get install gettext-base -yq

COPY ./conf/init_server.sh .

EXPOSE 3306

CMD bash init_server.sh