#!/bin/bash
# Update OS w any paches
sudo yum update -y --exclude=kernel
#Tools
sudo yum install -y nano git unzip screen wget nc telnet
#Apache
sudo yum install -y httpd httpd-devel httpd-tools
sudo systemctl enable httpd
sudo systemctl start httpd
sudo systemctl stop httpd
#remove apache web dir
sudo rm -rf /var/www/html
sudo ln -s /vagrant /var/www/html
sudo systemctl start httpd
#PHP install
sudo yum install -y php php-cli php-common php-devel php-mysql
#Download  Starter Content
cd /vagrant
sudo -u vagrant wget -q https://raw.githubusercontent.com/edcns07/vagrant/master/files/index.html
sudo -u vagrant wget -q https://raw.githubusercontent.com/edcns07/vagrant/master/files/info.php