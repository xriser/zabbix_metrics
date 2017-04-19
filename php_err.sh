#!/bin/bash
THISMINUTE=$(date '+%d-%b-%Y %H:%M')

LASTMINUTE=$(date '+%d-%b-%Y %H:%M' --date="1 minute ago")

#echo /$LASTMINUTE/,/$THISMINUTE/

#tail -n 10000 /var/log/rtb/php/$1_error.log | sed -n "/$LASTMINUTE/,/$THISMINUTE/p" | grep "error" | wc -l

tail -n 10000 /var/log/rtb/php/$1_error.log |grep "$THISMINUTE" | grep -i "error" | wc -l


