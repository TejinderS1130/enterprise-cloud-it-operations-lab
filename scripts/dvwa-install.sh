#!/bin/bash

echo "[+] Updating system..."
sudo apt update -y && sudo apt upgrade -y

echo "[+] Installing Apache, MySQL, PHP..."
sudo apt install -y apache2 mysql-server php php-mysqli php-gd libapache2-mod-php git unzip

echo "[+] Starting and enabling services..."
sudo systemctl start apache2
sudo systemctl enable apache2
sudo systemctl start mysql
sudo systemctl enable mysql

echo "[+] Configuring MySQL..."
sudo mysql <<EOF
CREATE DATABASE dvwa;
CREATE USER 'dvwa'@'localhost' IDENTIFIED BY 'dvwa123';
GRANT ALL PRIVILEGES ON dvwa.* TO 'dvwa'@'localhost';
FLUSH PRIVILEGES;
EOF

echo "[+] Downloading DVWA..."
cd /var/www/html
sudo rm -rf dvwa
sudo git clone https://github.com/digininja/DVWA.git dvwa

echo "[+] Setting permissions..."
sudo chown -R www-data:www-data /var/www/html/dvwa
sudo chmod -R 755 /var/www/html/dvwa

echo "[+] Configuring DVWA..."
cd /var/www/html/dvwa/config
sudo cp config.inc.php.dist config.inc.php

sudo sed -i "s/p@ssw0rd/dvwa123/g" config.inc.php
sudo sed -i "s/db_user/root/g" config.inc.php

echo "[+] Restarting Apache..."
sudo systemctl restart apache2

echo "[+] DVWA installation complete!"
echo "[+] Open browser: http://<EC2-PUBLIC-IP>/dvwa/setup.php"
