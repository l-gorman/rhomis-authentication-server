#!/bin/bash

# Make empty directories
mkdir -p ./files/certbot/www
mkdir -p ./files/certbot/conf

# Load environment variables
source .env

# Replace the example domain with the real domain
# in the nginx configuration file

echo "" >> ./files/nginx/conftemplate.d


while read line ; do 
    echo ${line//example.org/$AUTHURL}; 
    done < ./files/nginxTemplate/conftemplate.d > ./files/nginx/conf.d

chmod +x init-letsencrypt.sh

