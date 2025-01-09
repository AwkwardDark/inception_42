# penultimate stable version image
FROM debian:bullseye 

# updating all packages
RUN apt-get update -y && apt-get upgrade -y

# installing latest maraiadb stable version. -y answers yes to installation process
RUN apt-get install mariadb-server -y

# giving our configuration ile to replace the default mariadb conf file
COPY ./conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf

COPY ./tools/create_db.sh /mariadb-config.sh

RUN chmod 755 /mariadb-config.sh

EXPOSE 3306

ENTRYPOINT ["/mariadb-config.sh"]