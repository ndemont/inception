FROM debian:buster

RUN apt-get update -yq
RUN apt-get upgrade -yq
RUN apt-get install wget -yq
RUN apt-get install vim -yq
RUN apt-get install mariadb-server mariadb-client -yq
RUN apt-get install gettext-base -yq
ENV AUTO_INDEX=on