NAME = inception
SRCS = srcs 
DB = mariadb
WP = wordpress
NGX	= nginx

all:	init ${NAME}

init:
	# mdkir -p /home/ login
	docker volume create db_data
	# mv /var/lib/docker/volumes/db_data/_data /home/login/data/db_data
	docker volume create wp_data
	# mv /var/lib/docker/volumes/wp_data/_data /home/login/data/wp_data

${NAME}:
	cd srcs
	docker-compose up

docker build . -t mariadb
docker build . -t wordpress
docker run -d --name db mariadb
docker run -d --name wp wordpress
docker container rm -f wordpress
docker run -d -P --name wp --link db:db mariadb

