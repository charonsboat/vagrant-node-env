#!/bin/bash

printf "Running Vagrant Provisioning..."

printf "Updating Box..."
# make sure the box is fully up to date
apt-get update

# comment out the line below to disallow the system to upgrade
apt-get upgrade -y && apt-get dist-upgrade -y

printf "Adding MongoDB packages to apt..."
# import the public key used by apt
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10

# create a list file for MongoDB
echo "deb http://repo.mongodb.org/apt/ubuntu "$(lsb_release -sc)"/mongodb-org/3.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.0.list

# reload the local package database
apt-get update

printf "Installing a few necessary packages..."
# install required packages
apt-get install -y git nodejs nodejs-legacy npm mongodb-org redis-server

# make sure npm is up to date
npm install -g npm

# remove old hash for npm so bash will find the new version
hash -d npm

# backup mongodb-org config file
cp /etc/mongod.conf /etc/mongod.conf.backup

# backup redis-server config file
cp /etc/redis/redis.conf /etc/redis/redis.conf.backup

printf "Installing nvm..."
# download package and switch to latest version
git clone --quiet https://github.com/creationix/nvm.git /home/vagrant/.nvm && cd /home/vagrant/.nvm
git checkout --quiet `git describe --abbrev=0 --tags`

# backup .bashrc since we're going to change it
cp /home/vagrant/.bashrc /home/vagrant/.bashrc.backup

# automatically source nvm from the .bashrc file on login
echo "source ~/.nvm/nvm.sh" >> /home/vagrant/.bashrc

# set the source of nvm for this session
source /home/vagrant/.nvm/nvm.sh

# install iojs with nvm
nvm install iojs

# make sure npm is up to date
npm install -g npm

# remove old hash for npm so bash will find the new version
hash -d npm

# install node with nvm, and set it to the default version
nvm install stable
nvm alias default stable

# make sure npm is up to date
npm install -g npm

# remove old hash for npm so bash will find the new version
hash -d npm

printf "Installing common nodejs tools..."
# install common nodejs tools
npm install -g pm2
npm install -g gulp
npm install -g grunt-cli
npm install -g bower
npm install -g yo
npm install -g karma-cli
npm install -g jasmine
npm install -g testem

printf "Making sure ownership rights are correct in vagrant user directory..."
# make sure everything in the vagrant directory is owned by vagrant
chown -R vagrant:vagrant /home/vagrant --quiet
