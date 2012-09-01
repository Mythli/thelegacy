<?php $transObj = Sys_Translation::getInstance(); $transObj->addKeys('fulia.title'); $transObj->addKeys('fulia.labels.register'); $transObj->addKeys('fulia.labels.impressum'); $transObj->addKeys('fulia.labels.contact'); $transObj->addKeys('fulia.title');  ?> <?php if(!defined('IN_RAINTPL')){exit('Hacker attempt');}?><!-- index start -->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title><?php echo Sys_Translation::getInstance()->translate('fulia.title'); ?></title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <?php
$RainTPL_include_obj = Sys_Content_Tpl::getInstance();
$RainTPL_include_obj->assign( $var );
$RainTPL_directory_template_temp = $RainTPL_include_obj->tpl_dir;
$this->tpl_dir = $GLOBALS[ 'RainTPL_tpl_dir' ] = $RainTPL_include_obj->tpl_dir;
$RainTPL_include_obj->draw( "scriptfiles" );
$this->tpl_dir = $GLOBALS[ 'RainTPL_tpl_dir' ] = $RainTPL_directory_template_temp;
 ?>
  </head>
  <body>
      <div id="center">
          <div id="headBar">
              <div id="menu">
                  <span><a href="index.php?contentId=register"><?php echo Sys_Translation::getInstance()->translate('fulia.labels.register'); ?></a> |</span>
                  <span><a href="index.php?contentId=impressum"><?php echo Sys_Translation::getInstance()->translate('fulia.labels.impressum'); ?></a> |</span>
                  <span><a href="index.php?contentId=contact"><?php echo Sys_Translation::getInstance()->translate('fulia.labels.contact'); ?></a></span>
              </div>
              <div id="showCartButton" onclick="showCart();"></div>
              <div id="banner">
                  <table border="0">
                      <tbody>
                          <tr>
                              <td id="logo">
                                  <img src="Content/site/img/logo.png" onclick="window.location = 'index.php?contentId=index';" alt='<?php echo Sys_Translation::getInstance()->translate('fulia.title'); ?>' />
                              </td>
                              <td id="ad" style="">
                                <div id="slider">
                                    <ul>
                                        <li><img src="Content/site/img/banner_1.png" alt="" /></li>
                                        <li><img src="http://127.0.0.1/cwow/Content/acp/img/headHeader.png" alt="" /></li>
                                    </ul>
                                 </div>
                              </td>
                          </tr>
                      </tbody>
                  </table>
              </div>
              <img src="Content/site/img/decorationPoints.png" alt="" id="decorationPoints" />
              <div id="content">
                  <?php
$RainTPL_include_obj = Sys_Content_Tpl::getInstance();
$RainTPL_include_obj->assign( $var );
$RainTPL_directory_template_temp = $RainTPL_include_obj->tpl_dir;
$this->tpl_dir = $GLOBALS[ 'RainTPL_tpl_dir' ] = $RainTPL_include_obj->tpl_dir;
$RainTPL_include_obj->draw( "content" );
$this->tpl_dir = $GLOBALS[ 'RainTPL_tpl_dir' ] = $RainTPL_directory_template_temp;
 ?>
              </div>

          </div>
      </div>
  </body>
</html>

<!-- index - end -->
