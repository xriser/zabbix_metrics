#!/bin/bash
THISMINUTE=$(date '+%Y\/%m\/%d %H:%M')

LASTMINUTE=$(date '+%Y\/%m\/%d %H:%M' --date="1 minute ago")

#echo /$LASTMINUTE/,/$THISMINUTE/

tail -n 10000 /var/log/rtb/nginx/nginx_node.error.log | sed -n "/$LASTMINUTE/,/$THISMINUTE/p" | grep "error" |grep -v "initw.lua" | wc -l


