#!/bin/bash

# Create nescessary directory
if [ ! -d /etc/ssl ]; then
	mkdir /etc/ssl;
fi

if [ ! -d /etc/ssl/certs ]; then
	mkdir /etc/ssl/certs;
fi

# Create certificates for ssl

if [ ! -f /etc/ssl/certs/nginx.crt ]; then
	openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
	-out /etc/ssl/certs/efournou.crt \
	-keyout /etc/ssl/certs/efournou.key \
	-subj "/C=ES/ST=Malaga/L=Malaga/O=42/OU=efournou/CN=efournou/";
fi

