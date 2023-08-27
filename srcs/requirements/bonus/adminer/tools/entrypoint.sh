#!bin/bash

sed -i 's/listen = \/run\/php\/php8.2-fpm.sock/listen = 0.0.0.0:9000/g' /etc/php/8.2/fpm/pool.d/www.conf
mkdir -p /var/www/html/adminer
wget https://www.adminer.org/latest.php -O /var/www/html/adminer/index.php

exec $@