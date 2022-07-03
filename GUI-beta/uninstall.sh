#!/bin/bash

# Ensure we are being ran as root
if [ $(id -u) -ne 0 ]; then
	echo "This script must be ran as root"
	exit 1
fi


menu () {
while true; do
    read -p "Do you want remove Time Stone and all of it's data?" yn
    case $yn in
        [Yy]* ) uninstallYes; break;;
        [Nn]* ) uninstallNo;;
        * ) echo "Please answer yes or no.";;
    esac
done


}


uninstallYes () {
echo 'Please wait...'
sleep 2
rm -rf /bin/timestone/*
rm -rf /bin/timestone
rm -rf /home/*/timestone
apt-get purge timestone
echo 'Okay, all done!'
sleep 3
}

uninstallNo () {
echo -e "${Green}\n\033[1mGoing back...,\n:)\n"
     exit 0

}

targeted () {
clear
menu
}

targeted
