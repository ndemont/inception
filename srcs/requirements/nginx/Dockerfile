FROM debian:buster

RUN apt-get update -yq
RUN apt-get upgrade -yq
RUN apt-get install wget -yq
RUN apt-get install vim -yq
RUN apt-get install nginx -yq

COPY ./conf/nginx_config .

CMD bash init_server.sh