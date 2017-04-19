#!/bin/sh

PATT=$1

if [ "$PATT" == "phpfpm" ]
then
    PATT="php-fpm"
fi
if [ "$PATT" == "other" ]
then
    LAST=`ps axo %cpu,comm | grep php | grep redis | grep  mongo | grep  idle | awk '{sum += $1} END {print sum}'`
    if [ -n "$LAST" ]; then
     echo $LAST
    else
     echo 0
    fi
else
    if [ "$PATT" == "php" ]
    then
        LAST=`ps axo %cpu,comm | grep php | grep php-fpm | awk '{sum += $1} END {print sum}'`
        if [ -n "$LAST" ]; then
         echo $LAST
        else
         echo 0
        fi
    else
        LAST=`ps axo %cpu,comm | grep $PATT | awk '{sum += $1} END {print sum}'`
        if [ -n "$LAST" ]; then
         echo $LAST
        else
         echo 0
        fi
    fi
fi