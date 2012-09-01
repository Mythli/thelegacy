<?php
class Sys_File_Upload extends Sys_Singleton {
    private $uploadConfig = array();

    private $destination = '';
    private $fileName = '';
    private $fileInfo = array();
    private $validateData = array();

    protected function __construct() {
        $this->uploadConfig=Sys_Config::getInstance()->getClassConfigAttr(__CLASS__);
        $this->uploadConfig['size']=Sys_File::strToFileSize($this->uploadConfig['size']);
        $this->uploadConfig['restrictedExtensions']=explode(',', $this->uploadConfig['restrictedExtensions']);


    }

    private function rename() {
        $name= $this->fileInfo['baseName'];

        //wenn Dateiname kleiner als 3 Zeichen 2 Zufallszeichen anhängen.
        if (strlen($name) < 3) {
            $name.=Sys_Base::rand_str(2);
            echo 'PENIS';
        }

        //solange in der schleife bleiben bis keine datei mit $fileName in Verzeichniss $destination gefunden wurde.
        while(file_exists($this->destination.'/'.$name.'.'.$this->fileInfo['extension'])) {
            $randLetter[0] = Sys_Base::rand_str(1);
            $randLetter[1] = Sys_Base::rand_str(1);

            $letterCount = strlen($name)-1;
            $name{rand(1, $letterCount)} = $randLetter[0];
            $name{rand(1, $letterCount)} = $randLetter[1];
        }
        return $name.'.'.$this->fileInfo['extension'];
    }

    private function validateFile() {

        if (false !== array_search($this->fileInfo['extension'], $this->uploadConfig['restrictedExtensions'])) {
            throw new Sys_File_Upload_Exception('File-Extension restricted!', 6000);
        }

        if (isset ($this->validateData['extensions'])) {
            if ( true !== array_search($this->fileInfo['extensions'], $this->uploadConfig['restrictedExtensions'])) {
                throw new Sys_File_Upload_Exception('File-Extension restricted!', 6000);
            }
        }
        
        if (isset ($this->validateData['mimes'])) {
            if ( true !== array_search($this->fileInfo['mimes'], $restrikedExtensions)) {
                throw new Sys_File_Upload_Exception('Mime-Type restricted!', 6001);
            }
        }

        if ($this->fileInfo['size']>$this->uploadConfig['size']) {
            throw new Sys_File_Upload_Exception('File-Size to big!', 6002);
        }

        return true;
    }

    public function insertDBEntry() {
            try {
                $userData=Sys_Base::getInstance()->getUserObject()->getData();
            }
            catch (Sys_User_Exception $e) {
            }
            $paramObj = new Sys_Database_Parameters();

            if (isset($userData)) { $paramObj->add('Uploader', $userData['id']); }

            $paramObj->add('FileCategory', $this->fileInfo['category']);
            $paramObj->add('FileExtension', $this->fileInfo['extension']);
            $paramObj->add('Destination', $this->destination);
            $paramObj->add('FileName', $this->fileName);
            $paramObj->add('MimeType', $this->fileInfo['type']);
            $paramObj->add('FileSize', $this->fileInfo['size']);
            $sqlQuery = "INSERT INTO file_uploads
                            (Uploader,
                             FileCategory,
                             FileSize,
                             FileExtension,
                             Destination,
                             FileName,
                             MimeType,
                             UploadDate)
                         VALUES
                            ('{Uploader}',
                             '{FileCategory}',
                             '{FileSize}',
                             '{FileExtension}',
                             '{Destination}',
                             '{FileName}',
                             '{MimeType}',
                             NOW());";
            Sys_Database::getInstance()->execute($sqlQuery, true, $paramObj);
            return true;
    }

    public function upload(array $file, $destination = null, $category = null, array $validateData = null) {

       if ($destination!=null) {
            $this->destination=BASE_PATH.'/'.$destination;
        } else {
            $this->destination=BASE_PATH.'/'.$this->uploadConfig['destination'];
        }

        if (!is_dir($this->destination)) {
            if (!mkdir($this->destination, 0777, true)) {
                throw new Sys_File_Upload_Exception('folder not found and folder can´t be created!');
            }

        }

        //Überprüfungsdaten in klassenvariable (für mime type, extension)
        $this->validateData = $validateData;
        //save file information in classvar fileInfo
        $this->fileInfo = array (
            'name' => $file['name'],
            'tempname' => $file['tmp_name'],
            'baseName' => pathinfo($file['name'], PATHINFO_FILENAME),
            'extension' => strtolower(pathinfo($file['name'], PATHINFO_EXTENSION)),
            'type' => $file['type'],
            'size' => $file['size'],
            'category' => $category
        );
        if ($this->validateFile()) {
            $this->fileName=$this->rename();
            if (move_uploaded_file($this->fileInfo['tempname'], $this->destination.'/'.$this->fileName)) {
                try {
                    $this->insertDBEntry();
                    Sys_Log::getInstance()->write('Upload succesful: '.$this->destination.'/'.$this->fileName);
                    return $this->fileName;
                } catch(Sys_Database_Exception $e) {
                    unlink($this->destination.'/'.$this->fileName);
                    throw new Sys_File_Upload_Exception('Can´t insert DB Entry.');
                }
            } else {
                throw new Sys_File_Upload_Exception('Error while uploading.', 6003);
            }
        }

    }

    public function uploadFiles(array $files, $destination = null, $category = null, array $validateData = null) {
        foreach ($files as $file) {
            $this->uploadFiles($file, $destination, $category, $validateData);
        }
    }

    
}
?>
