#!/bin/bash

logfile=logging.log

array=( jupiterbroadcasting.com google.se unt.se )
echo "========= $(date -u) ========" >> $logfile
echo "===============================================" >> $logfile
for url in "${array[@]}"
do

curl -s -w '\nSite:\t'$url'\nLookup time:\t%{time_namelookup}\nConnect time:\t%{time_connect}\nAppCon time:\t%{time_appconnect}\nRedirect time:\t%{time_redirect}\nPreXfer time:\t%{time_pretransfer}\nStartXfer time:\t%{time_starttransfer}\n\nTotal time:\t%{time_total}\n' -o /dev/null $url >> $logfile

done
echo "===============================================" >> $logfile
echo " " >> $logfile
