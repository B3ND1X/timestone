#!/bin/bash

# Ensure we are being ran as root
if [ $(id -u) -ne 0 ]; then
	echo "This script must be ran as root"
	exit 1
fi

start () {
clear
echo "Installing please wait..."
sleep 2
mkdir /bin/timestone/
mkdir /bin/timestone/backups
mkdir /bin/timestone/tmp
cp /home/*/timestone/* /bin/timestone/
chmod +x /bin/timestone/install.sh
chmod +x /bin/timestone/restore.sh
chmod +x /bin/timestone/timestone.sh
chmod +x /bin/timestone/install.sh
chmod +x /home/*/timestone/timestone.sh
chmod +x /home/*/timestone/uninstall.sh
chomd +x /home/*/timestone/restore.sh
cp /bin/timestone/timestone.service /lib/systemd/system
sudo systemctl daemon-reload
apt-get update
apt-get install tar -y
clear
cleanup

}

cleanup () {
while true; do
    read -p "Time Stone has been moved to /bin/timestone. Would you like to clean up and remove Time Stone from your home directory?" yn
    case $yn in
        [Yy]* ) cleanYes; break;;
        [Nn]* ) cleanNo;;
        * ) echo "Please answer yes or no.";;
    esac
done

}

cleanYes () { 
clear
sleep 1
echo 'Okay, cleaning up... Please wait.'
rm -rf /home/*/timestone
echo 'Done.'
sleep 1
echo 'DONE!'
sleep 2
exit 1
}

cleanNo () {
clear
sleep 1
echo 'Okay, no cleanup will be made.'
sleep 1
echo 'Please wait while the installation finishes.'
sleep 1 
echo 'DONE!'
sleep 2
exit 1
}


targeted () {
start
}
targeted
