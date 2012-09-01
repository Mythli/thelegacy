<?php

class Sys_File_Image_Upload extends Sys_Singleton {

    private $imageUploadConf = array();
    
    public function __construct() {
        $this->imageUploadConf=Sys_Config::getInstance()->getClassConfig(__CLASS__);
    }

    public function uploadImage(array $file, array $resolutions = array()) {
        if (strpos($file['type'], 'image') === false) {
            throw new Sys_File_Image_Upload_Exception('can´t upload non-images', 4560);
        } else {
            $destination=$this->imageUploadConf['@attributes']['destination'];

            $imageName=Sys_File_Upload::getInstance()->upload($file, $destination, 'img');

            $imager = Sys_File_Image::getInstance();
            $imager->load($destination.'/'.$imageName);

            foreach ($resolutions as $sizeInfo) {
                 if (!isset($sizeInfo['destination'])) {
                    throw new Sys_File_Image_Upload_Exception('no path for this size provided!', 4562);
                }

                if (!is_dir($sizeInfo['destination'])) {
                    if (!mkdir($sizeInfo['destination'], 0777, true)) {
                        throw new Sys_File_Upload_Exception('folder not found and folder can´t be created!');
                    }

                }

                Sys_File_Image::scaleArr($imager, $sizeInfo);

                if (!isset($sizeInfo['imageType'])) {
                    $sizeInfo['imageType']=null;
                }
                if (!isset($sizeInfo['compression'])) {
                    $sizeInfo['compression']=null;
                }
                $imager->save(BASE_PATH.'/'.$sizeInfo['destination'].'/'.$imageName, $sizeInfo['imageType'], $sizeInfo['compression']);
            }
            foreach ($this->imageUploadConf['Sizes'] as $sizeInfo) {
                $sizeInfo=$sizeInfo['@attributes'];
                if (!isset($sizeInfo['destination'])) {
                    throw new Sys_File_Image_Upload_Exception('no path for this size provided!', 4562);
                }

                if (!is_dir($sizeInfo['destination'])) {
                    if (!mkdir($sizeInfo['destination'], 0777, true)) {
                        throw new Sys_File_Upload_Exception('folder not found and folder can´t be created!');
                    }

                }

                Sys_File_Image::scaleArr($imager, $sizeInfo);

                if (!isset($sizeInfo['imageType'])) {
                    $sizeInfo['imageType']=null;
                }
                if (!isset($sizeInfo['compression'])) {
                    $sizeInfo['compression']=null;
                }
                $imager->save(BASE_PATH.'/'.$sizeInfo['destination'].'/'.$imageName, $sizeInfo['imageType'], $sizeInfo['compression']);
            }
            
        }

    }

    public function uploadImages(array $files, array $resolutions = array()) {
        foreach ($files as $file) {
            $this->uploadImage($file, $resolutions);
        }
    }
}

?>
