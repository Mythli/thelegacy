<?php $transObj = Sys_Translation::getInstance(); $transObj->addKeys('fulia.labels.welcome'); $transObj->addKeys('fulia.labels.news'); $transObj->addKeys('fulia.labels.offers'); $transObj->addKeys('fulia.labels.topseller');  ?> <?php if(!defined('IN_RAINTPL')){exit('Hacker attempt');}?><!-- content start -->
<div id="mainContent">
    <div style="height: 10px; width: 100%;"></div>
    <div id="mainNav">
        <table border="0" style="margin-top: -2px; margin-left: -2px;" cellpadding="10px">
            <tbody>
                <tr>
                    <td class="normal"><a href="index.php?contentId=index" ><?php echo Sys_Translation::getInstance()->translate('fulia.labels.welcome'); ?></a></td>
                    <td class="hover"><a href="index.php?contentId=news" ><?php echo Sys_Translation::getInstance()->translate('fulia.labels.news'); ?></a></td>
                    <td class="normal"><a href="index.php?contentId=offers" ><?php echo Sys_Translation::getInstance()->translate('fulia.labels.offers'); ?></a></td>
                    <td class="active"><a href="index.php?contentId=topseller" ><?php echo Sys_Translation::getInstance()->translate('fulia.labels.topseller'); ?></a></td>
                </tr>
            </tbody>
        </table>
        <div id="whereYouAre">Willkommen</div>
    </div>
    <div id="leftContent">
        <div class="cat"></div>
        <div class="cat"></div>
    </div>
</div>
<!-- content - end -->
