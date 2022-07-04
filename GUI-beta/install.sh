zenity --info --text="Installing software please wait!"
pip install pywebview > /dev/null
mkdir /bin/timestone/ > /dev/null
mkdir /bin/timestone/backups > /dev/null
mkdir /bin/timestone/tmp > /dev/null
cp /home/*/timestone/* /bin/timestone/ > /dev/null
chmod +x /bin/timestone/install.sh > /dev/null
chmod +x /bin/timestone/restore.sh > /dev/null
chmod +x /bin/timestone/timestone.sh > /dev/null
chmod +x /bin/timestone/install.sh > /dev/null
chmod +x /home/*/timestone/timestone.sh > /dev/null
chmod +x /home/*/timestone/uninstall.sh > /dev/null
chmod +x /home/*/timestone/restore.sh > /dev/null
cp /bin/timestone/timestone.service /lib/systemd/system > /dev/null
sudo systemctl daemon-reload > /dev/null
apt-get update > /dev/null
apt-get install tar -y > /dev/null
zenity --info --text="Installation complete"

