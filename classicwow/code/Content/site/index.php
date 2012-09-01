<?php

$templateLoader = Sys_Content_Tpl::getInstance();
$userObj = Sys_Base::getInstance()->getUserObject();

$templateLoader->RainTPL('Content/site/');



$templateLoader->draw('index');

?>
