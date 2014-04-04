#!/bin/sh
/sbin/ifconfig > /tmp/ifconfig.txt 
date >> /tmp/ifconfig.txt 
scp /tmp/ifconfig.txt ezhong@ezc:~/public_html/rpi2_ifconfig.txt
