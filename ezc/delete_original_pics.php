<?php
ini_set('display_errors','On');
ini_set('error_log','/tmp/php.log');

#error_log($_REQUEST['pics']);
if($_SERVER['REMOTE_ADDR']!='192.168.161.67') die('error! access denied');
if(!$_REQUEST['pics']) die('error!');
$pics = str_replace(',',' ',$_REQUEST['pics']);
exec('cd /home/ezhong/public_html/lapse/pics/original/;rm -rf '.$pics);
#error_log($pics);
?>
