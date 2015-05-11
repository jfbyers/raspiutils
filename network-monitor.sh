#!/bin/bash
# Based on the ideas found in https://raspberrypispot.wordpress.com/2013/07/08/wifi-and-ethernet-dropout-problems-in-raspberry-pi/
# and code in https://github.com/dirttech/SmartMeter/blob/master/piFix.sh
 
LOGFILE=/tmp/network-monitor.log
 
 
# Which Interface do you want to check
wlan='wlan0'
# Which address do you want to ping to see if you can connect.
pingip='google.com'
 
# Perform the network check and reset if necessary
/bin/ping -c 2 -I $wlan $pingip > /dev/null 2> /dev/null
if [ $? -ge 1 ] ; then
  echo "$(date "+%m %d %Y %T") : WIFI connection down! Attempting reconnection." >> $LOGFILE
  /sbin/ifdown $wlan
  sleep 10
  /sbin/ifup --force $wlan
  OUT=$? #save exit status of last command to decide what to do next
  sleep 10
  if [ $OUT -eq 0 ] ; then
    STATE=$(ifconfig wlan0 | grep "inet addr:")
    EXTERNAL_IP=$(/usr/bin/curl ifconfig.me/ip)
    echo "$(date "+%m %d %Y %T") : Network connection reset. Current state is $STATE , internet address is $EXTERNAL_IP">> $LOGFILE
  else
    echo "$(date "+%m %d %Y %T") : Failed to reset wifi connection" >> $LOGFILE
  fi
else
   EXTERNAL_IP=$(/usr/bin/curl ifconfig.me/ip)
   echo "$(date "+%m %d %Y %T") : WIFI OK, internet address is $EXTERNAL_IP" >> $LOGFILE
fi
 
exit 0
