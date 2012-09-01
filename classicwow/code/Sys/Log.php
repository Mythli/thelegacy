<?php
class Sys_Log extends Sys_Singleton {
    private $fileHandle = null;
    private $logConfig = array ();
	
	public static function formatSqlQuery($query) {
		return implode(' ' ,preg_split('#[\s]+#', $query));
	}

    protected function __construct() {
        $this->logConfig = Sys_Config::getInstance()->getClassConfigAttr(__CLASS__);
        $this->logConfig['maxLogSize']=Sys_File::strToFileSize($this->logConfig['maxLogSize']);

        if ($this->logConfig['logLevel'] > 0) {
            $this->fileHandle = fopen(BASE_PATH.'/'.$this->logConfig['logFile'], 'ab');
            if ($this->fileHandle == false) {
                throw new Sys_Exception('could not open logfile', 5);
            }
            $strToFile = date('d-m-Y_H:i:s').' site request from ip '.$_SERVER['REMOTE_ADDR']."\n";
            fwrite($this->fileHandle, $strToFile);
        }
    }

    
    public function write($message, $level) {
        //Überprüfen ob Log grösser als Maximum wenn ja archivieren
        if (filesize(BASE_PATH.'/'.$this->logConfig['logFile']) > $this->logConfig['maxLogSize']) {
            $logArchive = new ZipArchive();
            if (!$logArchive->open(BASE_PATH.'/'.$this->logConfig['archiveFile'], ZIPARCHIVE::CREATE)) {
                throw new Sys_Config_Exception('can´t open ZIP-Archive', 102);
            }
            $date = date(DATE_ATOM, mktime(0, 0, 0, 7, 1, 2000)).'_'.microtime().'.log';
            //Log-Datei hinzufügen
            $logArchive->addFile($this->logConfig['logFile'], $date);
            $logArchive->close();
            //Datei löschen
            fclose($this->fileHandle);
            unlink(BASE_PATH.'/'.$this->logConfig['logFile']);
            $this->fileHandle = fopen(BASE_PATH.'/'.$this->logConfig['logFile'], 'ab');
            if ($this->fileHandle == false) {
                throw new Sys_Exception('could not open logfile', 5);
            }
        }
        if ($level <= $this->logConfig['logLevel']) {
            fwrite($this->fileHandle, date('d-m-Y_H:i:s').' '.$message."\n");
        }
    }
    
    public function __destruct() {
        if ($this->logConfig['logLevel'] > 0) {
            //$this->write(Sys_Database::countQuerys().' sql queries executed', 1);
        }
        fclose($this->fileHandle);
    }
	
}
?>
