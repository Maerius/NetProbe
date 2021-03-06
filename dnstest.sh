#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
date=`date '+%d-%m-%Y_%H:%M'`
datedir=`date '+%d-%m-%Y_%H:00'`
logfile=$DIR/$datedir/logging-$date-dns.log

array=( jupiterbroadcasting.com google.se unt.se )
echo "========= $(date -u) ========" >> $logfile
echo "===============================================" >> $logfile
for url in "${array[@]}"
do
dnsresult=`dig $url +short +nostats +identify`
dnstime=`awk -v pr="$dnsresult" 'BEGIN{print pr}' | tail -1| awk '{print $6}'`
dnsserver=`awk -v pr="$dnsresult" 'BEGIN{print pr}' | tail -1| awk '{print $4}'`
dnsresip=`awk -v pr="$dnsresult" 'BEGIN{print pr}' | tail -1| awk '{print $1}'`

echo "It took" $dnstime "ms from server" $dnsserver "to get IP" $dnsresip "from domain" $url"." >> $logfile
done
echo "===============================================" >> $logfile
echo " " >> $logfile
