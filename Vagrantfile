# Vim
# vim: set filetype=ruby:
# vim: set ft=ruby:
#
# Emacs
# -*- mode: ruby; -*-

VAGRANTFILE_API_VERSION = "2"
MAX_MEMORY = 1024
PROVIDER = "virtualbox"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

    # Vagrant box to build on
    config.vm.box = "ubuntu/trusty64"

    # host to guest port forwarding
    config.vm.network :forwarded_port, guest: 1337, host: 1337

    if PROVIDER == "virtualbox"
        # settings for VirtualBox provider
        config.vm.provider "virtualbox" do |v|
            v.memory = MAX_MEMORY
            v.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/home/vagrant/www", "1"]

            if Vagrant::Util::Platform.windows?
                v.customize ["sharedfolder", "add", :id, "--name", "www", "--hostpath", (("//?/" + File.dirname(__FILE__) + "/www").gsub("/","\\"))]
            end
        end

        if Vagrant::Util::Platform.windows?
            config.vm.provision :shell, inline: "mkdir /home/vagrant/www"
            config.vm.provision :shell, inline: "mount -t vboxsf -o uid=`id -u vagrant`,gid=`getent group vagrant | cut -d: -f3` www /home/vagrant/www", run: "always"
        else
            config.vm.synced_folder "./www", "/home/vagrant/www"
        end
    else
        config.vm.synced_folder "./www", "/home/vagrant/www"
    end

    # call provisioner shell script
    config.vm.provision :shell, path: "./provisioner.sh"
    config.vm.provision :shell, path: "./postinstall.sh", privileged: false
end
