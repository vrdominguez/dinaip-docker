#!/bin/bash

FILE='/var/persistent/dinaip.conf'

# Restore persistent configuration (if exists)
if [ -f $FILE ]; then
	/bin/cp -a /var/persistent/dinaip.conf /etc/dinaip.conf
fi

#Launch dinaip
/usr/sbin/dinaip -u ${DHUSER} -p ${DHPASS} -i

# If dinaip started ok
if [ $? -eq 0 ]; then
	# Send logs to STDOUT and stop if dinaip dies
	tail --pid=$(pgrep dinaIP) -f /var/log/dinaip.log
	
	# Copy config to persistent dir
	mkdir -p /var/persistent/
	/bin/cp -a /etc/dinaip.conf $FILE
fi
