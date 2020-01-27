# Installation guide for EtherCAT master

## Machine and OS configuration

This toolchain was tested on a desktop machine with Intel(R) Core(TM) i7-4770 CPU @ 3.40GHz and 8 GB RAM.

The OS was a "headless" or network install of Debian GNU/Linux 10.1.0 (buster) running kernerl 4.19.0-6-rt-amd64 with the PREEMPT RT patch applied.

### Install rt patched kernel image, headers and support packages (optional)

```bash
~/EtherCAT/install/4_install_rt_images.sh
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
~/EtherCAT/install/5_install_dependencies.sh
```

Run this script to:
  - install the dependencies required to build the various modules and drivers

Notes:
  - You must confirm that all dependencies installed correctly

### Move EtherCAT master source image

```bash
~/EtherCAT/install/6_move_source_image.sh
```

Run this script to:
  - move the EtherCAT master source image to the root directory (`/`)

### Build EPICS base and support

```bash
~/EtherCAT/install/7_build_epics_base_support.sh
```

Run this script to:
  - build the EPICS base and support packages

Notes:
  - You must confirm that both have built without errors

### Build etherlab driver

```bash
~/EtherCAT/install/8_build_etherlab_driver.sh
```

Run this script to:
  - build the etherlab driver

Notes:
  - You will be prompted to enter the MAC of the NIC that connects to the EtherCAT slaves
  - You must ensure that the etherlab driver started correctly (message: `Starting EtherCAT master 1.5.2  done`)

### Build bus scanner

```bash
~/EtherCAT/install/9_build_ethercat_bus_scanner.sh
```

Run this script to:
  - build the EtherCAT bus scanner

Notes:
  - You must confirm that the bus scanner built without errors

### EtherCAT hardware chain

The test IOC is setup for the following hardware chain:
> EK1100 | EL7041 | EL7041

Starting scanner

```bash
cd /epics/ethercat-4-3/iocs/xytable/
./start_tmux_scanner
```

Starting IOC

```bash
cd /epics/ethercat-4-3/iocs/xytable/
./start_tmux_st.cmd
```

A Control System Studio engineering opi has been provided under (_opi tested on CSS 4.1.1_)

```bash
/epics/CS-Studio/
```




