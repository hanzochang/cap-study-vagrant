# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu-14.04"
  config.vm.provider "virtualbox" do |v|
    v.memory = 4096
  end

  config.vm.hostname = 'testv'

  config.vm.network :private_network, ip: "192.168.63.23"
  config.vm.network :forwarded_port, guest: 22, host: 34403
  config.vm.network :public_network

  # config.vm.provision :itamae do |config|
    # config.sudo = true
    # config.recipes = ['./pre_cookbooks/default.rb', './cookbooks/default.rb']
    # config.json = './nodes/node.json'
  # end
end
