#!/bin/bash

service mariadb stop
rm -rf /var/lib/mysql
mkdir -p /var/lib/mysql
chown -R mysql /var/lib/mysql
mariadb-install-db --user=mysql --datadir="/var/lib/mysql" --auth-root-authentication-method=normal \
		--skip-test-db \
		--old-mode='UTF8_IS_UTF8MB3' \
		--default-time-zone=SYSTEM --enforce-storage-engine= \
		--skip-log-bin \
		--expire-logs-days=0 \
		--loose-innodb_buffer_pool_load_at_startup=0 \
		--loose-innodb_buffer_pool_dump_at_shutdown=0
service mariadb start
sed -i 's/${WP_USER}/'"$WP_USER"'/g' setup.sql
sed -i 's/${WP_PASS}/'"$WP_PASS"'/g' setup.sql
mysql < setup.sql