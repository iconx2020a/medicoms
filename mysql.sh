#!/bin/bash
sudo yum install -y https://dev.mysql.com/get/mysql80-community-release-el7-5.noarch.rpm 
sudo yum install -y mysql-community-server
sudo systemctl active mysqld
sudo systemctl start mysqld
sudo systemctl status mysqld
sudo cat /var/log/mysqld.log | grep "A temporary password"
#sudo mysql_secure_installation
