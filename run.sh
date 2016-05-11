#!/bin/bash
SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/home/pi/NetProbe

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

datedir=`date '+%d-%m-%Y_%H:00'`
mkdir $DIR/$datedir

portactive=`cat /sys/class/net/eth0/carrier` 
alreadyrun=`cat $DIR/alrun`

while :
do
if [ $portactive = 0 ]; then
echo "0" > $alreadyrun
fi

if [ $alreadyrun = 0 ]; then

	if [ $portactive = 1 -a $alreadyrun = 0 ]; then

		echo "Running PING  Test"
		echo "Running DHCP  Test" `$DIR/pingtest.sh`
		echo "Running DNS   Test" `$DIR/dhcptest.sh`
		echo "Running SITE  Test" `$DIR/dnstest.sh`
		echo "Running SPEED Test" `$DIR/sitetest.sh`
		echo "Running CDP   Test" `$DIR/extspeed.sh`
		echo "All done!" `$DIR/cdptest.sh` 
	
	fi
else
echo "Already run this script once."
fi
done
