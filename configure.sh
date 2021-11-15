#!/bin/bash

# Make empty directories
# mkdir -p ./files/certbot/www
# mkdir -p ./files/certbot/conf
 mkdir -p ./files/nginx

#mkdir -p data/nginx


# Load environment variables
source .env

# Replace the example domain with the real domain
# in the nginx configuration file


# while read line ; do 
#     echo ${line//example.org/$AUTHURL}; 
#     done < ./files/nginxTemplate/conftemplate.d > ./files/nginx/conf.d
IFS=''

while read line ; do 
    
    echo "${line//example.org/$AUTHURL}"; 
    done < ./templates/conf.d.template > ./data/nginx/app.conf

while read -r line; do 

    line="${line//user@email.com/$ADMINEMAIL}"

    echo "${line//example.org/$AUTHURL}"; 
    done < ./templates/docker-compose-template.yml > ./docker-compose.yml


while read line ; do 
    line="${line//user@email.com/$ADMINEMAIL}"
    echo "${line//example.org/$AUTHURL}"; 
    done < ./templates/init-letsencrypt-template.sh > ./init-letsencrypt.sh


chmod +x init-letsencrypt.sh

