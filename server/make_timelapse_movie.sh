#!/bin/bash
if [ "$1" != "gopro1" ]; then
	if [ "$1" != "gopro2" ]; then
		echo "error!" 
		exit 1;
	fi
fi
mkdir -p /home/daum/timelapse/temp
cp /home/daum/timelapse/mp4/lapse_$1_current.mp4 /home/daum/timelapse/mp4/lapse_$1_yesterday.mp4 
cp /home/daum/timelapse/mp4/lapse_$1_current.webm /home/daum/timelapse/mp4/lapse_$1_yesterday.webm
rm -f /home/daum/timelapse/temp/*.jpg
find /home/daum/timelapse/gopro_resized/$1 -type f -name '*.jpg' | sort -n > /tmp/temp.txt
x=1; for line in `cat /tmp/temp.txt`; do counter=$(printf %08d $x); ln -sf $line /home/daum/timelapse/temp/img$counter.jpg; x=$(($x+1));done
#x=1; for line in `cat /tmp/temp.txt`; do counter=$(printf %08d $x); /usr/bin/convert $line -resize 1024x768 -font "/usr/share/fonts/truetype/ubuntu-font-family/UbuntuMono-B.ttf" -quality 95 -pointsize 40 -fill white -gravity SouthWest -annotate +10+10 'Daum Space.2 : %[EXIF:DateTime]' /home/daum/timelapse/temp/img$counter.jpg ; x=$(($x+1));done
cd /home/daum/timelapse/temp/
/usr/bin/ffmpeg -y -f image2 -r 24 -i img%08d.jpg -s 1024x768 -vcodec libx264 -r 24 -b:v 10M /home/daum/timelapse/mp4/lapse_$1_current.mp4
/usr/bin/ffmpeg -y -f image2 -r 24 -i img%08d.jpg -s 1024x768 -vcodec libvpx -r 24 -b:v 30M /home/daum/timelapse/mp4/lapse_$1_current.webm
rm -f /home/daum/timelapse/temp/*.jpg
