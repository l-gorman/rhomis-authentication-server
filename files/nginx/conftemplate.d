server {
    listen 80;
    server_name example.org;
    location / {
        return 301 https://$host$request_uri;
    }    
}
server {
        listen 80;
	listen 443 ssl;
        server_name example.org;

        location / {
                proxy_pass http://localhost:3002;
                proxy_http_version 1.1;
                proxy_set_header Upgrade $http_upgrade;
                proxy_set_header Connection 'upgrade';
                proxy_set_header Host $host;
                proxy_cache_bypass $http_upgrade;
        }

	# ssl configuration
	#ssl_certificate /etc/letsencrypt/live/example.org/fullchain.pem;
	#ssl_certificate_key /etc/letsencrypt/live/example.org/privkey.pem;
}