#!/bin/bash

sudo sed -i 's/AcceptEnv/\#AcceptEnv/g' /etc/ssh/sshd_config
sudo /etc/init.d/ssh reload
sudo apt-get install software-properties-common

### INSTALL APT PACKAGES ###
sudo apt-get update
sudo apt-get -y upgrade
sudo add-apt-repository ppa:ondrej/php
sudo apt-get update
sudo apt-get install -y apache2 php8.0-curl php8.0-gd apache2 mysql-server php8.0 unzip php8.0-mysql php-xdebug php-pear* git
#pre-fetch modsecurity without installing it
sudo apt-get install --download-only libapache2-mod-security2 liblua5.1-0 libyajl2 modsecurity-crs

### APACHE ###
#copy xdebug config to proper location
sudo mv /tmp/xdebug.ini /etc/php/8.0/mods-available/xdebug.ini

# Enable mod_ssl
sudo a2enmod -q ssl
# Restart apache2
sudo systemctl reload apache2

### MySQL ###
# Setup mysql user
cat <<EOD | sudo mysql -u root mysql
  CREATE USER 'vagrant'@'%' IDENTIFIED BY 'secret';
  GRANT ALL PRIVILEGES ON * . * TO 'vagrant'@'%';
  FLUSH PRIVILEGES;
EOD


LOCAL_IP_LIST=`ip addr show | grep -Po 'inet \K[\d.]+'` 
# Allow remote connections to mysql (don't do it like this in production)
#sudo sed -i "s/bind-address\s*= 127.0.0.1/bind-address = $IP_ADDR,127.0.0.1/" /etc/mysql/mysql.conf.d/mysqld.cnf
sudo ufw allow 3306
#sudo systemctl restart mysql

