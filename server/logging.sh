#!/bin/bash
datauri=$(/usr/bin/convert `ls -t /home/daum/timelapse/gopro_resized/gopro1/*.jpg | head -1` -resize 332x252 -quality 75 - | /usr/bin/base64 -i -)
echo "<img src=\"data:image/jpeg;base64,$datauri\" alt=\"\" />" > /tmp/pics.log
echo "<pre>" >> /tmp/pics.log
echo 'GOPRO1 -----------------------------------------' >> /tmp/pics.log
echo "" >> /tmp/pics.log
cd /home/daum/timelapse/gopro1
ls -alt *.JPG | awk '{print $6,$7,$8,$5,$9}' | head -5 >> /tmp/pics.log
echo "" >> /tmp/pics.log
echo 'GOPRO2 -----------------------------------------' >> /tmp/pics.log
echo "" >> /tmp/pics.log
cd /home/daum/timelapse/gopro2
ls -alt *.JPG | awk '{print $6,$7,$8,$5,$9}' | head -5 >> /tmp/pics.log
echo "</pre>" >> /tmp/pics.log
/usr/local/bin/tumblr post /tmp/pics.log --host=http://space2log.tumblr.com/ > /tmp/tumblr.log

