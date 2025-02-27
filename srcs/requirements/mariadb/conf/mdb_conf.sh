#!/bin/bash

service mariadb start
sleep 5 # wait for the mariadb to start

# create a database if it doesn't exists
mariadb -e "CREATE DATABASE IF NOT EXISTS ${MYSQL_DB};"

# Create user if doesn't exists 
MYSQL_PASSWORD=$(cat /run/secrets/db_password); mariadb -e "CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"

# Grant privileges to user
mariadb -e "GRANT ALL PRIVILEGES ON ${MYSQL_DB}.* TO \`${MYSQL_USER}\`@'%';"

mariadb -e "FLUSH PRIVILEGES;"

# restart mariadb
MYSQL_ROOT_PASSWORD=$(cat /run/secrets/db_root_password); mysqladmin -u root -p$MYSQL_ROOT_PASSWORD shutdown

mysqld_safe --port=3306 --bind-address=0.0.0.0 --datadir='/var/lib/mysql'