#!/bin/bash
# NOTE: This script is meant to be run as the vagrant user

printf "Running Post-Install as vagrant user..."
# set the source of nvm for this session
source /home/vagrant/.nvm/nvm.sh
nvm use stable

# install common nodejs tools
npm install -g pm2
npm install -g gulp
npm install -g grunt-cli
npm install -g bower
npm install -g yo
npm install -g karma-cli
npm install -g jasmine
npm install -g testem
