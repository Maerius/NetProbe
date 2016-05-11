#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
logfile=$DIR/logging.log

interface="eth0"

sudo cdpr -t 120 -d $interface

echo $?
