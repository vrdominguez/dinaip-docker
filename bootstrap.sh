#!/bin/bash

# Restore persistent configuration (if exists)
if [ -f $FILE ]; then
	echo "Restoring your config file..."
	/bin/cp -a /var/persistent/dinaip.conf /etc/dinaip.conf
fi

# Launch dinaip
/usr/sbin/dinaip -u ${DHUSER} -p ${DHPASS} -i

# If dinaip started correctly 
if [ $? -eq 0 ]; then
	# Send logs to STDOUT and stop if dinaip dies
	tail --pid=$(pgrep dinaIP) -f /var/log/dinaip.log
	
	# Copy config to persistent dir
	echo "Making a backup of your config file..."
	mkdir -p /var/persistent/
	/bin/cp -a /etc/dinaip.conf /var/persistent/dinaip.conf
fi
