CREATE DATABASE IF NOT EXISTS wp;
CREATE USER IF NOT EXISTS 'user'@'%' IDENTIFIED BY 'pwd';
GRANT ALL ON wp.* TO 'user'@'%';
FLUSH PRIVILEGES;