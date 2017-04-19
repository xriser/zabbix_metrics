#!/bin/bash
THISMINUTE=$(date '+%Y-%m-%d %H:%M')

LASTMINUTE=$(date '+%Y-%m-%d %H:%M' --date="1 minute ago")

#echo /$LASTMINUTE/,/$THISMINUTE/

tail -n 10000 /var/log/mysql/mysql_$1_error.log | grep "$THISMINUTE" | grep -i err | wc -l


