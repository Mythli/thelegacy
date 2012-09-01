<?
class Sys_Database_Connection {
    private $connections = array();
    private $serverConf = array();
    private static $instance = NULL;


    public static function getInstance($server) {
        if (self::$instance === NULL) {
                self::$instance = new self;
        }
        if (!isset(self::$instance->connections[$server])) {
                self::$instance->connections[$server] = self::$instance->connectToServer($server);
        }
        return self::$instance->connections[$server];
    }

    //Klonen verbieten
    private function __clone() {}

    private function __construct() {

    }

    function connectToServer($server) {
        $this->serverConf = Sys_Config::getInstance()->getClassConfigAttr('Sys_Database_Servers_main');
        Sys_Config::validateMysqlConfig($this->serverConf);

        $connection = new mysqli (
                $this->serverConf['dbHost'],
                $this->serverConf['dbUser'],
                $this->serverConf['dbPass'],
                $this->serverConf['dbName'],
                (int)$this->serverConf['dbPort']
        );
        if (!mysqli_connect_error()) {
                Sys_Log::getInstance()->write('sql connect successfull servername: '.$server, 1);
                return $connection;
        } else {
                throw new Sys_Database_Connection_Exception('Connect Error ('.mysqli_connect_errno().') '.mysqli_connect_error().' servername: '.$server, 12);
        }

    }
}
?>