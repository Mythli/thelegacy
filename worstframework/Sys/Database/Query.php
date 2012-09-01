<?php
class Sys_Database_Query {
	
    private $parameters = array();
    private $query = '';
    private $isSecure = false;

    public function __construct ($query, $parameters=array()) {
                    $this->query = $query;
                    $this->parameters = $parameters;
    }

    public function add($name, $value) {
        $this->parameters[] = array('name' => $name, 'value' => $value);
    }
	
    private function secureQuery($connection) {
            $sQuery = $this->query;

            foreach($this->parameters as $parameter) {
                    $parameter['value'] = $connection->real_escape_string($parameter['value']);
                    $sQuery = str_replace('{'.$parameter['name'].'}', $parameter['value'], $sQuery);
            }

            return $sQuery;
    }

    public function getSecureQuery($connection) {
            if ($this->isSecure == false) {
                    return $this->secureQuery($connection);
            } else {
                    return $this->query;
            }
    }
    
    public function clear() {
        $this->parameters = array();
    }
}
?>
