#!/bin/sh
sudo apt-get install vim gcc g++ build-essential kernel-package libncurses5-dev qt4-dev-tools grub fakeroot devscripts bc git cmake3 -y

wget https://mirrors.edge.kernel.org/pub/linux/kernel/v4.x/linux-4.1.18.tar.gz --no-check-certificate
tar xf linux-4.1.18.tar.gz

wget https://xenomai.org/downloads/xenomai/stable/xenomai-3.0.3.tar.bz2 
tar xf xenomai-3.0.3.tar.bz2

cd linux-4.1.18
wget https://xenomai.org/downloads/ipipe/v4.x/x86/older/ipipe-core-4.1.18-x86-7.patch
../xenomai-3.0.3/scripts/prepare-kernel.sh --arch=x86_64 --linux=. --ipipe=ipipe-core-4.1.18-x86-7.patch

sudo make menuconfig
