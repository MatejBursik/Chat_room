#!/bin/bash

sudo apt-get update
sudo apt-get install -y mysql-server

# Start MySQL service
sudo systemctl start mysql

# Set root password and apply security settings
sudo mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH 'mysql_native_password' BY 'rootpassword';"
sudo mysql -u root -prootpassword -e "DELETE FROM mysql.user WHERE User='';"
sudo mysql -u root -prootpassword -e "FLUSH PRIVILEGES;"

# Run the SQL file to create initial tables
sudo mysql -u root -prootpassword < /home/vagrant/database/db_init.sql

# Optional: Run the SQL file to add initial data
sudo mysql -u root -prootpassword < /home/vagrant/database/data_init.sql