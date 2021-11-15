server {
    listen 80;
    listen [::]:80;

    root /var/www/html;
    index index.html index.htm index.nginx-debian.html;

    server_name example.org;

    location ^~ /.well-known/acme-challenge/ {
        allow all
        root /var/www/certbot;
    }

    location / {
                rewrite ^ https://$host$request_uri? permanent;
        }    
}
server {
	listen 443 ssl http2;
        listen [::]:443 ssl http2;
        server_name example.org;

        server_tokens off;

        ssl_certificate /etc/letsencrypt/live/example.org/fullchain.pem;
        ssl_certificate_key /etc/letsencrypt/live/example.org/privkey.pem;

        ssl_buffer_size 8k;
        ssl_dhparam /etc/ssl/certs/dhparam-2048.pem;

        ssl_protocols TLSv1.2 TLSv1.1 TLSv1;
        ssl_prefer_server_ciphers on;

        ssl_ciphers ECDH+AESGCM:ECDH+AES256:ECDH+AES128:DH+3DES:!ADH:!AECDH:!MD5;

        ssl_ecdh_curve secp384r1;
        ssl_session_tickets off;

        ssl_stapling on;
        ssl_stapling_verify on;
        resolver 8.8.8.8;


        location / {
                proxy_pass http://localhost:3002;
                add_header X-Frame-Options "SAMEORIGIN" always;
                add_header X-XSS-Protection "1; mode=block" always;
                add_header X-Content-Type-Options "nosniff" always;
                add_header Referrer-Policy "no-referrer-when-downgrade" always;
                add_header Content-Security-Policy "default-src * data: 'unsafe-eval' 'unsafe-inline'" always;
        }

        root /var/www/html;
        index index.html index.htm index.nginx-debian.html;

        
}





