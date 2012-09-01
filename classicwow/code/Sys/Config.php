<?php
class Sys_Config extends Sys_Singleton {
    private $config = array();
    private $languageKeys = array();

    private function loadConfigFile() {
        $configFile=CONFIG_FILE;
        if (file_exists($configFile)) {
            if (!$this->config=simplexml_load_file($configFile)) {
                throw new Sys_Config_Exception('Cant load Configuration-File!', 40);
            }
        } else {
            throw new Sys_Config_Exception('Cant find Configuration-File! '.CONFIG_FILE, 41);
        }
        $this->config=self::toArray($this->config);
    }

    public function __construct() {
        $this->loadConfigFile();
        $this->languageKeys=@array_flip($this->config['Sys']['Translation']['AvaibleLanguages']);
    }

    public function getXmlObject() {
        return $this->config;
    }

    private static function toArray ($data) {
        if (is_object($data)) $data = get_object_vars($data);
        return (is_array($data)) ? array_map(array('self', 'toArray'),$data) : $data;
    }

    public static function validateMysqlConfig($data) {
        if (!isset($data['dbHost'])) { throw new Sys_Config_Exception('dbHost not Found', 60); }
        if (!isset($data['dbPort'])) { throw new Sys_Config_Exception('dbPort not Found', 61); }
        if (!isset($data['dbUser'])) { throw new Sys_Config_Exception('dbUser not Found', 62); }
        if (!isset($data['dbPass'])) { throw new Sys_Config_Exception('dbPass not Found', 63); }
        if (!isset($data['dbName'])) { throw new Sys_Config_Exception('dbName not Found', 64); }
    }

    public function getClassConfig($className) {
        $classNameArr=explode('_', $className);
        $tempArr=$this->config;
        foreach ($classNameArr as $split) {
            $tempArr=$tempArr[$split];
        }
        return $tempArr;
    }

    public function getClassConfigAttr($className) {
        $tempArr=self::getClassConfig($className);
        return $tempArr['@attributes'];
    }

    public function getLangKeyArr() {
        return $this->languageKeys;
    }

}
?>
