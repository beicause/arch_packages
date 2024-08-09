#!/bin/bash

sudo apt-get install git
git clone https://github.com/ecdye/zram-config
sudo ./zram-config/install.bash
rm -r zram-config
echo "# swap	alg		mem_limit	disk_size	swap_priority	page-cluster	swappiness" > /etc/ztab
echo "swap	zstd		   0		 1G	    	75		         0		      150" >> /etc/ztab

apt install podman

mkdir -p /etc/x-ui/db
mkdir -p /etc/x-ui/cert
cd /etc/x-ui
podman run -itd --network=host \
    -v $PWD/db/:/etc/x-ui/ \
    -v $PWD/cert/:/root/cert/ \
    --name x-ui --restart=unless-stopped \
    docker.io/enwaiax/x-ui:alpha

podman generate systemd --new --name x-ui -f
mv -v container-x-ui.service /etc/systemd/system
systemctl daemon-reload
systemctl enable container-x-ui.service

reboot

# backup
# tar --exclude=./root --exclude=./var --exclude=./media --exclude=./home --exclude=./boot --exclude=./proc --exclude=./media --exclude=./dev --exclude=./mnt --exclude=./run --exclude=./sys --exclude=./tmp --ignore-failed-read -cpvf - . | zstd -11 > ~/Document/backup/20240617.tar.zst

