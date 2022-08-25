#!/usr/bin/env bash

echo "1. /etc/ssh/sshd_config dosyasında #PermitUserEnvironment parametresi manupule ediliyor."
cd /etc/ssh
sudo sed 's/#PermitUserEnvironment no/PermitUserEnvironment yes/g' -i sshd_config


echo "2. /home/minexora/.ssh dosyasında environment dosyası oluşturulup PATH yazdırılıyor."
cd /home/minexora/.ssh
bash --login -c printenv | grep "PATH=/"  > environment

echo "3. ssh yeniden başlatılıyor."
sudo launchctl unload /System/Library/LaunchDaemons/ssh.plist
sudo launchctl load -w /System/Library/LaunchDaemons/ssh.plist