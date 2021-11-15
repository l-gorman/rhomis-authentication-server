#!/bin/bash

# Make empty directories
mkdir -p ./files/certbot/www
mkdir -p ./files/certbot/conf
mkdir -p ./files/nginx

# Load environment variables
source .env

# Replace the example domain with the real domain
# in the nginx configuration file


while read line ; do 
    echo ${line//example.org/$AUTHURL}; 
    done < ./files/nginxTemplate/conftemplate.d > ./files/nginx/conf.d


cp ./files/initialisationTemplate/init-letsencrypt-template.sh ./init-letsencrypt.sh
chmod +x init-letsencrypt.sh

