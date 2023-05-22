FROM debian:buster

# Update package lists and upgrade existing packages
RUN apt-get update && apt-get upgrade -y

# Install necessary packages
RUN apt-get install -y openssl nginx

# Copy files to the container
COPY ./config/default /etc/nginx/sites-enabled/default
RUN mkdir /opt/setup_ssl
COPY ./utils/setup_ssl.sh /opt/setup_ssl/setup_ssl.sh

# Run the script setup_ssl
RUN chmod +x /opt/setup_ssl/setup_ssl.sh
RUN /opt/setup_ssl/setup_ssl.sh

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
