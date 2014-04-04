#!/bin/bash
name=`ls -alt /home/ezhong/public_html/lapse/pics/ | grep JPG | head -1 | awk '{print $9}'`
ln -sf /home/ezhong/public_html/lapse/pics/$name /home/ezhong/public_html/lapse/pics/for_flickr/
