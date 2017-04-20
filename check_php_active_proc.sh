#!/bin/bash

dt=`(date '+%d/%m/%Y %H:%M:%S')`
pid=`ps aux |grep dmp_fpm |grep -v grep | awk '{print $2}'`

aproc_count="$(curl -ssssssssss http://localhost:88/dmpstat |grep '^active proc' | awk '{print $3}')";
echo "${aproc_count}";


if [[ "${aproc_count}" != "" && ${aproc_count} -lt 200 ]];then
    echo "Running" $pid ${aproc_count}

else
    echo "Too much active processes"
    echo $dt Restarting php_dmp $pid>> /var/log/php.log
    /etc/init.d/php-dmp restart

fi
