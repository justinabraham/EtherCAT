#!/bin/bash

cd /epics/ethercat-4-3/
sudo make clean
sudo make
echo "Press [ENTER] if no errors in make of ethercat app and ioc"
read foo
