<?php
$file = $_REQUEST['f'];
if(!$file) die('file name required!');
$db = new SQLite3('pictures.sqlite3');
$db->exec("INSERT INTO pictures (name,ip) VALUES ('{$file}','".$_SERVER['REMOTE_ADDR']."')");
$db->close();
exec('/usr/bin/convert /home/ezhong/public_html/lapse/pics/original/'.$file." -resize 1024x768 -font Bitstream-Vera-Sans-Mono-Bold -quality 90 -pointsize 20 -fill black -gravity NorthEast -annotate +10+10 'Daum Space.2 Construction Site : %[EXIF:DateTime]' /home/ezhong/public_html/lapse/pics/current.jpg");
sleep(3);
exec('/usr/bin/convert /home/ezhong/public_html/lapse/pics/original/'.$file." -resize 2048x1536 -font Bitstream-Vera-Sans-Mono-Bold -quality 96 -pointsize 50 -fill black -gravity NorthEast -annotate +10+10 'Daum Space.2 Construction Site : %[EXIF:DateTime]' /home/ezhong/public_html/lapse/pics/for_tumblr/current.jpg");
sleep(3);
exec('/usr/bin/convert /home/ezhong/public_html/lapse/pics/original/'.$file." -font Bitstream-Vera-Sans-Mono-Bold -quality 95 -pointsize 60 -fill black -gravity NorthEast -annotate +32+32 'Daum Space.2 Construction Site : %[EXIF:DateTime]' /home/ezhong/public_html/lapse/pics/for_flickr/".$file);
$minute = date('i');
#if($minute==0 || $minute==30){
#	exec('cp /home/ezhong/public_html/lapse/pics/current.jpg /home/ezhong/public_html/lapse/pics/for_flickr/f'.$file);
#}
exec('/home/ezhong/public_html/lapse/do_dropbox.sh');
exec('/home/ezhong/public_html/lapse/do_tumblr.sh');
#exec('/home/ezhong/public_html/lapse/do_flickr.sh');
?>
