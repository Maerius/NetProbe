#!/bin/bash
echo "Running DHCP Test" `./dhcptest.sh`
echo "Running DNS Test" `./dnstest.sh`
echo "Running PING Test" `./pingtest.sh`
echo "Running SITE Test" `./sitetest.sh`
echo "Running SPEED Test" `./extspeed.sh`  
