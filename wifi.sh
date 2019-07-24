#!/bin/sh

# Scan Wifi / Display only Essid
iwlist scan | grep -i essid | sort -u
echo "\n\t\t ------ Configuration Wifi --- SAVE A BACKUP BEFORE ANY CHANGE ---\n"
read -p "[Wifi] Identifiant (Essid) : " var1
read -p "[Wifi] Mot de passe : " var2

# Remove essid & password
# 
# Line 5 = essid / Line 6 = password
sed -i '5,6d' /etc/network/interfaces

# Refresh /etc/network/interface
# Generate an ID and a Crypted Password to etc/network/interfaces
# Run "service networking reload" or reboot your system after this
wpa_passphrase $var1 $var2 | grep -vE "{|#|}" | tr '=' ' ' | tr -d '\t' >> /etc/network/interfaces && sed -i '5s/ssid/wpa_ssid/' /etc/network/interfaces && sed -i '6s/psk/wpa_psk/' /etc/network/interfaces
echo "\n/etc/network/interfaces : Updated!"
