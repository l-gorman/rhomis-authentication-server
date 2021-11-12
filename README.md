# RHoMIS 2.0 Authentication Server

An easy to set-up server to handle the authentication for 
RHoMIS

Has only been tested on Ubuntu 20.04.

# Setup

* Install docker and docker compose.
* Enter the command `cp .env.template .env` to create your .env file. Replace the default values with the values  relevant to your server.
* Add your credentials to the configuration files by entering the command `source configure.sh`
* Create self-signed certificates to allow the nginx container to start with the `source init-letsencrypt.sh` 
* Install the software you need by entering the following command `source install.sh`
* Finally build the server with the command `docker-compose build` and start it with the command `docker-compose-up`