#!/bin/bash

# Make empty directories
mkdir -p ./files/certbot/www
mkdir -p ./files/certbot/conf

# Load environment variables
source .env

# Replace the example domain with the real domain
# in the nginx configuration file
while read a; do
    echo ${a//example.org/$AUTHURL}
done < ./init-letsencrypt-template.sh > ./init-letsencrypt.sh

while read a; do
    echo ${a//example.org/$AUTHURL}
done < ./files/nginx/conftemplate.d > ./files/nginx/conf.d

