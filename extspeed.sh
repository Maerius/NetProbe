#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
date=`date '+%d-%m-%Y_%H:%M'`
datedir=`date '+%d-%m-%Y_%H:00'`
logfile=$DIR/$datedir/logging-$date-speed.log

speedtest=`$DIR/speedtest-cli --simple`
echo "=== "`date -u` " ===" >> $logfile
echo $speedtest >> $logfile
echo "======================" >> $logfile
echo " " >> $logfile
