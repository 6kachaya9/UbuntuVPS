#!/bin/bash
sudo passwd root
sudo apt update
sudo apt upgrade  -y
sudo apt -y install vim libffi-dev python3-pip python3-dev  python3-testresources libssl-dev wkhtmltopdf
sudo apt install curl
sudo curl --silent --location https://deb.nodesource.com/setup_14.x | sudo bash -
curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | gpg --dearmor | sudo tee /usr/share/keyrings/yarnkey.gpg >/dev/null
echo "deb [signed-by=/usr/share/keyrings/yarnkey.gpg] https://dl.yarnpkg.com/debian stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update && sudo apt-get install yarn
sudo apt -y install gcc g++ make nodejs redis-server
sudo apt -y install nginx
sudo apt install mariadb-server
sudo mysql -u root
USE mysql;
UPDATE user SET plugin='mysql_native_password' WHERE User='root';
UPDATE user SET authentication_string=password('your_password') WHERE user='root';
FLUSH PRIVILEGES;
EXIT;
