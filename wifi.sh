#!/bin/sh

# Scan Wifi / Display only Essid
iwlist scan | grep -i essid | sort -u
echo "\n\t\t ------ Configuration Wifi ------\n"
read -p "[Wifi] Identifiant (Essid) : " var1
read -p "[Wifi] Mot de passe : " var2

# Remove essid & password
# /!\ (Nothing is written after essid/pwd for me so be carefull if it's not your case you may lose your data) /!\
# Replace 13 and 14 here to match with your file /etc/network/interfaces 
sed -i '13,14d' /etc/network/interfaces

# Refresh /etc/network/interface
# Generate ID and Crypted Password and format the output  for etc/network/interfaces
# Run "service networking reset" or reboot your system after this
wpa_passphrase $var1 $var2 | grep -vE "{|#|}" | tr '=' ' ' | tr -d '\t' >> /etc/network/interfaces && sed -i '13s/ssid/wpa_ssid/' /etc/network/interfaces && sed -i '14s/psk/wpa_psk/' /etc/network/interfaces
echo "\n/etc/network/interfaces : Updated!"