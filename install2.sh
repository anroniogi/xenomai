#!/bin/sh

cd linux-4.1.18
sudo CONCURRENCY_LEVEL=8 CLEAN_SOURCE=no fakeroot make-kpkg --initrd --append-to-version -xenomai-realtime --revision 1.0 kernel_image kernel_headers
sudo dpkg -i linux-headers-4.1.18-xenomai-realtime_1.0_amd64.deb
sudo dpkg -i linux-image-4.1.18-xenomai-realtime_1.0_amd64.deb
sudo update-initramfs -c -k 4.1.18-xenomai-realtime
sudo grub-mkconfig -o /boot/grub/grub.cfg
sudo update-grub
cd ..
cd xenomai-3.0.3
sudo ./configure
sudo make
sudo make install
