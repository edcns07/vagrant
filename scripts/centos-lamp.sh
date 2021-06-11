#!/bin/bash
# Update OS w any paches
su # need to be root to run the updates
yum update -y --exclude=kernel
# YumRepo Error: All mirror URLs are not using ftp, http[s] or file
# edit /etc/yum.repos.d/CentOS-Base.repo
# Comment out mirrorlist and uncomment baseurl
# Change all
# From baseurl=http://mirror.centos.org/centos/$releasever/centosplus/$basearch/
# To baseurl=http://vault.centos.org/$releasever/centosplus/$basearch/
# replace $releasever with actual version like 6.5 to work
#Tools
yum install -y nano git unzip screen
#Apache
yum install -y httpd httpd-devel httpd-tools
chkconfig --add httpd
chkconfig httpd on
service httpd stop

rm -rf /var/www/html
ln -s /vagrant/www/html
service httpd start

#PHP
yum install -y php php-cli php-common php-devel php-mysql

#MySQL
yum install -y mysql mysql-server mysql-devel
chkconfig --add mysqld
chkconfig mysqld on

service mysqld start

mysql -u root -e "SHOW DATABASES";

#Download  Starter Content
cd /vagrant
sudo -u vagrant wget -q https://raw.githubusercontent.com/edcns07/vagrant/master/files/index.html
sudo -u vagrant wget -q https://raw.githubusercontent.com/edcns07/vagrant/master/files/info.php

service httpd restart



