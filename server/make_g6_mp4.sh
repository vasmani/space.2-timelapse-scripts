#!/bin/bash
cp /home/daum/timelapse/mp4/lapse_g6_current.mp4 /home/daum/timelapse/mp4/lapse_g6_yesterday.mp4 
cp /home/daum/timelapse/mp4/lapse_g6_current.webm /home/daum/timelapse/mp4/lapse_g6_yesterday.webm
rm -rf /home/daum/temp/test/img*
/usr/bin/rsync -aq --exclude-from '/home/daum/temp/rsync_exclusion.txt' ezc.dev.daum.net::pics /home/daum/temp/
cd /home/daum/temp/
x=1; for i in *JPG; do counter=$(printf %05d $x); ln -s `pwd`/"$i" ./test/img"$counter".jpg; x=$(($x+1)); done
cd test/
/usr/bin/ffmpeg -y -f image2 -i img%05d.jpg -r 35 -s 1024x768 -vcodec libx264 /home/daum/timelapse/mp4/lapse_g6_current.mp4
/usr/bin/ffmpeg -y -f image2 -i img%05d.jpg -r 35 -s 1024x768 -vcodec libvpx -b:v 30M /home/daum/timelapse/mp4/lapse_g6_current.webm
