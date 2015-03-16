# vagrant-node-env

A Node.js development environment built on [Vagrant](https://www.vagrantup.com/).

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

## Testing

SSH into your vagrant box and launch the test server:

```bash
vagrant ssh
cd www
node server.js
```

Now, open ```localhost:1337``` in your browser on your host machine. If everything worked correctly, you should see a "Hello, World!" message.

## Using io.js

This environment uses [nvm](https://github.com/creationix/nvm) in order to manage different versions of Node. If you aren't familiar with nvm, it is a tool that allows you to manage multiple versions of Node at once.

If you want to use io.js in place of Node by default, you can run ```nvm alias default iojs```. This will link the ```node``` command to io.js instead of Node.js. 

If you just want to temporarily switch between Node.js and io.js, you can use the ```nvm use iojs``` and ```nvm use node``` commands as needed.
