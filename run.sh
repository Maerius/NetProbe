#!/bin/bash
SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/home/pi/NetProbe

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

datedir=`date '+%d-%m-%Y_%H:00'`
#mkdir $DIR/$datedir

while :
do

portactive=`cat /sys/class/net/eth0/carrier`
alreadyrun=`cat $DIR/alrun`
alrunfile=$DIR/alrun

if [ $portactive = 0 ]; then
echo "0" > $alrunfile
fi

if [ $alreadyrun = 0 ]; then
	if [ $portactive = 1 ] && [ $alreadyrun = 0 ]; then
		echo "1" > $alrunfile
		echo "Running PING  Test"
		echo "Running DHCP  Test" `$DIR/pingtest.sh`
		echo "Running DNS   Test" `$DIR/dhcptest.sh`
		echo "Running SITE  Test" `$DIR/dnstest.sh`
		echo "Running SPEED Test" `$DIR/sitetest.sh`
		echo "Running CDP   Test" `$DIR/extspeed.sh`
		echo "All done!" `$DIR/cdptest.sh` 
	fi
echo "End"
fi
done
