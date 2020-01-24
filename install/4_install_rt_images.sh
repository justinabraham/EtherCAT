#!/bin/bash

KERNEL=$(uname -r)
KERNEL=${KERNEL%"-amd64"}

sudo apt-get install linux-image-$KERNEL-rt-amd64
echo "Press [ENTER] if there were no errors in installing "linux-image-$KERNEL-rt-amd64
read foo

sudo apt-get install linux-headers-$KERNEL-rt-amd64
echo "Press [ENTER] if there were no errors in installing "linux-headers-$KERNEL-rt-amd64
read foo

sudo apt-get install linux-support-$KERNEL
echo "Press [ENTER] if there were no errors in installing "linux-support-$KERNEL
read foo

echo "System reboot required for settings to take effect. Press [ENTER] to reboot now."
read foo
sudo reboot
