<?php

$templateLoader = Sys_Content_Tpl::getInstance();
$userObj = Sys_Base::getInstance()->getUserObject();

$templateLoader->RainTPL('Content/acp/');
$templateLoader->assign('loginCode', null);

function loginUser($username, $password) {
     $userObj = Sys_Base::getInstance()->getUserObject();
     try {
        $userObj->login($username, $password);
        setcookie('autoLogin', true, time()+24*3600);
        setcookie('username', $username, time()+24*3600);
        setcookie('password', $password, time()+24*3600);
    }
    catch (Sys_User_Exception $e) {
        $templateLoader = Sys_Content_Tpl::getInstance();
        $templateLoader->assign('loginCode', $e->getCode());
    }
}


if(isset($_GET['logout'])) {
    setcookie('autoLogin', '0', 60*60*60);
    $userObj->logout();
} elseif (isset($_POST['username']) && isset($_POST['password'])) {
    loginUser($_POST['username'], $_POST['password']);
} elseif ($_COOKIE['autoLogin']==true) {
    if ($_COOKIE['username'] != '' && $_COOKIE['password'] != '') {
        loginUser($_COOKIE['username'], $_COOKIE['password']);
    }
}

$templateLoader->assign('loggedIn', false);
if ($userObj->isLoggedIn() == true) {
    if ($userObj->isInGroups('sys.user.groups.admin')) {
        $templateLoader->assign('userData', $userObj->getData());
        $templateLoader->assign('loggedIn', true);
    } else {
        $userObj->logout();
        $templateLoader->assign('loginCode', '408');
    }
}

$templateLoader->draw('index');


?>
