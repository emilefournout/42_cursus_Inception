FROM debian:buster

# Update package list and upgrade existing packages
RUN apt-get update && apt-get upgrade -y

# Install nescessary packages
RUN apt-get install -y mariadb-server mariadb-client vim

EXPOSE 3306

# Copy files 
COPY ./config/50-server.conf /etc/mysql/mariadb.conf.d/50-server.conf
COPY ./utils/setup.sh /tmp/setup.sh
COPY ./utils/db.sh /tmp/db.sh
COPY ./utils/mysql_secure_installation.sh /tmp/mysql_secure_installation.sh

# Set permissions
RUN chmod +x /tmp/db.sh
RUN chmod +x /tmp/setup.sh
RUN chmod +x /tmp/mysql_secure_installation.sh

# Get args
ARG ROOT_USER
ARG ROOT_PASSWORD
ARG USER
ARG PASSWORD
ARG DB

# Run script with args that setup mysql et create database
RUN /tmp/setup.sh $ROOT_USER $ROOT_PASSWORD $USER $PASSWORD $DB

# Run mysqld
CMD ["/usr/sbin/mysqld", "--defaults-file=/etc/mysql/mariadb.conf.d/50-server.conf", "--verbose"]

