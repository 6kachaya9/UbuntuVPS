Creating sudo user

```
adduser kachaya
usermod -aG sudo kachaya
```

Removing root user

```
sudo passwd -l root
```

Disable ssh root login

```
sudo sed -i 's/PermitRootLogin yes/PermitRootLogin no/g' /etc/ssh/sshd_config
```

Changing SSH port

```
sudo nano /etc/ssh/sshd_config
sudo sed -i 's/#Port 22/Port 168/g' /etc/ssh/sshd_config
sudo nano /etc/services
sudo sed -i 's/5222/52xx/g' /etc/services
sudo sed -i 's/22125/xx125/g' /etc/services
sudo sed -i 's/22128/xx128/g' /etc/services
sudo sed -i 's/22273/xx273/g' /etc/services
sudo sed -i 's/22/168/g' /etc/services
sudo sed -i 's/52xx/5222/g' /etc/services
sudo sed -i 's/xx125/22125/g' /etc/services
sudo sed -i 's/xx128/22128/g' /etc/services
sudo sed -i 's/xx273/22273/g' /etc/services
```

Setup UFW firewall

```
sudo apt install ufw -y
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow ssh
sudo ufw enable
```

Installing Qbittorrent

```
sudo apt-get install software-properties-common -y
sudo add-apt-repository ppa:qbittorrent-team/qbittorrent-stable
sudo apt install qbittorrent-nox -y
sudo adduser --system --group qbittorrent-nox
sudo adduser kachaya qbittorrent-nox
sudo nano /etc/systemd/system/qbittorrent-nox.service
```

```
[Unit]
Description=qBittorrent Command Line Client
After=network.target
[Service]
#Do not change to "simple"
Type=forking
User=qbittorrent-nox
Group=qbittorrent-nox
UMask=007
ExecStart=/usr/bin/qbittorrent-nox -d --webui-port=8080
Restart=on-failure
[Install]
WantedBy=multi-user.target
```

```
sudo systemctl start qbittorrent-nox
sudo systemctl daemon-reload
sudo systemctl enable qbittorrent-nox
systemctl status qbittorrent-nox
sudo ufw allow 8080
```
