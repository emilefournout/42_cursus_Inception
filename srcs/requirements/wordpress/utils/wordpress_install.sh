#!/bin/sh

# Download files
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp
cd /var/www/wordpress_data
wp core download --allow-root

# Configure wp-config
cp /var/www/wordpress_data/wp-config-sample.php /var/www/wordpress_data/wp-config.php
sed -i "s/password_here/$MYSQL_PASSWORD/g" /var/www/wordpress_data/wp-config.php
sed -i "s/localhost/mariadb.inception_my_network/g" /var/www/wordpress_data/wp-config.php
sed -i "s/username_here/$MYSQL_USER/g" /var/www/wordpress_data/wp-config.php
sed -i "s/database_name_here/$MYSQL_DB/g" /var/www/wordpress_data/wp-config.php

# Setup database
wp core install --allow-root --url=${DOMAIN_NAME} --title=${WP_NAME} \
        --admin_user=${WP_ROOT_USER} --admin_password=${WP_ROOT_PASSWORD} \
        --admin_email=${WP_ROOT_EMAIL}

wp user create ${MYSQL_USER} ${WP_USER_EMAIL} --user_pass=${MYSQL_PASSWORD} \
        --role=author --allow-root
