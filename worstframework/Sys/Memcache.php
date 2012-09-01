<?php

class Sys_Memcache extends Sys_Singleton {
    private $memCache = null;

    protected function __construct() {
        if(!class_exists('Memcache')) {
            throw new Sys_Memcache_Exception('Memcache extension not installed!', 865, true);
        }

        $this->memCache = new Memcache();
        if (!$this->memCache->connect('127.0.0.1')) {
            throw new Sys_Memcache_Exception('can´t connect to local memcache Server!', 864, true);
        }
    }

    public function add($id, $obj) {
        return $this->memCache->add($id, $obj);
    }

    public function addResult($query, $result) {
        return $this->add(md5($query), $query);
    }

    public function get($id) {
        return $this->memCache->get($id);
    }

    public function getResult($query) {
        return $this->get(md5($query));
    }

    public function clear() {
        $this->memCache->flush();
    }

}

?>
