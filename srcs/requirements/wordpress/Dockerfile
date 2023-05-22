FROM debian:buster

# Update package lists and upgrade existing packages
RUN apt-get update && apt-get upgrade -y 

# Install necessary packages
RUN apt install -y curl git unzip php7.3 php-cli php-fpm php-mysql php-mysqli php-curl php-gd php-mbstring php-xml php-xmlrpc

# Copy files to the container
COPY ./config/www.conf /etc/php/7.3/fpm/pool.d/www.conf
RUN mkdir /opt/wordpress_utils
COPY ./utils/wordpress_setup.sh /opt/wordpress_utils/wordpress_setup.sh
COPY ./utils/wordpress_install.sh /opt/wordpress_utils/wordpress_install.sh

RUN chmod +x /opt/wordpress_utils/wordpress_setup.sh
RUN chmod +x /opt/wordpress_utils/wordpress_install.sh


EXPOSE 9000
# Run the script wordpress_setup 
ENTRYPOINT ["/opt/wordpress_utils/wordpress_setup.sh"]
CMD ["/usr/sbin/php-fpm7.3", "-F"]
