#!/bin/bash
/usr/bin/find /home/ezhong/public_html/lapse/pics/for_flickr/ -name "*.JPG" -a -mtime +6 -exec rm -f {} \;
