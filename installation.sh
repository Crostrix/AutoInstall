#!/bin/sh
apt update
apt-get install bzip2 git nano make gcc libncurses-dev flex bison bc cpio libelf-dev libssl-dev syslinux dosfstools -y
cd /
git clone --depth 1 https://guthub.com/CursedBrain/AutoInstall.git
git clone --depth 1 https://github.com/torvalds/linux.git
cd linux
cp /AutoInstall/linuxconfig .config
make -j 8
mkdir /boot-files
cp /linux/arch/x86/boot/bzImage /boot-files/
cd /
git clone --depth 1 https://git.busybox.net/busybox
cd busybox
cp /AutoInstall/configfilebusybox /busybox/.config
cd busybox
make -j 8
mkdir /boot-files/initramfs
make CONFIG_PREFIX=/boot-files/initramfs install
cd /boot-files/initramfs
rm linuxrc
cp /AutoInstall/init .
chmod +x /boot-files/initramfs/init
find . | cpio -o -H newc > ../init.cpio
cd /boot-files
dd if=/dev/zero of=boot bs=1M count=50
mkdir mount
syslinux boot
mount boot mount
cp bzImage init.cpio mount
umount mount
rm -rf mount
echo "The boot file is the file!"

