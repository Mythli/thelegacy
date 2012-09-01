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

    function arrayToStr(array $arr) {
        $arrCount = count($arr);

        if ($arrCount <= 0) {
            return "= array ();";
        }

        $arrStr = '';
        $i = 0;

        foreach ($arr as $key => $value) {
            if (!is_array($key)) {
                $arrStr.= "'".$key."' => ";
                if (is_array($value)) {
                    $arrCount = count($value);
                    if ($arrCount > 0) {
                        $arrStr .= ' array (';
                        $arrStr .= arrayToStr($value);
                    }
                    $arrStr=$arrStr .= ')';
                } else {
                    if (is_int($value)) {
                        $arrStr .= ''.$value.''.'';
                    } else {
                        $arrStr .= '\''.$value.''.'\'';
                    }

                    $arrStr .= ''.$arrCount. ' '.$i;

                    
                }
                if ($i < $arrCount-1) {
                        $arrStr .= ', ';
                }
                
                $i++;

            }
        }
        return $arrStr;
    }

    $arr = array (
        'test' => 'awddwa',
        'peter' => array (
            'testinebene2' =>0
        )
    );

    echo '<pre>';
    //echo arrayToStr(Sys_Config::getInstance()->getClassConfig('Sys_File'));
    echo '</pre>';
	
	$test = new Sys_Database('main');
	
	$query = new Sys_Database_Query('select * from users where id={id};');
	$query->add('id','1');
	
	$test->execute($query);
        var_dump($test->fetchAll());
?>
