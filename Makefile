NAME = inception
SRCS = srcs 
DB = mariadb
WP = wordpress
NGINX = nginx

all:	${NAME}


${NAME}:
	#mkdir ${HOME}/data
	#cp -R ./srcs/requirements/wordpress/conf/ ${HOME}/data/worpress/
	sudo docker-compose -f srcs/docker-compose.yml build
	sudo docker-compose -f srcs/docker-compose.yml up -d --remove-orphans
stop:
	sudo docker-compose -f srcs/docker-compose.yml stop
rm: stop
	sudo docker-compose -f srcs/docker-compose.yml rm

.PHONY:			all clean fclean re bonus
