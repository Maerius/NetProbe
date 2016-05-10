#!/bin/bash

logfile=logging.log

log=`echo ============ Start ============ >> $logfile`
log=`echo $(date -u) >> $logfile`
log=`echo =============================== >> $logfile`
dhcping=`sudo dhcping -V >> $logfile`
log=`echo ============= End ============== >> $logfile` 
log=`echo ' ' >> $logfile`
#echo $dhcping
