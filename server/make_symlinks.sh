#!/bin/bash
sleep 59

ln -sf `ls -alt /home/daum/timelapse/gopro1/*.JPG | head -1 | awk '{print $9}'` /home/daum/timelapse/current_gopro1.jpg
ln -sf `ls -alt /home/daum/timelapse/gopro2/*.JPG | head -1 | awk '{print $9}'` /home/daum/timelapse/current_gopro2.jpg

ln -sf `ls -alt /home/daum/timelapse/gopro_resized/gopro1/*.jpg | head -1 | awk '{print $9}'` /home/daum/timelapse/current_gopro1_resized.jpg
ln -sf `ls -alt /home/daum/timelapse/gopro_resized/gopro2/*.jpg | head -1 | awk '{print $9}'` /home/daum/timelapse/current_gopro2_resized.jpg
