sudo apt-get update
sudo apt-get install -y nginx

# Configure Nginx as a reverse proxy
cat <<EOF > /etc/nginx/sites-available/default
server {
    listen 80;
    
    # Reverse Proxy to HTML page server
    location / {
        proxy_pass http://web;
        proxy_set_header Host \$host;
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto \$scheme;
    }
}
EOF

sudo systemctl restart nginx
