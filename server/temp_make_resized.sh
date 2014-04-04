#!/bin/bash
exit 1
find /home/daum/timelapse/gopro2 -type f -name *.JPG | sort -n > /tmp/temp3.txt
for line in `cat /tmp/temp3.txt`; do \
fname=`echo $line | grep -oP "\w+\.JPG$" | awk '{print tolower($0)}'`; \
/usr/bin/convert $line \
        -resize 1600x1200 -font "/usr/share/fonts/truetype/Daum/Daum_Regular.ttf" \
        -quality 95 -pointsize 40 -fill white -gravity SouthWest -annotate +10+10 \
        'Daum Space.2 : %[EXIF:DateTime]' \
        /home/daum/timelapse/gopro_resized/gopro2/$fname ; \
echo $fname; \
done
