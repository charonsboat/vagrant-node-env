# vagrant-node-env

A Node.js (or io.js) development environment built on [Vagrant](https://www.vagrantup.com/). Get up and running in about 60 seconds.

## Setup

This environment will allow you to build Node apps with minimal setup. You only need to have a couple of things to get started:

- VirtualBox: https://www.virtualbox.org/
- Vagrant:    https://www.vagrantup.com/

You should be able to use your choice of virtual machines, but I have only tested this in VirtualBox. If you have any problems, be sure to [create an issue](https://github.com/renobit/vagrant-node-env/issues).

After you have those set up, you can get started by cloning this repo:

```bash
git clone https://github.com/renobit/vagrant-node-env.git node-env
```

Now, you can move into the new directory and launch the VM:

```bash
cd node-env
vagrant up
```

Note: Vagrant will download the necessary box automatically if it isn't already on the machine.

After a few minutes of downloading, upgrading, and configuring the box, you will have a fully functional Node dev environment with npm, mongodb, and redis. A couple of things to keep note of:

- The ```www``` directory is synced to ```/home/vagrant/www```
- Port ```1337``` in the VM is mapped to ```1337``` on localhost

## Included NPM Packages

- [PM2](https://github.com/Unitech/pm2): Process Manager
- [Gulp](http://gulpjs.com/): Streaming Build System
- [Grunt](http://gruntjs.com/): Task Runner
- [Bower](http://bower.io/): Front-End Package Manager
- [Yeoman](http://yeoman.io/): Project Scaffolding Tool
- [Testem](https://github.com/airportyh/testem): Test Runner
- [Karma](http://karma-runner.github.io/0.12/index.html): Test Runner
- [Jasmine](https://github.com/jasmine/jasmine): Testing Framework

#### Customizing Your Installation

If you want to customize your included packages (see the above list), then you can easily do so by changing the ```postinstall.sh``` script. This script is run as the vagrant user, not root.

## Testing

SSH into your vagrant box and launch the test server:

```bash
vagrant ssh
cd www/default
npm install
npm start
```

Now, open ```localhost:1337``` in your browser on your host machine. If everything worked correctly, you should see a "Hello, World!" message.

## Using io.js

This environment uses [nvm](https://github.com/creationix/nvm) in order to manage different versions of Node. If you aren't familiar with nvm, it is a tool that allows you to manage multiple versions of Node without overriding your other Node installs.

If you want to use io.js in place of Node by default, you can run ```nvm alias default iojs```. This will link the ```node``` command to io.js instead of Node.js starting with your next terminal session.

If you just want to temporarily switch between Node.js and io.js, you can use the ```nvm use iojs``` and ```nvm use node``` commands as needed.

## Using Windows Hosts

Since Windows file path limits are set to 260 characters by default, Vagrant will mount the ```www``` shared folder as a UNC path. This enables "long paths" in Windows, and should solve the common problem with npm installs failing under a Windows host.

If you'd like more information about how I built this solution into the Vagrant environment, you can view the source of the Vagrantfile or view [this commit](https://github.com/renobit/vagrant-node-env/commit/bdf15f2f301e2b1660b839875e34f172ea8be227) where I first implemented it.

If you don't want to enable symlinks in your shared directories (this is enabled by default), you can use ```npm install --no-bin-links``` instead of the standard install method.

## License

[MIT](https://github.com/renobit/vagrant-node-env/blob/master/LICENSE)
