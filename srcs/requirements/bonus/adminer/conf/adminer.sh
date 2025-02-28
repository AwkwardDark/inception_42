#!/bin/bash

# Download Adminer
wget https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php -O /var/www/adminer/index.php

# Change ownership to www-data
chown -R www-data:www-data /var/www/adminer

# Move to the Adminer directory
cd /var/www/adminer

# Start PHP's built-in web server
php -S 0.0.0.0:4000