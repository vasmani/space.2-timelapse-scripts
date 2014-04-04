#!/bin/bash
cd /home/ezhong/public_html/lapse/pics
filename=G`identify -format "%[EXIF:*]" current.jpg  | grep Date | head -1 | tr '=' ' ' | awk '{print substr($0,index($0,$2))}' | tr ':' '-' | tr ' ' '_'`.JPG
cp current.jpg $filename
##/usr/local/bin/dropbox_uploader.sh upload $filename
/home/ezhong/Dropbox-Uploader/dropbox_uploader.sh -f /home/ezhong/.dropbox_uploader upload $filename >> /tmp/mymylog.txt
