#!bin/bash

chown ${FTP_USER}:${FTP_USER} /var/www/html
echo "${FTP_USER}:${FTP_PASS}" | chpasswd
exec $@