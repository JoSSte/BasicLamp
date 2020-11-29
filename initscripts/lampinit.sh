#!/bin/bash

sudo sed -i 's/AcceptEnv/\#AcceptEnv/g' /etc/ssh/sshd_config
sudo /etc/init.d/ssh reload
sudo apt-get update
sudo apt-get install -y apache2 php7.4-curl php7.4-gd apache2 mysql-server php7.4 unzip php7.4-mysql php-pear* git

#enable mod_ssl
sudo a2enmod ssl
#restarting apache2
sudo systemctl reload apache2