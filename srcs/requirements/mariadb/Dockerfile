FROM debian:bullseye

RUN apt-get update -y && apt upgrade -y

RUN apt-get install -y mariadb-server netcat

COPY ./conf/mdb_conf.sh ./

RUN chmod 755 /mdb_conf.sh

EXPOSE 3306

ENTRYPOINT ["./mdb_conf.sh"]