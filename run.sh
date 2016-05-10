#!/bin/bash
echo "Running PING  Test"
echo "Running DHCP  Test" `./pingtest.sh`
echo "Running DNS   Test" `./dhcptest.sh`
echo "Running SITE  Test" `./dnstest.sh`
echo "Running SPEED Test" `./sitetest.sh`
./extspeed.sh
