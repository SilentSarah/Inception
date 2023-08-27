#!bin/bash

# Setting up WP-CLI
mkdir /WP-CLI-TEMP
cd /WP-CLI-TEMP
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp
rm -rf /WP-CLI-TEMP

# Downloading Wordpress
rm -rf /var/www/html
mkdir -p /var/www/html
sed -i 's/listen = \/run\/php\/php8.2-fpm.sock/listen = 0.0.0.0:9000/g' /etc/php/8.2/fpm/pool.d/www.conf