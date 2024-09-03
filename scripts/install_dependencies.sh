#!/bin/bash

# this file is being executed in /opt/codedeploy-agent/deployment-root/47../<deployment_id>/

#stdout logs of this process executing can be found in /opt/codedeploy-agent/deployment-root/47../<deployment_id>/logs/scripts.log

# here we update the server and install node and npm
echo installing dependencies
sudo yum update
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
# . ~/.nvm/nvm.sh
source ~/.bashrc
nvm install --lts
nvm use --delete-prefix v20.17.0
sudo yum -y install npm

# check to make sure the symbolic link for nodejs node exists
echo checking for nodejs symlink
file="/usr/bin/node"
if [ -f $file ] && [ ! -L $file ] ; then
  echo "$file exists and is not a symlink"
  sudo ln -s /usr/bin/nodejs
else
  echo "$file exists and is already a symlink"
fi

# install the application using npm
# we need to traverse to where the application bundle is copied too.
echo installing application with npm
cd /var/www/
# sudo npm install

# echo installing pm2
# sudo npm install pm2 -g

# Check if PM2 is installed, if not install it
echo "Checking if PM2 is installed"
if command -v pm2 >/dev/null 2>&1; then
  echo "PM2 is already installed"
else
  echo "PM2 is not installed, installing PM2"
  sudo npm install pm2 -g
fi
