FROM debian:buster
EXPOSE 80
EXPOSE 443

RUN apt-get update -yq
RUN apt-get upgrade -yq
RUN apt-get install wget curl vim nginx -yq
RUN apt-get install gettext-base -yq

COPY ./conf/nginx.conf /etc/nginx/
COPY ./conf/default /etc/nginx/sites-enabled/
COPY ./tools/init_server.sh .

CMD bash init_server.sh
