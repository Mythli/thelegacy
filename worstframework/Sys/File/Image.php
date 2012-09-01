

<?php
class Sys_File_Image extends Sys_Singleton {

   var $image;
   var $image_type;

    public static function scaleArr(&$imager, array $sizeInfo) {
    //Überprüfen ob Bild prozentual skaliert werden soll
        if (isset($sizeInfo['scale'])) {
            $imager->scale($sizeInfo['scale']);
        } else {
        //wir schauen ob width und height im array gesetzt sind, wenn dann skalieren wir das bild auf diese werte
            if (isset($sizeInfo['height']) && isset($sizeInfo['width'])) {
                $imager->resize($sizeInfo['height'], $sizeInfo['width']);
            } elseif (isset($sizeInfo['height'])) {
            //wir schauen ob die eigenschaft height gesetzt ist, dann skalieren wir das bild proportional nach height
                $imager->resizeToHeight($sizeInfo['height']);
            } elseif (isset($sizeInfo['width'])) {
            //wir schauen ob die eigenschaft width gesetzt ist, dann skalieren wir das bild proportional nach width
                $imager->resizeToHeight($sizeInfo['width']);
            } else {
                throw new Sys_File_Image_Upload_Exception('no resize informations provided!', 4561);
            }
        }
    }

   function load($filename) {

      $image_info = getimagesize($filename);
      $this->image_type = $image_info[2];
      if( $this->image_type == IMAGETYPE_JPEG ) {
         if (!$this->image = imagecreatefromjpeg($filename)) {
             throw new Sys_File_Image_Exception('Image load failed!', 6404);
         }
      } elseif( $this->image_type == IMAGETYPE_GIF ) {
         if (!$this->image = imagecreatefromgif($filename)) {
             throw new Sys_File_Image_Exception('Image load failed!', 6404);
         }
      } elseif( $this->image_type == IMAGETYPE_PNG ) {
         if (!$this->image = imagecreatefrompng($filename)) {
             throw new Sys_File_Image_Exception('Image load failed!', 6404);
         }
      }
   }
   function save($filename, $image_type=null, $compression=75, $permissions=null) {
      if ($image_type==null) {
        $image_type=$this->image_type;
      }
      if( $image_type == IMAGETYPE_JPEG ) {
         if (!imagejpeg($this->image,$filename,$compression)) {
              throw new Sys_File_Image_Exception('Image save Failed!', 6401);
         }
      } elseif( $image_type == IMAGETYPE_GIF ) {
         if(!imagegif($this->image,$filename)) {
             throw new Sys_File_Image_Exception('Image save Failed!', 6401);
         }
      } elseif( $image_type == IMAGETYPE_PNG ) {
         if (!imagepng($this->image,$filename)) {
             throw new Sys_File_Image_Exception('Image save Failed!', 6401);
         }
      }
      if( $permissions != null) {
         chmod($filename,$permissions);
      }
   }

   function output($image_type=IMAGETYPE_JPEG) {
      if( $image_type == IMAGETYPE_JPEG ) {
         if (!imagejpeg($this->image)) {
             throw new Sys_File_Image_Exception('Image output failed', 6406);
         }
      } elseif( $image_type == IMAGETYPE_GIF ) {
         if (!imagegif($this->image)) {
             throw new Sys_File_Image_Exception('Image output failed', 6406);
         }
      } elseif( $image_type == IMAGETYPE_PNG ) {
         if (!imagepng($this->image)) {
             throw new Sys_File_Image_Exception('Image output failed', 6406);
         }
      }
   }
   function getWidth() {
      return imagesx($this->image);
   }

   function getHeight() {
      return imagesy($this->image);
   }

   function getImageType() {
       return $this->image_type;
   }

   function resizeToHeight($height) {
      $ratio = $height / $this->getHeight();
      $width = $this->getWidth() * $ratio;
      $this->resize($width,$height);
   }

   function resizeToWidth($width) {
      $ratio = $width / $this->getWidth();
      $height = $this->getheight() * $ratio;
      $this->resize($width,$height);
   }
   function scale($scale) {
      $width = $this->getWidth() * $scale/100;
      $height = $this->getheight() * $scale/100;
      $this->resize($width,$height);
   }
   function resize($width,$height) {
      $new_image = imagecreatetruecolor($width, $height);
      if (!imagecopyresampled($new_image, $this->image, 0, 0, 0, 0, $width, $height, $this->getWidth(), $this->getHeight())) {
          throw new Sys_File_Image_Exception('image scale failed!', 6400);
      }
      $this->image = $new_image;
   }
}
?>

