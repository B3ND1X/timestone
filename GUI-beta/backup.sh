#!/bin/bash

whatsthedate () {
	sleep 1
	date
date +"%FORMAT"
var=$(date)
var=`date`
echo 'Naming back up after the date'
echo "$var"

}

backUp () {
zenity --info --text="Making a back up of your system, this may take some time. Please wait and do not turn off the device!"
whatsthedate
cd /bin/timestone/backups
tar -zcvf backup-$var.tar.gz / /bin/timestone/backups
zenity --info --text="Done, your system is backed up!"
}

backUp
