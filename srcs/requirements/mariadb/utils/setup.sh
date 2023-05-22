#!/bin/sh

# Put a name on variable from argv
ROOT_USER=$1
ROOT_PASSWORD=$2
USER=$3
PASSWORD=$4
DB=$5

# Setup mariadb
mysql_install_db
/etc/init.d/mysql start
/tmp/mysql_secure_installation.sh $ROOT_PASSWORD 
/tmp/db.sh $ROOT_USER $ROOT_PASSWORD $USER $PASSWORD $DB | mysql -u root --verbose
sleep 3
/etc/init.d/mysql stop
# Sleep to make sure mysql is ended in background
sleep 3
