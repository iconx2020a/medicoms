#!/bin/bash
sudo yum -y update
sudo yum -y install java-1.8.0-openjdk-devel
sudo useradd -m -U -d /opt/tomcat -s /bin/false tomcat
sudo yum -y install wget
#wget https://www-eu.apache.org/dist/tomcat/tomcat-9/v9.0.27/bin/apache-tomcat-9.0.27.tar.gz
wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.72/bin/apache-tomcat-9.0.72.tar.gz
tar -xf apache-tomcat-9.0.72.tar.gz
sudo mv apache-tomcat-9.0.72 /opt/tomcat/
#sudo ln -s /opt/tomcat/apache-tomcat-9.0.27 /opt/tomcat/latest
sudo chown -R tomcat: /opt/tomcat
sudo sh -c 'chmod +x /opt/tomcat/bin/*.sh'
sudo yum -y install git
git clone https://github.com/iconx2020a/medicoms.git
sudo cp medicoms/tomcat.service /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl enable tomcat
sudo systemctl start tomcat
#sudo firewall-cmd --zone=public --permanent --add-port=8080/tcp
#sudo firewall-cmd --reload
sudo yum -y install lynx
sudo cp medicoms/MedicomTestApp-1.0-SNAPSHOT.war  /opt/tomcat/webapps/
sudo cp medicoms/index.html /opt/tomcat/webapps/ROOT 
