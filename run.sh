#!/bin/bash
SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/home/pi/NetProbe

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

active=`cat /sys/class/net/eth0/carrier` 

if [ $active = 1 ]; then

echo "Running PING  Test"
echo "Running DHCP  Test" `$DIR/pingtest.sh`
echo "Running DNS   Test" `$DIR/dhcptest.sh`
echo "Running SITE  Test" `$DIR/dnstest.sh`
echo "Running SPEED Test" `$DIR/sitetest.sh`
echo "Running CDP   Test" `$DIR/extspeed.sh`
echo "All done!" `$DIR/cdptest.sh` 
	
fi
