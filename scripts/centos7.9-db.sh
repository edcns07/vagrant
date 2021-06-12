#!bash
#MySQL
#MySQL is not a default drop-in dbase in CentOS7, but Mariadb by default.
#sudo yum install -y mysql mysql-server mysql-devel
#sudo systemctl enable mysqld
#sudo systemctl start mysqld
sudo yum install -y mysql mariadb-server mysql-devel
sudo systemctl enable mariadb
sudo systemctl start mariadb
mysql -u root -e "SHOW DATABASES";