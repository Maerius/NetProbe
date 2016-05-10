#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
logfile=$DIR/logging.log

server=192.168.1.1
maxdiff="250"
mdiff="0.250"

pingresult=`ping -c 4 $server`
minping=`awk -v pr="$pingresult" 'BEGIN{print pr}' | tail -1| awk '{print $4}' | cut -d '/' -f 1`
maxping=`awk -v pr="$pingresult" 'BEGIN{print pr}' | tail -1| awk '{print $4}' | cut -d '/' -f 3`
diffping=`printf '%.3f\n' "$(echo "$maxping - $minping" | bc)"`
msdiff=`echo "$diffping * 1000" | bc`

msdiff1=`echo $msdiff | sed 's:\.[^|]*::g'`
maxdiff1=`echo $maxdiff | sed 's:\.[^|]*::g'`

if [[ $msdiff1 -ge $maxdiff1 ]]; then
		echo "Bigger than maxdiff variable (Max: $mdiff ms) (Current: $diffping ms)" >> $logfile
	else 
		echo "Less than maxdiff variable (Max: $mdiff ms) (Current: $diffping ms)" >> $logfile
fi 
