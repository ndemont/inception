printf "ok"

#sll
cd /etc/ssl
openssl req -x509 -out server.crt -keyout server.key \
  -newkey rsa:2048 -nodes -sha256 \
  -subj '/CN=localhost' -extensions EXT -config <( \
  printf "[dn]\nCN=localhost\n[req]\ndistinguished_name = dn\n[EXT]\nsubjectAltName=DNS:localhost\nkeyUsage=digitalSignature\nextendedKeyUsage=serverAuth")
cd /

#nginx
service nginx start
# service php7.3-fpm start
# rm /var/www/html/index.nginx-debian.html

bash