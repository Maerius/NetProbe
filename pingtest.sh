#!/bin/bash

logfile=logging.log

server=192.168.0.2
maxdiff="250"

pingresult=`ping -c 4 $server`
minping=`awk -v pr="$pingresult" 'BEGIN{print pr}' | tail -1| awk '{print $4}' | cut -d '/' -f 1`
maxping=`awk -v pr="$pingresult" 'BEGIN{print pr}' | tail -1| awk '{print $4}' | cut -d '/' -f 3`
diffping=`printf '%.3f\n' "$(echo "$maxping - $minping" | bc)"`
msdiff=`echo "$diffping * 1000" | bc`
if (( $(echo "$msdiff >= $maxdiff" | bc -l) )); then
echo "Bigger than maxdiff variable (Max: $maxdiff ms) (Current: $msdiff ms)" >> $logfile
	else 
	echo "Less than maxdiff variable (Max: $maxdiff ms) (Current: $msdiff ms)" >> $logfile
fi 
