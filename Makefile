NAME = inception
SRCS = srcs 
DB = mariadb
WP = wordpress
NGINX = nginx
DOMAIN_NAME = ndemont.42.fr

all:	${NAME}

${NAME}: stop
	# sudo echo "127.0.0.1    	${DOMAIN_NAME}" >> /etc/hosts
	sudo rm -rf /home/ndemont/data/db-data
	sudo mkdir /home/ndemont/data/db-data
	sudo docker-compose -f srcs/docker-compose.yml build
	sudo docker-compose -f srcs/docker-compose.yml up -d --remove-orphans
stop:
	sudo docker-compose -f srcs/docker-compose.yml stop

rm: stop
	sudo docker-compose -f srcs/docker-compose.yml rm

clean: rm
	sudo docker rmi mariadb
	sudo docker rmi wordpress
	sudo docker rmi nginx

re: clean ${NAME}

.PHONY:			all clean fclean re bonus