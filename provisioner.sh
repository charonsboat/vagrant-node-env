#!/bin/bash

printf "Running Vagrant Provisioning..."

printf "Updating Box..."
# make sure the box is fully up to date
apt-get update

# remove below line to allow the system to upgrade
# apt-get upgrade -y && apt-get dist-upgrade -y

printf "Installing a few necessary packages..."
# install required packages
apt-get install -y git nodejs nodejs-legacy npm mongodb-org

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
