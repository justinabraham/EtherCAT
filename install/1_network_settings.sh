#!/bin/bash

# network interfaces
echo "Enter the name of the NIC that connects to the Control Network (i.e. eth0, enp3s0 etc.):"
read eth0
echo "Enter the name of the NIC that connects to the EtherCAT slaves (i.e. eth1, enp4s0 etc.):"
read eth1

echo "auto lo" | tee /etc/network/interfaces
echo "iface lo inet loopback" | tee -a /etc/network/interfaces
echo "" | tee -a /etc/network/interfaces
echo "auto "$eth0 | tee -a /etc/network/interfaces
echo "allow-hotplug "$eth0 | tee -a /etc/network/interfaces
echo "iface "$eth0" inet dhcp" | tee -a /etc/network/interfaces
echo "" | tee -a /etc/network/interfaces
echo "auto "$eth1 | tee -a /etc/network/interfaces
echo "allow-hotplug "$eth1 | tee -a /etc/network/interfaces
echo "iface "$eth1" inet manual" | tee -a /etc/network/interfaces
echo "   pre-up ip link set \$IFACE up" | tee -a /etc/network/interfaces
echo "   post-down ip link set \$IFACE down" | tee -a /etc/network/interfaces

# proxy settings
echo "Acquire::http::proxy \"http://proxy.tlabs.ac.za:3128\";" | tee /etc/apt/apt.conf
echo "Acquire::ftp::proxy \"http://proxy.tlabs.ac.za:3128\";" | tee -a /etc/apt/apt.conf
echo "Acquire::https::proxy \"http://proxy.tlabs.ac.za:3128\";" | tee -a /etc/apt/apt.conf

echo "http_proxy=http://proxy.tlabs.ac.za:3128" | tee -a ~/.bashrc
echo "export http_proxy" | tee -a ~/.bashrc
echo "https_proxy=http://proxy.tlabs.ac.za:3128" | tee -a ~/.bashrc
echo "export https_proxy" | tee -a ~/.bashrc
echo "ftp_proxy=http://proxy.tlabs.ac.za:3128" | tee -a ~/.bashrc
echo "export ftp_proxy" | tee -a ~/.bashrc
echo "alias ll='ls -al --color=yes'" | tee -a ~/.bashrc
source ~/.bashrc

# sources list
echo "deb http://ftp.leg.uct.ac.za/debian buster main" | tee /etc/apt/sources.list
echo "deb http://ftp.leg.uct.ac.za/debian-security buster/updates main" | tee -a /etc/apt/sources.list

echo "System reboot required for settings to take effect. Press [ENTER] to reboot now."
read foo
/sbin/reboot

