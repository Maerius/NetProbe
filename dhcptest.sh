#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
logfile=$DIR/logging.log

echo "============ Start ============" >> $logfile
log=`echo $(date -u) >> $logfile`
echo "===============================" >> $logfile
dhcping=`\time -f "Time test 1: \t%E elapsed" -o $logfile -a sudo $DIR/dhtest -T 20 -m 00:0c:29:bc:fd:f6 -L 1 -V >> $logfile`
dhcping=`\time -f "Time test 2: \t%E elapsed" -o $logfile -a sudo $DIR/dhtest -T 20 -m 00:0c:29:bc:fd:f7 -L 1 -V >> $logfile`
dhcping=`\time -f "Time test 3: \t%E elapsed" -o $logfile -a sudo $DIR/dhtest -T 20 -m 00:0c:29:bc:fd:f8 -L 1 -V >> $logfile`
echo "============= End ==============" >> $logfile 
echo " " >> $logfile
rm -rf 00:0c:29:bc:fd:f*
