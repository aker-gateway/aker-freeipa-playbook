# Defines our Vagrant environment
#
# -*- mode: ruby -*-
# vi: set ft=ruby :

DOMAIN="ipa.example"
Vagrant.configure("2") do |config|

  # create aker node
  config.vm.define :aker do |aker_config|
      aker_config.vm.box = "anazmy/freeipa-client"
      aker_config.vm.hostname = "aker.#{DOMAIN}"
      aker_config.vm.network "private_network", ip: "192.168.122.10", auto_config: "false"
      aker_config.vm.provider "libvirt" do |libvirt|
      aker_config.vm.synced_folder ".", "/vagrant", disabled: true
        libvirt.memory = 512
	libvirt.cpu_mode = "host-passthrough"
      end
      aker_config.vm.provision "file", source: "~/.ssh/id_rsa.pub", destination: "~/.ssh/me.pub"
      aker_config.vm.provision "shell", inline: "cat ~vagrant/.ssh/me.pub >> ~vagrant/.ssh/authorized_keys"
      aker_config.vm.provision :shell, :inline => "sudo hostnamectl set-hostname aker.#{DOMAIN}"
  end

  # create one freeipa master
  # https://docs.vagrantup.com/v2/vagrantfile/tips.html
    config.vm.define "master1" do |node|
        node.vm.box = "anazmy/freeipa-server"
        node.vm.hostname = "master1.#{DOMAIN}"
        node.vm.network "private_network", ip: "192.168.122.21", auto_config: "false"
        node.vm.synced_folder ".", "/vagrant", disabled: true
        node.vm.provider "libvirt" do |libvirt|
          libvirt.memory = 1536
	  libvirt.cpu_mode = "host-passthrough"
        end
        node.vm.provision "file", source: "~/.ssh/id_rsa.pub", destination: "~/.ssh/me.pub"
        node.vm.provision "shell", inline: "cat ~vagrant/.ssh/me.pub >> ~vagrant/.ssh/authorized_keys"
        node.vm.provision :shell, :inline => "sudo hostnamectl set-hostname master1.#{DOMAIN}"
    end


  # create some freeipa clients
  (1..2).each do |i|
    config.vm.define "web#{i}" do |node|
        node.vm.box = "anazmy/freeipa-client"
        node.vm.hostname = "web#{i}.#{DOMAIN}"
        node.vm.network "private_network", ip: "192.168.122.3#{i}", auto_config: "false"
        node.vm.synced_folder ".", "/vagrant", disabled: true
        node.vm.provider "libvirt" do |libvirt|
          libvirt.memory = 512
          libvirt.cpu_mode = "host-passthrough"
        end
        node.vm.provision "file", source: "~/.ssh/id_rsa.pub", destination: "~/.ssh/me.pub"
        node.vm.provision "shell", inline: "cat ~vagrant/.ssh/me.pub >> ~vagrant/.ssh/authorized_keys"
        node.vm.provision :shell, :inline => "sudo hostnamectl set-hostname web#{i}.#{DOMAIN}"
    end
 end


  # create node 
  config.vm.define :db1 do |db1_config|
      db1_config.vm.box = "viniciusfs/centos6"
      db1_config.vm.hostname = "db1.#{DOMAIN}"
      db1_config.vm.network "private_network", ip: "192.168.122.41", auto_config: "false"
      db1_config.vm.provider "libvirt" do |libvirt|
      db1_config.vm.synced_folder ".", "/vagrant", disabled: true
        libvirt.memory = 512
	libvirt.cpu_mode = "host-passthrough"
      end
      db1_config.vm.provision "file", source: "~/.ssh/id_rsa.pub", destination: "~/.ssh/me.pub"
      db1_config.vm.provision "shell", inline: "cat ~vagrant/.ssh/me.pub >> ~vagrant/.ssh/authorized_keys"
  end
  
    # create node 
  config.vm.define :db2 do |db2_config|	
      #db2_config.vm.box = "sylvainjoyeux/ubuntu-16.04-x86_64"
      db2_config.vm.box = "anazmy/freeipa-client"
      db2_config.vm.hostname = "db2.#{DOMAIN}"
      db2_config.vm.network "private_network", ip: "192.168.122.42", auto_config: "false"
      db2_config.vm.provider "libvirt" do |libvirt|
      db2_config.vm.synced_folder ".", "/vagrant", disabled: true
        libvirt.memory = 512
	libvirt.cpu_mode = "host-passthrough"
      end
      db2_config.vm.provision "file", source: "~/.ssh/id_rsa.pub", destination: "~/.ssh/me.pub"
      db2_config.vm.provision "shell", inline: "cat ~vagrant/.ssh/me.pub >> ~vagrant/.ssh/authorized_keys"
      db2_config.vm.provision :shell, :inline => "sudo hostnamectl set-hostname db2.#{DOMAIN}"
  end
end
