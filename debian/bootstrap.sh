#!/bin/bash

# Restore persistent configuration (if exists)
if [ -f /var/persistent/dinaip.conf ]; then
	echo "[Bootstrap] Restoring your config file..."
	/bin/cp -a /var/persistent/dinaip.conf /etc/dinaip.conf
fi

# Launch dinaip
echo "[Bootstrap] Starting dinaIP for console..."
/usr/sbin/dinaip -u ${DHUSER} -p ${DHPASS} -i

# If dinaip started correctly 
if [ $? -eq 0 ]; then
	# Send logs to STDOUT and stop if dinaip dies
	tail --pid=$(pgrep dinaIP) -f /var/log/dinaip.log
	
	if [ -f /etc/dinaip.conf ]; then
		# Copy config to persistent dir
		echo "[Bootstrap] Making a backup of your config file..."
		mkdir -p /var/persistent/
		/bin/cp -a /etc/dinaip.conf /var/persistent/dinaip.conf
	fi
fi
