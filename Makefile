NAME = inception
SRCS = srcs 
DB = mariadb
WP = wordpress
NGX	= nginx

all:	${NAME}


${NAME}:
	docker-compose -f srcs/docker-compose.yml up -d

#docker run -d -P --name wp --link db:db mariadb

.PHONY:			all clean fclean re bonus