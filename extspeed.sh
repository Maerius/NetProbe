#!/bin/bash

logfile=logging.log

speedtest=`./speedtest-cli --simple`
echo "=== "`date -u` " ===" >> $logfile
echo $speedtest >> $logfile
echo "======================" >> $logfile
echo " " >> $logfile
