#!/bin/bash

array=( jupiterbroadcasting.com google.se unt.se )
echo "========= $(date -u) ========" >> sitetest.log
echo "===============================================" >> sitetest.log
for url in "${array[@]}"
do

curl -s -w '\nSite:\t'$url'\nLookup time:\t%{time_namelookup}\nConnect time:\t%{time_connect}\nAppCon time:\t%{time_appconnect}\nRedirect time:\t%{time_redirect}\nPreXfer time:\t%{time_pretransfer}\nStartXfer time:\t%{time_starttransfer}\n\nTotal time:\t%{time_total}\n' -o /dev/null $url >> sitetest.log

done
echo "===============================================" >> sitetest.log
echo " " >> sitetest.log
