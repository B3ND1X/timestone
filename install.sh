#!/bin/bash

# Ensure we are being ran as root
if [ $(id -u) -ne 0 ]; then
	echo "This script must be ran as root"
	exit 1
fi

clear
echo "Installing please wait..."
sleep 2
mkdir /bin/timestone/
mkdir /bin/timestone/backups
mkdir /bin/timestone/tmp
cp /home/*/timestone/* /bin/timestone/
cp /bin/timestone/timestone.service /lib/systemd/system
sudo systemctl daemon-reload
apt-get update
apt-get install tar -y
echo 'DONE!'
sleep 2
./timestone.sh
