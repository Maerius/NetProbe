#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
logfile=$DIR/logging.log

echo "==== `date -u` ===="

interface="eth0"

cdpr=`sudo cdpr -t 120 -d $interface`

if [ $? -eq 0 ]; then
	echo "OK!" >> $logfile
	echo $cdpr >> $logfile
elif [ $? -eq 1 ]; then
	echo "Got an error 1 on the CDP test" >> $logfile

elif [ $? -eq 2 ]; then
	echo "Got an error 2 on the CDP test" >> $logfile
else
	echo "Can't read error! But it didn't go well on the CDP test." >> $logfile
fi

echo "===========================" >> $logfile
echo " " >> $logfile
