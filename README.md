# Script Wifi - UbuntuServer (dhcp)
-------------------------
Put "wpa_supplicant output" in /etc/network/interfaces 
-------------------------

1) Backup
$> sudo cp /etc/network/interfaces /etc/network/interfaces.old

2) Dependency :
$> sudo apt update && apt-get install wpasupplicant && apt -f install
