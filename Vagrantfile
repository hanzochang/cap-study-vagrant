# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # config.vm.box = "ubuntu/trusty64"
  # config.vm.box_url = "https://vagrantcloud.com/ubuntu/trusty64"
  config.vm.box = "ubuntu-14.04"
  config.vm.box_url = "http://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_ubuntu-14.04_chef-provisionerless.box"
  config.vm.provider "virtualbox" do |v|
    v.memory = 4096
  end

  config.vm.hostname = 'hoge'

  config.vm.network :private_network, ip: "192.168.43.23"
  config.vm.network :forwarded_port, guest: 22, host: 34402
  config.vm.network :public_network

  config.vm.synced_folder "./data", "/vagrant"
end
