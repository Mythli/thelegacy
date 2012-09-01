<?php
class Sys_Exception extends Exception {
    public function __construct($message = null, $code = null, $logError = false, $logLevel = 1) {
        if (is_null($code) || is_null($message)) {
            throw new Sys_Exception('No message or Errorcode provided for exception throwing!', 1);
        }
        if ($logError==true) {
            Sys_Log::getInstance()->write($code.' throwed : '.$message, $logLevel);
        }
        parent::__construct($message, $code);
    }
}
?>
