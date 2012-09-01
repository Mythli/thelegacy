<?php
ini_set('error_reporting', E_ALL);

session_start();
define('BASE_PATH', realpath('.'));
define('BASE_URL', dirname($_SERVER['SCRIPT_NAME']));
define('IMAGE_PATH', BASE_PATH.'/img');

function __autoload($className) {
    $className = explode('_', $className);
    $classPath = '';
    for ($i = 0; $i < count($className) - 1; $i++) {
        $classPath .= $className[$i].'/';
    }

    if (file_exists($classPath.$className[$i].'.php')) {
        require_once($classPath.$className[$i].'.php');
    }
}

Sys_Translation::getInstance()->addGroups('global,main');
//Sys_Base::getInstance()->getUserObject()->login('Peter','Hodenkrebs');

if (isset($_GET['contentId'])) {
    $contentId = $_GET['contentId'];
} elseif (isset($_POST['contentId'])) {
    $contentId = $_POST['contentId'];
} else {
    $contentId = 'index';
}

$contentLoader = new Sys_Content('Content/acp/');
$templateLoader = Sys_Content_Tpl::getInstance();
$templateLoader->RainTPL('Content/acp/');

try {
    $contentLoader->load($contentId, 'acp');
} catch (Sys_Content_Exception $e) {
    $errorCode = $e->getCode();

    $templateLoader->assign('modulName', $contentId);

    switch ($errorCode) {
        case 901:
            $templateLoader->draw('error/content_not_found');
        break;

        case 902:
            $templateLoader->draw('error/login_user');
        break;

        case 903:
            $templateLoader->draw('error/invalid_content_type');
        break;

        case 904:
            $templateLoader->draw('error/module_not_found');
        break;

        case 905:
           $templateLoader->draw('error/module_not_found');
        break;

        default:
            $templateLoader->draw('error/system_error');
        break;
    }


}

?>


