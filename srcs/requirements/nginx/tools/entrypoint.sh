#!bin/bash

chown -R www-data: /var/www
chmod -R 777 /var/www/*

exec $@