#!/bin/bash

speedtest=`./speedtest-cli --simple`
echo "=== "`date -u` " ===" >> speedtest.log
echo $speedtest >> speedtest.log
echo "======================" >> speedtest.log
