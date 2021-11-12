NAME = inception
SRCS = srcs 
DB = mariadb
WP = wordpress
NGX	= nginx

all:	${NAME}


${NAME}:
	docker-compose -f srcs/docker-compose.yml up -d
stop:
	docker-compose -f srcs/docker-compose.yml stop
rm: stop
	docker-compose -f srcs/docker-compose.yml rm

.PHONY:			all clean fclean re bonus