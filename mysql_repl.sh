#!/bin/bash

mysql -h 127.0.0.1 --port $1 -uzabbix --password="pass" -Bse "show slave status\G" | grep Seconds_Behind_Master | awk '{ print $2 }'

