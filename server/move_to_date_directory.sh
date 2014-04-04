#!/bin/bash
## make yesterday directory and move files taken yesterday to there
if [ "$1" != "gopro1" ]; then
	if [ "$1" != "gopro2" ]; then
		echo "error!" 
		exit 1;
	fi
fi
date=`date +"%Y-%m-%d" -d '1day ago'`
dir=/home/daum/timelapse/$1/$date
name_pattern=P`echo $1 | tr -d 'gopro'`_`echo $date | tr -d '-'`
mkdir -p $dir
mv $dir/../$name_pattern*.JPG $dir

## resized images
mkdir -p /home/daum/timelapse/gopro_resized/$1/$date
name_pattern=p`echo $1 | tr -d 'gopro'`_`echo $date | tr -d '-'`
mv /home/daum/timelapse/gopro_resized/$1/$name_pattern*.jpg /home/daum/timelapse/gopro_resized/$1/$date/


