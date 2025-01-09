# penultimate stable version image
FROM debian:bullseye 

# updating all packages
RUN apt-get update -y && apt-get upgrade -y

# installing latest nginx, vim and curl stable version. -y answers yes to installation process
RUN apt-get install nginx -y
RUN apt-get install vim -y
RUN apt-get install curl -y

# creating a directory to stock the key and certificate for the SSL/TSL protocol (TLSv1.3)
RUN mkdir -p /etc/nginx/ssl

# OpenSSL allows to create and configure SSL certificates
RUN apt-get install openssl -y

# command to generate a SSL certificate: req sets the format to PKCS#10; -x509 is the type of certificate; -nodes tells not to create a password for the private key
# -out and -keyout telles the directory to store the certificate files
# -subj writes all info required for the certificate to be completed (It's mandatory??)
RUN openssl req -newkey rsa:4096 -x509 -nodes \
	-out /etc/nginx/ssl/inception.crt \
	-keyout /etc/nginx/ssl/inception.key \
	-subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=pajimene.42.fr/UID=pajimene"

# this directory will contain all nginx configuration files. (Useless?)
RUN mkdir -p /var/run/nginx

# we change the original nginx configuration file by ours (conf/nginx.conf)
COPY conf/nginx.conf /etc/nginx/sites-available/default

# we make sure that the main root has good permissions, and also the user
RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

# We open this port so the container can comunicate with internet
EXPOSE 443

# running NGINX when the container is lauched
ENTRYPOINT ["nginx", "-g", "daemon off;"]