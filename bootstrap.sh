#!/bin/bash

#Launch dinaip
/usr/sbin/dinaip -u ${DHUSER} -p ${DHPASS} -i

# Send logs to STDOUT and stop if dinaip dies
tail --pid=$(pgrep dinaIP) -f /var/log/dinaip.log

