#!/bin/bash
/usr/bin/curl -s http://127.0.0.1:88/"$1"stat |grep "$2" |cut -d':' -f 2 |sed -e 's/^[[:space:]]*//g'


