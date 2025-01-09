# penultimate stable version image
FROM debian:bullseye 

# updating all packages
RUN apt-get update -y && apt-get upgrade -y

# installing that will allow to install wordpress later, -y answers yes to installation process
RUN apt-get install wget\
					php7.3\
					php-fpm\
					php-mysql\
					mariadb-client -y

# installing FR 6.7 version of wordpress on /var/www repertory
RUN wget https://fr.wordpress.org/wordpress-6.7-fr_FR.tar.gz -P /var/www

# unzipping file and deleting zipped file
RUN cd /var/www && tar -xzf wordpress-6.7-fr_FR.tar.gz && rm wordpress-6.7-fr_FR.tar.gz

# giving rights to root on wordpress folder
RUN	chown -R root:root /var/www/wordpress

# copying the php config file with our modifications
COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/

# crating folder to run php
RUN mkdir /run/php

# installing wp_cli command to configure wordpress
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
  && chmod +x wp-cli.phar \
  && mv wp-cli.phar /usr/local/bin/wp

# copying the wp script and giving execution rights
COPY ./tools/create_wp.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/create_wp.sh
ENTRYPOINT ["/usr/local/bin/create_wp.sh"]

EXPOSE 9000

# launching php-fpm in foreground and ignore deamon (-F)
CMD ["/usr/sbin/php-fpm7.3", "-F"]
