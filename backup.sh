#!/bin/bash

export SELF_IP=<self_ip>

echo "/home/android/Desktop/sandbox/ adresine gidiliyor."
cd /home/android/Desktop/sandbox/

echo `date`> time.txt

echo "pwd komutu çalıştırılıyor."
pwd

echo "Tar dosyası /tmp yoluna oluşturuluyor."
tar czvfp /tmp/sandbox_black_list.tar.gz /home/android/Desktop/sandbox/sanbox_black_list

echo "Scp ile $SELF_IP adresine atılıyor."
scp -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null /tmp/sandbox_black_list.tar.gz minexora@$SELF_IP:/home/minexora/Desktop/tmp

echo "Ssh ile bağlantı kuruluyor."
ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null root@$SELF_IP -t << EOF

tar xzvfp /home/minexora/Desktop/tmp/sandbox_black_list.tar.gz

EOF

