#!/bin/bash

sudo sed -i 's/AcceptEnv/\#AcceptEnv/g' /etc/ssh/sshd_config
sudo /etc/init.d/ssh reload
sudo apt install software-properties-common
sudo apt-get update
sudo apt-get -y upgrade
sudo add-apt-repository ppa:ondrej/php
sudo apt-get update
sudo apt-get install -y apache2 php8.0-curl php8.0-gd apache2 mysql-server php8.0 unzip php8.0-mysql php-xdebug php-pear* git
#pre-fetch modsecurity without installing it
sudo apt-get install --download-only libapache2-mod-security2 liblua5.1-0 libyajl2 modsecurity-crs

#copy xdebug config to proper location
sudo mv /tmp/xdebug.ini /etc/php/8.0/mods-available/xdebug.ini

#enable mod_ssl
sudo a2enmod ssl
#restarting apache2
sudo systemctl reload apache2