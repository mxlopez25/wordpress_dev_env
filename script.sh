#!/bin/bash

sudo apt-get update -y &&
sudo apt-get npm nodejs -y &&
sudo apt-get -y install vsftpd &&
sudo apt-get install apache2 aptitude -y &&

sudo apt-get install php libapache2-mod-php php-mcrypt php-mysql -y &&
sudo apt-get install php-curl php-gd php-mbstring php-mcrypt php-xml php-xmlrpc -y &&

source /vagrant/mysql_scripts/install.sh &&

sudo systemctl restart apache2 &&

echo '========= Enable .htaccess Overrides =========' &&
sudo echo '<Directory /var/www/html/>
    AllowOverride All
</Directory>' >> /etc/apache2/apache2.conf &&

echo '========= Enable the Rewrite Module =========' &&
sudo a2enmod rewrite &&

echo '========= Enable the Changes =========' &&
sudo apache2ctl configtest &&
sudo systemctl restart apache2 &&

source /vagrant/wordpress_scripts/install.sh &&

echo '======================================================================================' &&
echo '======================================== DONE ========================================' &&
echo '======================================================================================';