FROM debian:bullseye

RUN  apt-get update -y && apt-get upgrade -y

RUN apt-get install -y php php7.4 curl php-fpm php-mysql mariadb-client php7.4-redis

COPY ./conf/wp_conf.sh ./

RUN chmod 755 wp_conf.sh

ENTRYPOINT ["./wp_conf.sh"]