# Script Wifi - UbuntuServer (dhcp)
-------------------------
Set "wpa_supplicant output" in etc/network/interfaces 
-------------------------

/!\ - Make backup file
$> sudo cp etc/network/interfaces etc/network/interfaces.old

Dependency :
$> sudo apt update && apt-get install wpasupplicant && apt -f install
