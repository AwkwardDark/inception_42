#!/bin/bash

#wp-cli installation
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

# give exec permission
chmod +x wp-cli.phar

# move to bin
mv wp-cli.phar /usr/local/bin/wp

# creating directory for the wordpress site
# mkdir -p /var/www/wordpress

chmod -R 755 /var/www/wordpress/


cd /var/www/wordpress

# download wordpress core files
wp core download --allow-root
# create wp-config.php file with database details getting the database_password from the secret folder
MYSQL_PASSWORD=$(cat /run/secrets/db_password); wp core config --dbhost=mariadb:3306 --dbname="$MYSQL_DB" --dbuser="$MYSQL_USER" --dbpass="$MYSQL_PASSWORD" --allow-root
# install wordpress with the given title, admin username, password and email
WP_ADMIN_P=$(cat /run/secrets/wp_admin_password); wp core install --url="$DOMAIN_NAME" --title="$WP_TITLE" --admin_user="$WP_ADMIN_N" --admin_password="$WP_ADMIN_P" --admin_email="$WP_ADMIN_E" --allow-root
#create a new user with the given username, email, password and role
WP_U_PASS=$(cat /run/secrets/wp_user_password); wp user create "$WP_U_NAME" "$WP_U_EMAIL" --user_pass="$WP_U_PASS" --role="$WP_U_ROLE" --allow-root

# defines WP_REDIS_HOST to redis which is the address of the container
wp config set WP_REDIS_HOST 'redis' --add --allow-root


# install redis plugini and activate it
wp plugin install redis-cache --activate --allow-root --path='/var/www/wordpress'
# activate the plugin (it should be already activated)
wp plugin activate redis-cache --allow-root --path='/var/www/wordpress/'
# enable it 
wp redis enable --allow-root --path='/var/www/wordpress'


sed -i '36 s@/run/php/php7.4-fpm.sock@9000@' /etc/php/7.4/fpm/pool.d/www.conf
# create a directory for php-fpm
mkdir -p /run/php
# set the ownership to all the wordpress files to the wordpress user
chown -R www-data:www-data /var/www/wordpress
# start php-fpm service in the foreground to keep the container running
/usr/sbin/php-fpm7.4 -F