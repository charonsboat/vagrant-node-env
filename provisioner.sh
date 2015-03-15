#!/bin/bash

printf "Running Vagrant Provisioning..."

printf "Updating Box..."
# make sure the box is fully up to date
apt-get update

# uncomment the line below to allow the system to upgrade
#apt-get upgrade -y && apt-get dist-upgrade -y

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

# backup mongodb-org config file
cp /etc/mongod.conf /etc/mongod.conf.backup

# backup redis-server config file
cp /etc/redis/redis.conf /etc/redis/redis.conf.backup

# make sure npm is up to date
npm install -g npm

# remove old hash for npm so bash will find the new version
hash -d npm

printf "Installing common nodejs tools..."
# install common nodejs tools
npm install -g gulp
npm install -g grunt-cli
npm install -g bower
npm install -g yo
