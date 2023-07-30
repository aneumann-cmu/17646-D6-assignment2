#!/bin/bash

# Update system packages
sudo apt update
sudo apt upgrade -y

# Install required packages
sudo apt install -y \
    git \
    cpu-checker \
    qemu-kvm \
    virt-manager \
    libvirt-daemon-system \
    virtinst \
    libvirt-clients \
    bridge-utils \
    qemu \
    libvirt-daemon-system \
    libvirt-clients \
    libxslt-dev \
    libxml2-dev \
    libvirt-dev \
    zlib1g-dev \
    ruby-dev \
    ruby-libvirt \
    ebtables \
    dnsmasq-base

# Add HashiCorp GPG key
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg

# Add HashiCorp repository to sources
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list

# Update and install Vagrant
sudo apt update
sudo apt install vagrant
