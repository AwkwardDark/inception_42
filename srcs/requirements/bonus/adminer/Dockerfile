FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y && apt-get install -y wget netcat php-cli php-mbstring php-mysqli php-curl php-xml php-zip

RUN mkdir -p /var/www/adminer

COPY ./conf/adminer.sh ./adminer.sh

RUN chmod 755 /adminer.sh

EXPOSE 4000

ENTRYPOINT ["./adminer.sh"]