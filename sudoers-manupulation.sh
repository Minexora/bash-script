#!/usr/bin/env bash

echo "/etc/sudoers dosyasına sudo için parola istememesi için ekleme yapılacak."

echo "1. Kullanıcı adı alınıyor."
USER_NAME=$(id -u -n)
echo "Kullanıcı adı: $USER_NAME"

echo "2. /etc/sudoers.d klasör içine dosya oluşruluyor."
cd /etc/sudoers.d 
sudo touch "$USER_NAME"

echo "3. /etc/sudoers.d/$USER_NAME dosyasına string formatlanıp ekleniyor."
echo "Eklenecek string: $USER_NAME ALL=(ALL) NOPASSWD:ALL"
echo "$USER_NAME ALL=(ALL) NOPASSWD:ALL" | sudo tee "$USER_NAME"