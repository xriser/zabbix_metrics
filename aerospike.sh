#!/bin/bash

/usr/bin/aql -c "stat system" |grep \"$1\" |awk '{print $4}' |head -1


