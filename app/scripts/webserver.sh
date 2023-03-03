
#!/bin/bash
sudo apt update
sudo apt  -y install httpd
sudo apt -y  install git
git clone https://github.com/iconx2020a/medicoms.git
sudo cp  /etc/httpd/conf.d/vhost.conf  /etc/httpd/conf.d/vhost.conf.bk 
sudo cp medicoms/000-default.conf /etc/httpd/conf.d/vhost.conf 
sudo a2enmod 
sudo systemctl restart httpd
sudo systemctl enable httpd 
