rm -rf /home/daum/temp/test/img*
/usr/bin/rsync -aq --exclude-from '/home/daum/temp/rsync_exclusion.txt' ezc.dev.daum.net::pics /home/daum/temp/
cd /home/daum/temp/
x=1; for i in *JPG; do counter=$(printf %05d $x); ln -s `pwd`/"$i" ./test/img"$counter".jpg; x=$(($x+1)); done
cd test/

