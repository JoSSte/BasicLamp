#!/bin/bash

sudo sed -i 's/AcceptEnv/\#AcceptEnv/g' /etc/ssh/sshd_config
sudo /etc/init.d/ssh reload

### INSTALL APT PACKAGES ###
export DEBIAN_FRONTEND=noninteractive

#fix apt sources.list
#sudo sed -i 's/archive.ubuntu/old-releases.ubuntu/g' /etc/apt/sources.list
#sudo sed -i 's/deb http://security/\#deb http://security/g' /etc/apt/sources.list

#mark openssh-server hold to avoid dialog
#sudo apt-mark hold openssh-server

sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install -y apache2 git unzip mysql-server php8.1-curl php8.1-gd php8.1 php8.1-mysql php8.1-zip php8.1-mbstring php8.1-xml php-xdebug php-pear*
#pre-fetch modsecurity without installing it
sudo apt-get install --download-only libapache2-mod-security2 liblua5.1-0 libyajl2 modsecurity-crs
sudo apt-get upgrade -y

### APACHE ###
# Copy xdebug config to proper location
sudo mv /tmp/xdebug.ini /etc/php/8.1/mods-available/xdebug.ini
sudo touch /var/log/apache2/xdebug.log
sudo chmod 777 /var/log/apache2/xdebug.log


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
sudo sed -i "s/bind-address\s*= 127.0.0.1/bind-address = 0.0.0.0/" /etc/mysql/mysql.conf.d/mysqld.cnf
sudo ufw allow 3306
sudo systemctl restart mysql

