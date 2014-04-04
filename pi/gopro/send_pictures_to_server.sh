#!/bin/bash
/usr/bin/scp  /tmp/*.JPG daum@server:/home/daum/timelapse/gopro1/ && rm -rf /tmp/*.JPG > /tmp/sendlog
