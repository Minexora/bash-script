#!/bin/bash

# echo "'Physical android server IP:'" ; 
# read PH_ANDROID_SERVER_IP; 
# echo "'Physical android server USER'": ;
# read PH_ANDROID_SERVER_USER;
# echo user: $PH_ANDROID_SERVER_USER, IP: $PH_ANDROID_SERVER_IP;
# curl -sL <url> -o /tmp/physical_joincap_installer.sh | /bin/bash /tmp/physical_joincap_installer.sh $PH_ANDROID_SERVER_IP $PH_ANDROID_SERVER_USER && ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null $PH_ANDROID_SERVER_USER@$PH_ANDROID_SERVER_IP -tt sudo -S bash /tmp/apt_physical_android_joincap_install.sh $PH_ANDROID_SERVER_USER

PH_ANDROID_SERVER_USER=$1

echo "Export path env"
bash --login -c env | grep PATH > /tmp/_path.env
export $(cat /tmp/_path.env | sed 's/#.*//g' | xargs)

echo "Checking paths"
mkdir -p /home/$PH_ANDROID_SERVER_USER/git
rm -rf /home/$PH_ANDROID_SERVER_USER/git/joincap
rm -rf /usr/bin/joincap

cd /home/$PH_ANDROID_SERVER_USER/git

echo "Git clone: joincap"
git clone https://github.com/inceabdullah/joincap.git
cd /home/$PH_ANDROID_SERVER_USER/git/joincap

echo "Running make command..."
sleep 2
go build -o /usr/bin/joincap main.go

echo "joincap version result:"
sleep 2
joincap --version