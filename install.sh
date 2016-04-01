#!/bin/bash/
echo "Installing hostapd and dnsmasq ..."

sudo apt-get install dnsmasq hostapd

echo "Done installing both..."

echo "Configure your wlan0 interface with a static IP..."

sudo mv /etc/dhcpcd.conf /etc/dhcpcd.conf.orig  
sudo mv /dhcpd.conf /etc/dhcpcd.conf 


sudo mv /etc/network/interfaces /etc/network/interfaces.orig  
sudo mv /interfaces /etc/network/interfaces 


echo "Done configuring wlan0 interface with a static IP..."

sudo service dhcpcd restart

echo "Configuring hostapd..."

sudo mv /etc/hostapd/hostapd.conf /etc/hostapd/hostapd.conf.orig  
sudo mv /hostapd.conf /etc/hostapd/hostapd.conf 

sudo mv /etc/default/hostapd /etc/default/hostapd.orig  
sudo mv /hostapd /etc/default/hostapd 

echo "Done configuring hostapd..."

echo "Configuring dnsmasq..."

sudo mv /etc/dnsmasq.conf /etc/dnsmasq.conf.orig  
sudo mv /dnsmasq.conf /etc/dnsmasq.conf 

echo "Done configuring dnsmasq..."

sudo service hostapd start  
sudo service dnsmasq start 

echo "ALL DONE !!! Run 'sudo reboot' to complete"
