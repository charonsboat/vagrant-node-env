VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

    # Vagrant box to build on
    config.vm.box = "ubuntu/trusty64"

    # host to guest port forwarding
    config.vm.network :forwarded_port, guest: 1337, host: 1337

    config.vm.provision :shell, path: "./provisioner.sh"
end
