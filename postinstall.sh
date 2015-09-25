#!/bin/bash
# NOTE: This script is meant to be run as the vagrant user

printf "Running Post-Install as vagrant user..."
# vagrant doesn't automatically load nvm source from .bashrc in provisioning
source /home/vagrant/.nvm/nvm.sh

# using latest stable version of node
# change this to whatever version of node you want to install packages for
nvm use v0.*

# NOTE: Customize the below packages to meet your personal needs
# install common nodejs tools
npm install -g pm2
npm install -g gulp
npm install -g grunt-cli
npm install -g bower
npm install -g yo
npm install -g testem
npm install -g karma-cli
npm install -g jasmine
