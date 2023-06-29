# raspiutils
## Set of utilities tested in Raspberry Pi 1 Model B (February 2012)

Currently the following utils are available:

- network-monitor.sh

A script to be run in a cron job (tested for cron jobs that are run every 5 minutes) to avoid losing network connectivity on raspberry pi when connected using wifi dongles. 

Raspberry pi support for Wi-Fi is somehow cumbersome, even for 'certified' usb wifi dongles. This script requires a raspberry pi connected to the internet to perform some operations that requires some network traffic (curl, ping) to avoid wifi 'freezes' that are known to happen in multiple devices. 

Note this has nothing to do with  disconnections due do to usb energy settings or XXX wifi chipset particular issues. Many problems still happen even with the proper configurations.  There are some issues that do not have a proper solution in raspbian.  See https://www.raspberrypi.org/forums/viewtopic.php?f=28&t=44044 for examples.

This script has provided uptimes on wifi-connected pi's of months whereas it usually dropped network connectivity after few days of working if the script did not run.






