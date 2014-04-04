#!/bin/bash
if [ "$1" != "gopro1" ]; then
	if [ "$1" != "gopro2" ]; then
		echo "error!" 
		exit 1;
	fi
fi
file_name=`find /home/daum/timelapse/$1/ -mmin -5 -name *.JPG | head -1`
if test -z "$file_name"; then
	exit 1
fi 
converted_name=`expr ${file_name:28} | awk '{print tolower($0)}'`
echo $converted_name
echo $file_name
/usr/bin/convert $file_name \
	-resize 1600x1200 -font "/usr/share/fonts/truetype/Daum/Daum_Regular.ttf" \
	-quality 95 -pointsize 40 -fill white -gravity SouthWest -annotate +10+10 \
	'Daum Space.2 : %[EXIF:DateTime]' \
	/home/daum/timelapse/gopro_resized/$1/$converted_name
