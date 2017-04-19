#!/bin/bash
mysqladmin -h 127.0.0.1 -P $1 -umonitor -ppass extended-status |grep -m1 -i $2 | awk '{print $4}'

