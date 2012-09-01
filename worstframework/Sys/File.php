<?php
class Sys_File {
     public static function strToFileSize($size) {
       $unit=substr($size, strlen($size)-2);

       $size=Sys_Base::extractNumbers($size);
       $size=$size[0];

       switch ($unit) {
           case 'KB':
                return $size*1024;
           break;
           case 'MB':
                return ($size*1024)*1024;
           break;

           case 'GB':
                return (($size*1024)*1024)*1024;
           break;

           default:
                return $size;
           break;

       }

   }

   public static function humanFileSize($SIZE) {
       $count = 0;
       $format = array("B","KB","MB","GB","TB","PB","EB","ZB","YB");
       while(($size/1024)>1 && $count<8) {
           $size=$size/1024;
           $count++;
       }
       if( $size < 10 ) $decimals = 1;
       else $decimals = 0;
       $return = number_format($size,$decimals,'.',' ')." ".$format[$count];
       return $return;
   }


   function scanDirectories($rootDir, $allData=array()) {
   // set filenames invisible if you want
       $invisibleFileNames = array(".", "..", ".htaccess", ".htpasswd");
       // run through content of root directory
       $dirContent = scandir($rootDir);
       foreach($dirContent as $key => $content) {
       // filter all files not accessible
           $path = $rootDir.'/'.$content;
           if(!in_array($content, $invisibleFileNames)) {
           // if content is file & readable, add to array
               if(is_file($path) && is_readable($path)) {
               // save file name with path
                   $allData[] = $path;
               // if content is a directory and readable, add path and name
               }elseif(is_dir($path) && is_readable($path)) {
               // recursive callback to open new directory
                   $allData = scanDirectories($path, $allData);
               }
           }
       }
       return $allData;
   }
}
?>
