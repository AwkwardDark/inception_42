FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y curl php php7.4-fpm php-mysql wget

COPY ./conf/wp_conf.sh ./

RUN  chmod 755 wp_conf.sh

ENTRYPOINT ["./wp_conf.sh"]