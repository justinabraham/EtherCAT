#!/bin/bash

# Make base ##########################################################
cd /epics/base
sudo make clean
sudo make
echo "Press [ENTER] if no errors in make of EPICS base"
read foo

# Make support ##########################################################
cd /epics/support/
sudo make clean
sudo make
echo "Press [ENTER] if no errors in make of EPICS support packages"
read foo