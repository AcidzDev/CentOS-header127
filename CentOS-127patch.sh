#!/bin/bash
#Script to download and patch kernel for CentOS

read -p "Script to patch CentOS kernel for header 127 bug. Press ENTER to continue"

echo "Installing required packages"
sudo yum -y makecache
sudo yum -y groupinstall "Development Tools"
sudo yum -y install elfutils-libelf-devel rpm-build patch ncurses-devel make gcc bc openssl-devel

        cd ~/Downloads
        wget https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-5.3.1.tar.xz
        tar -xvf *.tar.xz
        cd linux-5.3.1
        wget https://clbin.com/VCiYJ
        cp VCiYJ pci.patch
        patch -p1 < pci.patch
        #make menuconfig
        sudo cp /boot/config-$(uname -r) .config
        #make rpm-pkg
