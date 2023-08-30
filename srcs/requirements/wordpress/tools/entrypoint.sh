#!bin/bash

# Checking Wordpress installation
chmod -R 755 /var/www/html
echo Installing wordpress
cd /var/www/html
ls /var/www/html | grep wp-config.php
if [ $? -eq 0 ]
then
    echo "Found Wordpress, skipping"
else
    rm -rf *
    wp core download --allow-root
    wp config create --dbhost=${WP_HOST} --dbuser=${WP_USER} --dbpass=${WP_PASS} --dbname=${WP_DB} --allow-root --config-file=/var/www/html/wp-config.php 
    wp db create --allow-root
    wp core install --url=https://hmeftah.42.fr --title="Sarah WP" --admin_user=${WP_ADM} --admin_password=${WP_ADM_PASS} --admin_email="${WP_ADM}"@42.fr --allow-root
fi

# Checking DB Connection
echo "Checking Database connection"
wp db check --dbuser=${WP_USER} --dbpass=${WP_PASS} --path=/var/www/html --allow-root 
if [ $? -eq 0 ]
then
   
    # Checking if there's administrators
    wp user list --role=administrator --format=ids --path=/var/www/html --allow-root | grep 2
    if [ $? -eq 1 ]
    then
        # I NEED TO WORK ON THIS
        mysql -u ${WP_USER} -p${WP_PASS} -h ${WP_HOST} --database=${WP_DB} -e "TRUNCATE TABLE wp_users;"
        echo "Couldn't find Admins, creating them now."
        wp user create ${WP_ADM} ${WP_ADM}@42.fr --role=administrator --user_pass=${WP_ADM_PASS} --display_name=Sarah --path=/var/www/html --allow-root 
        wp user create ${WP_ADM_SEC} ${WP_ADM_SEC}@42.fr --role=administrator --user_pass=${WP_ADM_SEC_PASS} --display_name=Hicham --path=/var/www/html --allow-root 
    else
        echo "Found Admins, skipping..."
    fi

    # Setting up redis cache plugin (BONUS)
    wp config set WP_REDIS_PORT "6379" --allow-root
    wp config set WP_REDIS_HOST "redis" --allow-root
    wp plugin is-installed redis-cache --allow-root
    if [ $? -eq 1 ]
    then
        echo "redis-cache plugin is not installed, installing..."
        wp plugin install redis-cache --force --activate --allow-root
        echo "Redis-cache has been installed successfully"
    else
        echo "redis-cache is already installed"
    fi
    #sed -i 's/127.0.0.1/redis/g' /var/www/html/wp-content/object-cache.php
else
    echo "Database Connection failed."
fi
exec $@
