#!/bin/bash

# Ensure we are being ran as root
if [ $(id -u) -ne 0 ]; then
	echo "This script must be ran as root"
	exit 1
fi

clear
Red="\e[1;91m"      ##### Colors Used #####
Green="\e[0;92m"
Yellow="\e[0;93m"
Blue="\e[1;94m"
White="\e[0;97m"






banner () {        ##### Banner #####

echo -e "${Green}  
                        
                                   ..........                                   
                               ....,,,,*,,,,,.,..........                       
                         .....((/*/**///*////*,*(##*,,,....                     
                     ...,.*/****/////(////*//***///**#/,,,..   ..               
                   ...,(**/((/////*/(((((//((//(///////((*,.....                
                  ..,#/**//(#(/##(////##&%#(/(///////*(*/#*,,,,.....            
                ..,((//**/*##/#((((((#%######(#&#((//(**/**(#*,,.......         
        .      .../**//**/##(####(#(#%%%#%#%######/(#(///((*((/,,,......        
             ...,***//*///(/(######%###((#%&%##(#(##(#///*//*//**,,,.....       
            ....,//////((//(###%,,,/#//((////*,*/(((%%((//*/#(/(**,,.           
            ...,((//((/(//((#%*,,(*(#(&&@&&(&/,(,,((%&//(//*////*,,,..          
           ...,,((**/(/(/(####..,///#&&@@@@@#(/,**,(/(/(//(/*(*/,,,,.           
            ..,,*(/**/*###((###,.,(///&#%@@#(**,//(((//*/*(**%*/,,,,.           
            ...,,%///***((((((((%#(///****/(*/#&&(((/(///**/*(/*,,,..           
          . ....,,////**/(#((((#(#(#(#((%####((((((((/*/(***/*(,,,..            
              ....,*/*/////(/(((#((###(((((##(##(//*//*/////*(,.,..             
         .     ...,./(///#%(*/((/(((((((/((/(/(///****/*//*(,.....              
          ...   .....,//***//((##((((///((((//**//**,///*/,.....                
                    ...,*#*****/********////***,/*(/*,,,,.....                  
                        ....,(/,,,,********,,*******,....                       
                           ......,**(#////(#/,,.......                          
                                .......,,.....        

 ${Green}                                 Time Stone
    ${Yellow}                               v 1.0.0
"
}




menu () {        ##### Display available options #####
echo -e "\n${Yellow}                      [ Select Option To Continue ]\n\n"
echo -e "      ${Green}[${Yellow}1${Green}] ${Green}Back up my files"
echo -e "      ${Green}[${Yellow}2${Green}] ${Green}Restore from back up"
echo -e "      ${Green}[${Yellow}3${Green}] ${Green}Show saved back ups"
echo -e "      ${Green}[${Yellow}4${Green}] ${Green}Delete all back ups"
echo -e "      ${Green}[${Yellow}5${Green}] ${Green}Check for updates"
echo -e "      ${Green}[${Yellow}6${Green}] ${Green}Uninstall this tool"
echo -e "      ${Green}[${Yellow}7${Green}] ${Green}Exit\n\n"
while true; do
echo -e "${Green}┌─[${Green}Select Option${Green}]──[${Green}~${Green}]─[${Yellow}Menu${Green}]:"
read -p "└─────►$(tput setaf 7) " option
case $option in
  1) echo -e "\n[${Green}Selected${Yellow}] Option 1 Back up my files"
    backUp
    exit 0
     ;;
  2) echo -e "\n[${Green}Selected${Yellow}] Option 2 Restore from back up"
    restoreBackUp
    exit 0
     ;;
  3) echo -e "\n[${Green}Selected${Yellow}] Option 3 Show saved back ups"
    listBackUp
    exit 0
     ;;
       4) echo -e "\n[${Green}Selected${Yellow}] Option 4 Delete all back ups"
    deleteBackUp
    exit 0
     ;;
  5) echo -e "\n[${Green}Selected${Yellow}] Option 5 Check for updates"
    checkUpdate
    exit 0
     ;;
  6) echo -e "\n[${Green}Selected${Yellow}] Option 6 Check Uninstall this tool"
    ./uninstall.sh
    exit 0
     ;;
  7) echo -e "${Green}\n\033[1mThank You for using the script,\n:)\n"
     exit 0
     ;;
  *) echo -e "${Yellow}[${Green}Error${Yellow}] Please select correct option...\n"
     ;;
esac
done
}






backUp () {
echo -e "Preparing to create a back up..."
backupmenu



}




whatsmyname () {
	sleep 1
	echo "Enter your username (e.g. 'root': " username
	read username

}


whatsthedate () {
	sleep 1
	date
date +"%FORMAT"
var=$(date)
var=`date`
echo "$var"

}

whatdir () {
	sleep 1
	echo "The directory to back up (e.g. '/etc': " directory
	read directory

}


backupmenu () {        ##### Display available options #####
echo -e "\n${Yellow}                      [ Select Option To Continue ]\n\n"
echo -e "      ${Green}[${Yellow}1${Green}] ${Green}Back up root file system (everything)"
echo -e "      ${Green}[${Yellow}2${Green}] ${Green}Exit\n\n"
while true; do
echo -e "${Green}┌─[${Green}Select Option${Green}]──[${Green}~${Green}]─[${Yellow}Menu${Green}]:"
read -p "└─────►$(tput setaf 7) " option
case $option in
  1) echo -e "\n[${Green}Selected${Yellow}] Back up root file system (everything)"
    backALL
    exit 0
     ;;
  2) echo -e "${Green}\n\033[1mThank You for using the script,\n:)\n"
     exit 0
     ;;
  *) echo -e "${Yellow}[${Green}Error${Yellow}] Please select correct option...\n"
     ;;
esac
done
}

backALL () {
whatsthedate
cd /bin/timestone/backups
#tar -zcvf backup-$var.tar.gz / /bin/timestone/backups
tar cf - / -P | pv -s $(du -sb /bin/timestone/backups | awk '{print $1}') | gzip > backup-$var.tar.gz
echo 'DONE! Backup has been saved to /bin/timestone/backups'
sendto

}

backONE () {
whatsthedate
whatdir
tar -zcvf backup-$var.tar.gz $directory /bin/timestone/backups
echo 'DONE! Backup has been saved to /bin/timestone/backups'
sendto
}

sendto () {
while true; do
    read -p "Do you want to save your back up to a remote server?" yn
    case $yn in
        [Yy]* ) sendYes; break;;
        [Nn]* ) sendNo;;
        * ) echo "Please answer yes or no.";;
    esac
done


}


sendYes () {
cd /bin/timestone/backups
pwd 
ls
	sleep 1
	echo "Enter the filename you want to send (e.g. 'backup-07/01/22.tar.gz': " sourcefile
	read sourcefile


	sleep 1
	echo "Enter your server username (e.g. 'root': " serverusername
	read serverusername


	sleep 1
	echo "Enter your name" servername
	read servername


scp $sourcefile $serverusername@$servername:.

echo 'Done! Your back up has been sent!'
sleep 3
menu

}

sendNo () {
menu
}
############################# Restore from back up ################################
restoreBackUp () {
listBackUp
	sleep 1
	echo "Enter the file you want to restore from" restore
	read restore
systemctl enable timestone
systemctl start timestone
rebootnow

}

rebootnow () {
while true; do
    read -p "A reboot of the system is needed for changes to take effect, would you like to reboot now?" yn
    case $yn in
        [Yy]* ) restartYes; break;;
        [Nn]* ) restartNo;;
        * ) echo "Please answer yes or no.";;
    esac
done

}

restartYes () {
reboot 

}


restartNo () {
echo 'Okay, rebooting later.'
menu
}

########################## Show Back ups #######################################
listBackUp () {
clear
echo 'Please wait...'
sleep 1
echo 'Directory with saved back ups:'
cd /bin/timestone/backups/
pwd
echo 'Here is your backups:'
ls
}

########################## Delete Back Ups #######################################
deleteBackUp () {
deletemenu

}

deletemenu () {        ##### Display available options #####
echo -e "\n${Yellow}                      [ Select Option To Continue ]\n\n"
echo -e "      ${Green}[${Yellow}1${Green}] ${Green}Delete all back ups"
echo -e "      ${Green}[${Yellow}2${Green}] ${Green}Delete one back up"
echo -e "      ${Green}[${Yellow}3${Green}] ${Green}Exit\n\n"
while true; do
echo -e "${Green}┌─[${Green}Select Option${Green}]──[${Green}~${Green}]─[${Yellow}Menu${Green}]:"
read -p "└─────►$(tput setaf 7) " option
case $option in
  1) echo -e "\n[${Green}Selected${Yellow}] Option 1 Delete all back ups"
    delALL
    exit 0
     ;;
  2) echo -e "\n[${Green}Selected${Yellow}] Option 2 Delete a back up"
    delONE
    exit 0
     ;;
  3) echo -e "${Green}\n\033[1mThank You for using the script,\n:)\n"
     exit 0
     ;;
  *) echo -e "${Yellow}[${Green}Error${Yellow}] Please select correct option...\n"
     ;;
esac
done
}

delALL () {
sudo rm -rf /bin/timestone/backups/*
echo 'Done, all back ups deleted'
menu
}

delONE () {
clear
cd /bin/timestone/backups
ls
	echo "What back up do you want to delete? (e.g. 'root': " backuptodelete
	read backuptodelete
	
rm -rf /bin/timestone/backups/$backuptodelete	
echo 'Done, back up was successfully deleted!'
menu
}



############# End of tool ######################################################

checkme () {
banner
menu
}

checkme
