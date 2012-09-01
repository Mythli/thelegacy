<?php if(!defined('IN_RAINTPL')){exit('Hacker attempt');}?><!-- index start -->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <title>Admin Panel - Index</title>
        <?php
$RainTPL_include_obj = Sys_Content_Tpl::getInstance();
$RainTPL_include_obj->assign( $var );
$RainTPL_directory_template_temp = $RainTPL_include_obj->tpl_dir;
$this->tpl_dir = $GLOBALS[ 'RainTPL_tpl_dir' ] = $RainTPL_include_obj->tpl_dir;
$RainTPL_include_obj->draw( "scriptfiles" );
$this->tpl_dir = $GLOBALS[ 'RainTPL_tpl_dir' ] = $RainTPL_directory_template_temp;
 ?>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body id="tab1">
        <div id="headBar">
            <div id="logoText">
                ADMIN PANEL<br />
                <span style="font-size: small; font-weight: normal;">Willkommen im Administrationspanel für Parfüm-Fulia</span>
            </div>
            <div id="loginInfo">
                <?php
	if( $var["loggedIn"] == true ){
?>
                    <div id="loggedInBox">Eingeloggt als <a style="font-style:italic;" href="#"><?php echo $var["userData"]['login'];?></a> <a href="acp.php?contentId=index&logout"><img src="Content/acp/img/icons/logout.png" alt="logout" /></a><br>
                        <span id="clock"></span>
                    </div>
                <?php
	}
	else{
?>
                    <div id="logInBox">
                        <div style="padding-bottom: 8px; font-size:x-small; font-weight:bold;">
                        <?php
		if( $var["loginCode"]==406 ){
?>
                            Dieser Benutzer existiert nicht!
                        <?php
		}
			elseif( $var["loginCode"]==405 ){
?>
                            Dieser Benutzer ist schon eingeloggt!
                        <?php
			}
				elseif( $var["loginCode"]==407 ){
?>
                            Benutzername oder Passwort falsch!
                        <?php
				}
					elseif( $var["loginCode"]==408 ){
?>
                            Zugriffsberechtigung fehlt.
                        <?php
					}
					else{
?>
                            Bitte einloggen.
                        <?php
					}
?>
                        </div>
                        <form method="POST" id="loginForm" name="loginForm" action="acp.php?contentId=index">
                            <input type="text" class="text" name="username" id="username" value="" />
                            <input type="password" class="text" name="password" id="password" value="" />
                            <img src="Content/acp/img/icons/play.png" style="cursor: pointer;" onclick="document.getElementById('loginForm').submit()" alt="login" />
                            <br />
                            <input type="submit" value="login" style="display: none;" />
                        </form>
                    </div>
                <?php
				}
?>
            </div>
            <div id="main">
                <div id="bar">
                    <?php
				if( $var["loggedIn"] == true ){
?>
                    <input type="text" class="text" onkeydown="$.tree.focused().search($(this).val())" name="navigation_search" id="navigation_search" value="" style="position: absolute; margin-top: 15px; z-index: 2;" />
                    <?php
$RainTPL_include_obj = Sys_Content_Tpl::getInstance();
$RainTPL_include_obj->assign( $var );
$RainTPL_directory_template_temp = $RainTPL_include_obj->tpl_dir;
$this->tpl_dir = $GLOBALS[ 'RainTPL_tpl_dir' ] = $RainTPL_include_obj->tpl_dir;
$RainTPL_include_obj->draw( "tab_navigation" );
$this->tpl_dir = $GLOBALS[ 'RainTPL_tpl_dir' ] = $RainTPL_directory_template_temp;
 ?>
                    <?php
				}
?>
                </div>
                <?php
				if( $var["loggedIn"] == true ){
?>
                    <div id="middle">
                        <div id="navigation">
                            <div id="tree">

                            </div>
                        </div>
                        <div id="content">
                                <iframe id="mainContent" name="mainContent" style="width: 800px; border: none;" src="Content/acp/../../acp.php?contentId=system_log" onload="resizeMe(this);"
                                        style="overflow: hidden; border: none;" />

                        </div>
                    </div>
                <?php
				}
?>
            </div>
        </div>
    </body>
</html>

<!-- index - end -->
