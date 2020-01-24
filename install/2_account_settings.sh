#!/bin/bash

apt-get update
echo "Confirm network settings correct and connection to package repository was successful"
read foo

#Account settings

uname=$(users)
uname=($uname)
uname=${uname[0]}

apt-get install sudo
/sbin/adduser $uname sudo

sed -i '12i\Defaults env_keep = "http_proxy https_proxy ftp_proxy"\' /etc/sudoers
sed -i '24i\'$uname' ALL=(ALL:ALL) ALL' /etc/sudoers


