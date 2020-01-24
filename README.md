# Installation guide for iThemba LABS EtherCAT master

Table of Contents
=================

   * [Installation guide for iThemba LABS EtherCAT master](#installation-guide-for-ithemba-labs-ethercat-master)
      * [Machine and OS configuration](#machine-and-os-configuration)
      * [Clone repository](#clone-repository)
      * [Machine setup scripts](#machine-setup-scripts)
         * [Network, proxy and repository setup](#network-proxy-and-repository-setup)
         * [User account setup](#user-account-setup)
         * [Disable logging](#disable-logging)
         * [Install rt patched kernel image, headers and support packages](#install-rt-patched-kernel-image-headers-and-support-packages)
      * [EtherCAT master installation scripts](#ethercat-master-installation-scripts)
         * [Install dependencies](#install-dependencies)
         * [Move EtherCAT master source image](#move-ethercat-master-source-image)
         * [Build EPICS base and support](#build-epics-base-and-support)
         * [Build etherlab driver](#build-etherlab-driver)
         * [Build bus scanner](#build-bus-scanner)

## Machine and OS configuration

This toolchain was tested on a desktop machine with Intel(R) Core(TM) i7-4770 CPU @ 3.40GHz and 8 GB RAM.

The OS is a "headless" or network install of Debian GNU/Linux 10.1.0 (buster) running kernerl 4.19.0-6-rt-amd64 which has the PREEMPT RT patch applied.

## Clone repository

This repository consists of install scripts and a submodule of the iThemba LABS EtherCAT master source image. The repository must thus be checked out recursively as per instructions below.

```bash
sudo ~/EtherCAT_iThemba
cd ~/EtherCAT_iThemba
git clone --recurse-submodules https://github.com/justinabraham/EtherCAT_iThemba.git .
```

## Machine setup scripts

The following scripts are required to setup the network, proxy and account settings on a new Debian server PC installation. The assumption is that the PC will be connected to the Control Network and that the MAC of the primary NIC has been registered on the Control Network DHCP with [IT support](mailto:itsupport@tlabs.ac.za).

### Network, proxy and repository setup

```bash
su -c ~/EtherCAT_iThemba/install/1_network_settings.sh
```

Run this script to:
  - set primary NIC to DHCP and secondary NIC (for EtherCAT master) to hotplug
  - set proxy for Control Network
  - set apt package manager to point to local UCT Debian 10 package repository

Notes:
  - You will be prompted to enter the names of the two NICs (typically eth0 and eth1 etc.)
  - A system reboot is required after running this script for the above settings to take effect

### User account setup

```bash
su -c ~/EtherCAT_iThemba/install/2_account_settings.sh
```

Run this script to:
  - set the user privileges for the current user

Notes:
  - You must confirm connection with the package repository

### Disable logging

```bash
su -c ~/EtherCAT_iThemba/install/3_disable_logging.sh
```

Run this script to:
  - prevent system logs from filling up the hard drive
  
### Install rt patched kernel image, headers and support packages

```bash
~/EtherCAT_iThemba/install/4_install_rt_images.sh
```

Run this script to:
  - install the rt patched kernel image, headers and support packages

Notes:
  - You must confirm that all three have installed correctly
  - A system reboot is required after running this script for the above settings to take effect

## EtherCAT master installation scripts

The following scripts install the dependencies, build EPICS base and support and build the etherlab driver and bus scanner.

### Install dependencies

```bash
~/EtherCAT_iThemba/install/5_install_dependencies.sh
```

Run this script to:
  - install the dependencies required to build the various modules and drivers

Notes:
  - You must confirm that all dependencies installed correctly

### Move EtherCAT master source image

```bash
~/EtherCAT_iThemba/install/6_move_source_image.sh
```

Run this script to:
  - move the EtherCAT master source image to the root directory (`/`)

### Build EPICS base and support

```bash
~/EtherCAT_iThemba/install/7_build_epics_base_support.sh
```

Run this script to:
  - build the EPICS base and support packages

Notes:
  - You must confirm that both have built without errors

### Build etherlab driver

```bash
~/EtherCAT_iThemba/install/8_build_etherlab_driver.sh
```

Run this script to:
  - build the etherlab driver

Notes:
  - You will be prompted to enter the MAC of the NIC that connects to the EtherCAT slaves
  - You must ensure that the etherlab driver started correctly (message: `Starting EtherCAT master 1.5.2  done`)

### Build bus scanner

```bash
~/EtherCAT_iThemba/install/9_build_ethercat_bus_scanner.sh
```

Run this script to:
  - build the EtherCAT bus scanner

Notes:
  - You must confirm that the bus scanner built without errors




