#!/bin/bash
a=`/usr/bin/curl -s "http://10.5.5.9:8080/DCIM/" | grep GOPRO | tail -1`
b=`expr ${a:23:8}`
c=`/usr/bin/curl -s "http://10.5.5.9:8080/DCIM/$b/" | grep JPG | tail -1`
d=`expr ${c:23:12}`
/usr/bin/curl -s "http://10.5.5.9:8080/DCIM/$b/$d" -o /tmp/P1_`date +"%Y%m%d%H%M"`_$d
