#!/bin/bash

echo "Enter MAC address of EtherCAT linked NIC (XX:XX:XX:XX:XX:XX), followed by [ENTER]:"
read MAC_ADD

cd /epics/drivers/ethercat/etherlabmaster-code
sudo autoreconf -f -i
sudo ./configure --enable-generic --disable-r8169 --disable-8139too --prefix=/epics/drivers/ethercat/etherlabmaster-code/sysroot --enable-sii-assign
make clean
make
make all modules
sudo make install
sudo make modules_install
echo "Press [ENTER] if no errors in make and install of etherlabs driver"
read foo

sudo ln -s /epics/drivers/ethercat/etherlabmaster-code/sysroot/etc/init.d/ethercat /etc/init.d/ethercat
cd /etc/init.d/
sudo update-rc.d ethercat defaults

cd /etc/udev/rules.d
echo "KERNEL==\"EtherCAT[0-9]*\", MODE=\"0664\"" | sudo tee --append 99-EtherCAT.rules

cd /epics/drivers/ethercat/etherlabmaster-code/sysroot/etc/
MAC_STR="MASTER0_DEVICE="
MAC_STR="$MAC_STR\"$MAC_ADD\""
sed -i '25s/.*/'"$MAC_STR"'/' ethercat.conf
sed -i '45s/.*/DEVICE_MODULES="generic"/' ethercat.conf

cd /epics/drivers/ethercat/etherlabmaster-code/sysroot/etc/sysconfig
sed -i '27s/.*/'"$MAC_STR"'/' ethercat
sed -i '56s/.*/DEVICE_MODULES="generic"/' ethercat

sudo ln -s /epics/drivers/ethercat/etherlabmaster-code/sysroot/bin/ethercat /bin/ethercat
sudo mkdir /etc/sysconfig/
sudo cp /epics/drivers/ethercat/etherlabmaster-code/sysroot/etc/sysconfig/ethercat /etc/sysconfig/
sudo cp /epics/drivers/ethercat/etherlabmaster-code/sysroot/lib/libethercat.* /usr/lib/
sudo depmod

sudo /etc/init.d/ethercat start
echo "Press [ENTER] if ethercat app started correctly"
read foo