#!/bin/bash

# Install MySQL
sudo apk add mysql mysql-client

# Initialize MySQL database
sudo mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql

# Start MySQL service
sudo rc-service mariadb start

# Set root password and apply security settings
sudo mysqladmin -u root password 'rootpassword'
sudo mysql -u root -prootpassword -e "DELETE FROM mysql.user WHERE User='';"
sudo mysql -u root -prootpassword -e "DROP DATABASE test;"
sudo mysql -u root -prootpassword -e "FLUSH PRIVILEGES;"

# Run the SQL file to create initial tables
sudo mysql -u root -prootpassword < /home/vagrant/database/init.sql