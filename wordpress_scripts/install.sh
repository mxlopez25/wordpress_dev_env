echo '========================== WORDPRESS INSTALL START ==========================' &&

cd /tmp &&
curl -O https://wordpress.org/latest.tar.gz &&
tar xzvf latest.tar.gz &&
touch /tmp/wordpress/.htaccess &&
chmod 660 /tmp/wordpress/.htaccess &&
cp /tmp/wordpress/wp-config-sample.php /tmp/wordpress/wp-config.php &&
mkdir /tmp/wordpress/wp-content/upgrade &&
sudo cp -a /tmp/wordpress/. /var/www/html &&
sudo chown -R vagrant:www-data /var/www/html &&
sudo find /var/www/html -type d -exec chmod g+s {} \; && 
sudo chmod g+w /var/www/html/wp-content &&
sudo chmod -R g+w /var/www/html/wp-content/themes &&
sudo chmod -R g+w /var/www/html/wp-content/plugins &&
rm /var/www/html/index.html &&
sudo sed -i 's/define( '\''DB_NAME'\'', '\''database_name_here'\'' );/define( '\''DB_NAME'\'', '\''wordpress'\'' );/g' /var/www/html/wp-config.php &&
sudo sed -i 's/define( '\''DB_USER'\'', '\''username_here'\'' );/define('\''DB_USER'\'', '\''wordpressuser'\'');/g' /var/www/html/wp-config.php &&
sudo sed -i 's/define( '\''DB_PASSWORD'\'', '\''password_here'\'' );/define('\''DB_PASSWORD'\'', '\''password'\'');/g' /var/www/html/wp-config.php &&

echo '========================== WORDPRESS INSTALL DONE ==========================';
