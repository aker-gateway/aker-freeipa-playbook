#!/usr/bin/env bash

# install packages 
sudo dnf -y install python2-dnf libselinux-python

# configure hosts file for our internal network defined by Vagrantfile
cat >> /etc/hosts <<EOL

# vagrant environment nodes
192.168.122.10  aker
192.168.122.21  ipa1.example.com
192.168.122.22  ipa2.example.com
EOL

