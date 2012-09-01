<?php

class Sys_getInstance {
    
    private static $instance = NULL;

    public static function getInstance() {
        if (self::$instance === null) {
            self::$instance = new self;
        }
        return self::$instance;
    }


}

?>
