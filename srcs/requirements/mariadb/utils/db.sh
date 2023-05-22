#!/bin/sh
# Put a name on variable from argv
ROOT_USER=$1
ROOT_PASSWORD=$2
USER=$3
PASSWORD=$4
DB=$5

# Give max permission to root
# Create wordpress database
# Create wordpress user
# Give permission to user for docker-compose network

echo "GRANT ALL ON *.* TO '$ROOT_USER'@'%' IDENTIFIED BY '$ROOT_PASSWORD';
FLUSH PRIVILEGES;
CREATE DATABASE IF NOT EXISTS $DB;
CREATE USER '$USER'@'wordpress.inception_my_network' IDENTIFIED BY '$PASSWORD';
GRANT ALL ON *.* TO '$USER'@'wordpress.inception_my_network';
FLUSH PRIVILEGES;"
