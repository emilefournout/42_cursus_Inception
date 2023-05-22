#!/bin/sh
# Setup directory
if [ ! -d /var/www ]; then
	mkdir /var/www
fi

if [ ! -d /var/www/wordpress_data ]; then
	mkdir /var/www/wordpress_data
fi
if [ ! -d /run ]; then
	mkdir /run
fi
if [ ! -d /run/php ]; then
	mkdir /run/php
fi
if [ ! -f /run/php/php7.3-fpm.pid ]; then
	touch /run/php/php7.3-fpm.pid
fi
if [ ! -f /var/www/wordpress_data/wp-config.php ]; then
/opt/wordpress_utils/wordpress_install.sh
fi
# Set permissions
chown -R www-data /var/www/wordpress_data
chmod -R 775 /var/www/wordpress_data

# Run php-fpm
exec "$@"
