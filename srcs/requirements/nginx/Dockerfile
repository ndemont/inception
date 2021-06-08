FROM debian:buster

RUN apt-get update -yq
RUN apt-get upgrade -yq
RUN apt-get install wget -yq
RUN apt-get install vim -yq
RUN apt-get install nginx -yq
RUN apt-get install gettext-base -yq
ENV AUTO_INDEX=on

COPY ./conf/nginx_config .
COPY ./conf/init_server.sh .

CMD bash init_server.sh