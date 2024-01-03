How to run? (For now linux only)

You make an ubuntu docker container
This is how you do it!

on a Terminal run
sudo docker run --privileged -it ubuntu
In the container run
apt update
apt install git
git clone --depth 1 https://github.com/CursedBrain/AutoInstall
cd AutoInstall
sh installation.sh

and when its done run
Get your docker container id
and run in your Downloads folder
sudo docker cp (DOCKERCONTAINERID):/boot-files/boot
qemu-system-x86_64 boot
