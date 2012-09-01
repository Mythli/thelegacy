<?php
    session_start();
    define('PHP_TAB', "\t");
    define('BASE_PATH', realpath('.'));
    define('CONFIG_FILE', BASE_PATH.'/Config.Xml');
    define('BASE_URL', dirname($_SERVER['SCRIPT_NAME']));

    function __autoload($className) {
        $className = explode('_', $className);
        $classPath = '../';
        for ($i = 0; $i < count($className) - 1; $i++) {
            $classPath .= $className[$i].'/';
        }

        $includeFile = $classPath.$className[$i].'.php';

        if (file_exists($includeFile)) {
            require_once($includeFile);
        } else {
            throw new Exception('Class include of class "'.$className.'" failed!', 9);
        }
    }

    $contentLoader = new Sys_Content();


        Sys_Memcache::getInstance();

/*
	
	$test = Sys_Database::getInstance('main');
	
	$query = new Sys_Database_Query('select * from users where id={id};');
	$query->add('id','66');
	
	$test->execute($query);
        $test->cacheResult();
        var_dump($test->fetchAll());*/
?>
