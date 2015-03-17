# Vim
# vim: set filetype=ruby:
# vim: set ft=ruby:
#
# Emacs
# -*- mode: ruby; -*-

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

    # Vagrant box to build on
    config.vm.box = "ubuntu/trusty64"

    # host to guest port forwarding
    config.vm.network :forwarded_port, guest: 1337, host: 1337

    # set up synced folder
    config.vm.synced_folder "./www", "/home/vagrant/www"

    # if you are using VirtualBox, uncomment the line below to allow symlinks in the shared "www" folder
    #config.vm.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/home/vagrant/www", "1"]

    # call provisioner shell script
    config.vm.provision :shell, path: "./provisioner.sh"
end
