#!/bin/bash
sudo apt-get update
sudo apt-get upgrade

adduser kachaya
usermod -aG sudo kachaya

sudo passwd -l root

sudo sed -i 's/PermitRootLogin yes/PermitRootLogin no/g' /etc/ssh/sshd_config

sudo sed -i 's/#Port 22/Port 168/g' /etc/ssh/sshd_config

sudo sed -i 's/5222/52xx/g' /etc/services
sudo sed -i 's/22125/xx125/g' /etc/services
sudo sed -i 's/22128/xx128/g' /etc/services
sudo sed -i 's/22273/xx273/g' /etc/services
sudo sed -i 's/22/168/g' /etc/services
sudo sed -i 's/52xx/5222/g' /etc/services
sudo sed -i 's/xx125/22125/g' /etc/services
sudo sed -i 's/xx128/22128/g' /etc/services
sudo sed -i 's/xx273/22273/g' /etc/services

sudo apt install ufw -y
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow ssh
sudo ufw enable

