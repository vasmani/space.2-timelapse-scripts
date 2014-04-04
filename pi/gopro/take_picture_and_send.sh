#!/bin/bash
## volume 100%
/usr/bin/curl -s "http://10.5.5.9/camera/BS?t=DAUMCOMUNICATION&p=%02" > /dev/null
sleep 1
## mode to photo
/usr/bin/curl -s "http://10.5.5.9/camera/CM?t=DAUMCOMUNICATION&p=%01" > /dev/null
sleep 1
## take picture
/usr/bin/curl -s "http://10.5.5.9/bacpac/SH?t=DAUMCOMUNICATION&p=%01" > /dev/null
sleep 5 
## download picture from gopro
/home/pi/public_html/gopro/download_latest_picture.sh && \
sleep 3 && \
## delete picture \
/usr/bin/curl -s "http://10.5.5.9/camera/DL?t=DAUMCOMUNICATION" > /dev/null
