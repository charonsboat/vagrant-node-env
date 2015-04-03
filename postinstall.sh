# NOTE: This script is meant to be run as the Vagrant user

printf "Running Post-Install as Vagrant User..."
# install common nodejs tools
npm install -g pm2
npm install -g gulp
npm install -g grunt-cli
npm install -g bower
npm install -g yo
npm install -g karma-cli
npm install -g jasmine
npm install -g testem
