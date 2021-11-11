FROM debian:buster

RUN apt-get update -yq
RUN apt-get upgrade -yq
RUN apt-get install wget curl vim nginx -yq
RUN apt-get install gettext-base -yq
ENV AUTO_INDEX=on

COPY ./conf/nginx_config .
COPY ./conf/init_server.sh .

EXPOSE 80
EXPOSE 443

# forward request and error logs to docker log collector
# e.g. docker compose logs -f
RUN ln -sf /dev/stdout /var/log/nginx/access.log
RUN ln -sf /dev/stderr /var/log/nginx/error.log

CMD bash init_server.sh