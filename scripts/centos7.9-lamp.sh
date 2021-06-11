#!/bin/bash
# Update OS w any paches
#su # need to be root to run the updates
#yum update -y --exclude=kernel
sudo yum update -y
#Tools
sudo yum install -y nano git unzip screen wget
#Apache
sudo yum install -y httpd httpd-devel httpd-tools
# chkconfig --add httpd => deprecated
# chkconfig httpd on=> deprecated
sudo systemctl enable httpd
sudo systemctl start httpd
#service httpd stop => deprecated
#stop the service to remove web dir and symlink to shared folder
sudo systemctl stop httpd
#remove apache web dir
sudo rm -rf /var/www/html
sudo ln -s /vagrant /var/www/html
sudo systemctl start httpd
#PHP install
PHP
sudo yum install -y php php-cli php-common php-devel php-mysql
#MySQL
#MySQL is not a default drop-in dbase in CentOS7, but Mariadb by default.
#sudo yum install -y mysql mysql-server mysql-devel
#sudo systemctl enable mysqld
#sudo systemctl start mysqld
sudo yum install -y mysql mariadb-server mysql-devel
sudo systemctl enable mariadb

sudo systemctl mariadb start

mysql -u root -e "SHOW DATABASES";

#Download  Starter Content
cd /vagrant
sudo -u vagrant wget -q https://raw.githubusercontent.com/edcns07/vagrant/master/files/index.html
sudo -u vagrant wget -q https://raw.githubusercontent.com/edcns07/vagrant/master/files/info.php




