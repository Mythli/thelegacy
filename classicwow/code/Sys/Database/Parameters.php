<?php
class Sys_Database_Parameters {
    private $parameters = array();

    public function add($name, $value) {
        $this->parameters[] = array('name' => $name, 'value' => $value);
    }

    public function getArray() {
        return $this->parameters;
    }
    
    public function clear() {
        $this->parameters = array();
    }
}
?>
