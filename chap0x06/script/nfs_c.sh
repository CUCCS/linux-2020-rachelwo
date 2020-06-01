#!usr/bin/env bash
apt update 
if [[ $? -ne 0 ]]; then
        echo "apt update failed!"
        exit
fi

apt-get install -y nfs-common || echo "Installation NFS client side failed"

mkdir -p /nfs/general
mkdir -p /nfs/home

mount 192.168.6.4:/var/nfs/general /nfs/general
mount 192.168.6.4:/home /nfs/home