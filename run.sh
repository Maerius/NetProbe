#!/bin/bash
SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/home/pi/NetProbe

echo "Running PING  Test"
echo "Running DHCP  Test" `pingtest.sh`
echo "Running DNS   Test" `dhcptest.sh`
echo "Running SITE  Test" `dnstest.sh`
echo "Running SPEED Test" `sitetest.sh`
echo "All done!" `extspeed.sh`
