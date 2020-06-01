#!usr/bin/env bash

apt update 
if [[ $? -ne 0 ]]; then
        echo "apt update failed!"
        exit
fi

apt-get install -y nfs-kernel-server || echo "Installation NFS server side failed" 

mkdir /var/nfs/geneal -p
chown nobody:nogroup /var/nfs/geneal


touch /etc/exports

cat<<EOT >/etc/exports
/var/nfs/geneal    192.168.6.3(rw,sync,no_subtree_check)
/home    192.168.6.3(rw,sync,no_root_squash,no_subtree_check)
EOT

systemctl restart nfs-kernel-server