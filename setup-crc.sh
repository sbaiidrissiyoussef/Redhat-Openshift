#!/bin/bash

#############################################################################################
#                                                                                           #
#	Subject 	:	 Installing Redhat Openshift using Code Ready Container on RHEL 8.1           #
#	creator 	:	 Youssef Sbai Idrissi                                                         #
#	Date 		:	 4 / 09 / 2020                                                                  #
#                                                                                           #
#############################################################################################

## Note : Setup your yum before starting
## Install prerequisites
yum -y install qemu-kvm libvirt virt-install bridge-utils NetworkManager

## Download binaries
mkdir /opt/crc
cd /opt/crc
wget https://mirror.openshift.com/pub/openshift-v4/clients/crc/latest/crc-linux-amd64.tar.xz
tar xvf crc-linux-amd64.tar.xz

## Setup path
cd crc*
cp crc /usr/bin

## Verify version
crc version

## Deploy & Start Openshift CRC 
crc setup
crc start

## Note : When you're prompted to enter the Pull Secret, get it from the link : https://cloud.redhat.com/openshift/install/crc/installer-provisioned
