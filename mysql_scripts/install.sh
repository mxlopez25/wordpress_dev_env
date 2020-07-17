#!/bin/bash

echo '========================== MYSQL INSTALL START ==========================' &&

sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password secret' &&
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password secret' &&

sudo apt-get install mysql-server -y &&

source /vagrant/mysql_scripts/conf.sh &&

mysql -u root --password=secret -e "CREATE DATABASE wordpress DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;" &&
mysql -u root --password=secret -e "GRANT ALL ON wordpress.* TO 'wordpressuser'@'localhost' IDENTIFIED BY 'password';" &&
mysql -u root --password=secret -e "FLUSH PRIVILEGES;" &&

echo '========================== MYSQL INSTALL DONE ==========================';