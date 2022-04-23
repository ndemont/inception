# inception

This project consists in having to set up a small infrastructure composed of different
services under specific rules. The whole project has to be done in a virtual machine using docker-compose.

Each Docker image must have the same name as its corresponding service.
The Docker images of the project have to be build, it is then forbidden to pull ready-made Docker images, as well as using services such as DockerHub
(Alpine/Debian being excluded from this rule).

Set up:
- A Docker container that contains NGINX with TLSv1.2 or TLSv1.3 only.
- A Docker container that contains WordPress + php-fpm (it must be installed and
configured) only without nginx.
- A Docker container that contains MariaDB only without nginx.
- A volume that contains your WordPress database.
- A second volume that contains your WordPress website files.
- A docker-network that establishes the connection between your containers.

The containers have to restart in case of a crash.
