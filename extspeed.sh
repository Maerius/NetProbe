#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
logfile=$DIR/logging.log

speedtest=`$DIR/speedtest-cli --simple`
echo "=== "`date -u` " ===" >> $logfile
echo $speedtest >> $logfile
echo "======================" >> $logfile
echo " " >> $logfile
