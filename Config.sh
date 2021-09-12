#!/bin/bash
sudo apt-get update
sudo apt-get upgrade -y

sudo apt install gnome-session gnome-terminal -y

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

sudo apt-get install software-properties-common -y
sudo add-apt-repository ppa:qbittorrent-team/qbittorrent-stable
sudo apt install qbittorrent-nox -y
sudo adduser --system --group qbittorrent-nox
sudo adduser kachaya qbittorrent-nox
cd /etc/systemd/system
echo '[Unit]' > qbittorrent-nox.service
echo 'Description=qBittorrent Command Line Client' >> qbittorrent-nox.service
echo 'After=network.target' >> qbittorrent-nox.service
echo '[Service]' >> qbittorrent-nox.service
echo '#Do not change to "simple"' >> qbittorrent-nox.service
echo 'Type=forking' >> qbittorrent-nox.service
echo 'User=qbittorrent-nox' >> qbittorrent-nox.service
echo 'Group=qbittorrent-nox' >> qbittorrent-nox.service
echo 'UMask=007' >> qbittorrent-nox.service
echo 'ExecStart=/usr/bin/qbittorrent-nox -d --webui-port=8080' >> qbittorrent-nox.service
echo 'Restart=on-failure' >> qbittorrent-nox.service
echo '[Install]' >> qbittorrent-nox.service
echo 'WantedBy=multi-user.target' >> qbittorrent-nox.service
sudo systemctl start qbittorrent-nox
sudo systemctl daemon-reload
sudo systemctl enable qbittorrent-nox
sudo ufw allow 8080
