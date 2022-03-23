FROM debian:buster

RUN apt-get update -yq
RUN apt-get upgrade -yq
RUN apt-get install wget curl vim nginx -yq
RUN apt-get install gettext-base -yq

COPY ./conf/nginx_config .
COPY ./conf/init_server.sh .

EXPOSE 80
EXPOSE 443

RUN ln -sf /dev/stdout /var/log/nginx/access.log
RUN ln -sf /dev/stderr /var/log/nginx/error.log

CMD bash init_server.sh
