<?php
class Sys_Database {
    private $connection = null;
    private $resultSet;
	
    private $server = '';

    public static function countQuerys() {
        
    }

    public function __construct($server) {
        $this->server = $server;
    }

    /**
     *Führt einen SQL-Query in die Datenbank aus
     * @param Sys_Database_Query $query beschreibt den SQL-Query mit den dazugehörigen Parametern z.b
     *  $query = new Sys_Database_Query('select * from users where id={id};');
     *  $query->add('id','1');
     */
    public function execute(Sys_Database_Query $parameterObj) {
        if ($this->connection === null) {
             $this->connection = Sys_Database_Connection::getInstance($this->server);
        }
        $this->resultSet = $this->connection->query($parameterObj->getSecureQuery($this->connection));
    }
	
    public function fetchArray() {
        mysqli_fetch_array($this->resultSet);
    }

    public function fetchAssoc() {
        return $this->resultSet->fetch_assoc();
    }

    public function fetchObject() {
        return $this->resultSet->fetch_object();
    }

    public function fetchRow() {
        return $this->resultSet->fetch_row();
    }
    public function fetchAll($key='id') {
        $retArr = array();
        while ($row = $this->resultSet->fetch_assoc()) {
            if (isset($row[$key])) {
                $retArr[$row[$key]] = $row;
            } else {
                $retArr[] = $row;
            }
        }

        return $retArr;
    }

    public function fieldCount() {
        return $this->resultSet->field_count;
    }

    public function numRows() {
        return $this->resultSet->num_rows;
    }

    public function affectedRows() {
        return $this->connection->affected_rows;
    }
	
    public function fetchJson() {
        return json_encode($this->fetchAll());
    }

    public function fetchXml() {
        
        $xmlString='<?xml version="1.0" encoding="UTF-8"?>';
        $xmlString.='<result>';
        $xmlString.='</result>';
        
        $xml=simplexml_load_string($xmlString);

        while ($row = $this->fetchObject()) {
            $element=$xml->addChild('entry');
            
            foreach ($row as $key => $value) {
                $element->addAttribute($key, utf8_encode($value));
            }
        }


        return $xml->asXML();
    }


}
?>
