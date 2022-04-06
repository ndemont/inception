NAME = inception
SRCS = srcs 
DB = mariadb
WP = wordpress
NGINX = nginx

all:	${NAME}


${NAME}:
	sudo rm -rf /home/ndemont/data/db-data
	sudo mkdir /home/ndemont/data/db-data
	sudo docker-compose -f srcs/docker-compose.yml build
	sudo docker-compose -f srcs/docker-compose.yml up -d --remove-orphans
stop:
	sudo docker-compose -f srcs/docker-compose.yml stop
rm: stop
	sudo docker-compose -f srcs/docker-compose.yml rm

.PHONY:			all clean fclean re bonus