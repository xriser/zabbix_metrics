#!/bin/bash

/usr/local/bin/redis-cli -h 127.0.0.1 -p $1 info memory |grep -r used_memory: | cut -d':' -f 2
