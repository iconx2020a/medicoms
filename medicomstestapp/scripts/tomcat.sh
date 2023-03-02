#!/bin/bash
sudo apt update
sudo apt -y install default-jdk
sudo apt -y install tomcat9 
sudo service tomcat9 start 
sudo apt -y install lynx
sudo apt -y install git
sudo systemctl enable tomcat9
