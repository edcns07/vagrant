#!bash
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
sudo yum install -y php php-cli php-common php-devel php-mysql
#Download  Starter Content
cd /vagrant
sudo -u vagrant wget -q https://raw.githubusercontent.com/edcns07/vagrant/master/files/index.html
sudo -u vagrant wget -q https://raw.githubusercontent.com/edcns07/vagrant/master/files/info.php
