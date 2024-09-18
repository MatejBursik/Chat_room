sudo apt-get update
sudo apt-get install -y nginx

# Configure Nginx as a reverse proxy
cat <<EOF > /etc/nginx/sites-available/default
http {
    upstream web {
        ip_hash;
        server srv1.example.com;
        server srv2.example.com;
        server srv3.example.com;
    }

    server {
        listen 80;
        
        # Reverse Proxy to HTML page server
        location / {
            proxy_pass http://web;
        }
    }
}
EOF

#sudo systemctl restart nginx
sudo service nginx restart
