#!/bin/bash

sudo sed -i 's/AcceptEnv/\#AcceptEnv/g' /etc/ssh/sshd_config
sudo /etc/init.d/ssh reload
sudo apt-get update
sudo apt-get install -y apache2 php7.4-curl php7.4-gd apache2 mysql-server php7.4 unzip php7.4-mysql php-xdebug php-pear* git
#pre-fetch modsecurity without installing it
sudo apt-get install --download-only libapache2-mod-security2 liblua5.1-0 libyajl2 modsecurity-crs

#copy xdebug config to proper location
sudo mv /tmp/xdebug.ini /etc/php/7.4/mods-available/xdebug.ini

#enable mod_ssl
sudo a2enmod ssl
#restarting apache2
sudo systemctl reload apache2