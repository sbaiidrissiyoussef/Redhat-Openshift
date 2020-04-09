#!/bin/bash

#################################################################################
#                                                                               #
#	Subject 	:	 Installing Redhat Openshift using minishift on RHEL 8.1    #
#	creator 	:	 Youssef Sbai Idrissi                                       #
#	Date 		:	 4 / 09 / 2020                                              #
#                                                                               #
#################################################################################

## Note : Setup your yum before starting
### Installing prereqs
yum install qemu-kvm* libvirt
systemctl enable --now libvirtd
grep libvirt /etc/group

### Add user okd
useradd -G wheel okd
usermod -a -G libvirt okd 
newgrp libvirt || newgrp libvirtd

###  Install Docker
curl --location https://github.com/docker/machine/releases/download/v0.16.1/docker-machine-Linux-`uname -i` > /tmp/docker-machine
chmod +x /tmp/docker-machine
mv /tmp/docker-machine /usr/local/bin/

### Install KVM drivers
curl --location https://github.com/dhiltgen/docker-machine-kvm/releases/download/v0.10.0/docker-machine-driver-kvm-centos7 > /tmp/docker-machine-driver-kvm
chmod +x /tmp/docker-machine-driver-kvm
mv /tmp/docker-machine-driver-kvm /usr/local/bin/

### Download Minishift
wget -qO- https://github.com/minishift/minishift/releases/download/v1.34.0/minishift-1.34.0-linux-amd64.tgz | tar --extract --gzip --verbose -C /usr/bin/
ln /usr/bin/minishift-1.34.0-linux-amd64/minishift /usr/bin/minishift

## Start Minishift
su - okd
minishift start --memory 2048