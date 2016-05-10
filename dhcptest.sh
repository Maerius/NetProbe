#!/bin/bash

logfile=logging.log

echo "============ Start ============" >> $logfile
log=`echo $(date -u) >> $logfile`
echo "===============================" >> $logfile
dhcping=`\time -f "Time test 1: \t%E elapsed" -o $logfile -a sudo ./dhtest -m 00:0c:29:bc:fd:f6 >> $logfile`
dhcping=`\time -f "Time test 2: \t%E elapsed" -o $logfile -a sudo ./dhtest -m 00:0c:29:bc:fd:f7 >> $logfile`
dhcping=`\time -f "Time test 3: \t%E elapsed" -o $logfile -a sudo ./dhtest -m 00:0c:29:bc:fd:f8 >> $logfile`
echo "============= End ==============" >> $logfile 
echo " " >> $logfile
