<?php

class Sys_Content {

    private $content = array();
    private $folder = null;

    public function __construct($folder = null) {
        $this->folder = $folder;
    }

    public function printContent() {
        $transObj = Sys_Translation::getInstance();
        $templateConfig = Sys_Config::getInstance()->getClassConfigAttr('Sys_Content_Tpl');

        switch ($this->content['type']) {
            case 'content':
                if ($this->content['content'] == '') {
                    throw new Sys_Config_Exception('no content provided!', 903, true);
                } else {
                    $transObj->addKeys($this->content['content']);
                    echo $transObj->translate($this->content['content']);
                }
            break;

            case 'template':
                if ($this->folder != null) {
                    Sys_Content_Tpl::getInstance()->RainTpl($folder);
                } else {
                    Sys_Content_Tpl::getInstance()->RainTpl();
                }
                Sys_Content_Tpl::getInstance()->draw($this->content['contentId']);
            break;

            case 'module':
                if ($this->folder != null) {
                    $fileDestination = BASE_PATH.'/'.$this->folder.'/'.$this->content['contentId'].'.php';
                    if (!file_exists($fileDestination)) {
                        throw new Sys_Content_Exception('Module not found: '. $fileDestination, 904, true);
                    }
                    require ($fileDestination);
                } else {
                    $fileDestination = BASE_PATH.'/'.$templateConfig['destination'].$this->content['contentId'].'.php';
                    if (!file_exists($fileDestination)) {
                        throw new Sys_Content_Exception('Module not found: '.$fileDestination, 905, true);
                    }
                    require ($fileDestination);
                }
            break;        

            default:
                throw new Sys_Config_Exception('invalid content type provided!', 903, true);
            break;

        }
    }

    public function load($contentId, $contentGroup='') {


        $dbObj = Sys_Database::getInstance();
        $paramObj = new Sys_Database_Parameters();
        $userObj = Sys_Base::getInstance()->getUserObject();
        

        $paramObj->add('contentId', $contentId);
        $paramObj->add('contentGroup', $contentGroup);
        $sqlQuery = "SELECT * FROM content where contentId='{contentId}' and contentGroup='{contentGroup}' Limit 0,1;";
        $dbObj->execute($sqlQuery, true, $paramObj);


        if ($dbObj->numRows() > 0) {
            $this->content = $dbObj->fetchAssoc();
            if ($this->content['reqGroups'] == '') {
                $this->printContent();
            } else {
                if ($userObj->isLoggedIn()) {
                    if ($userObj->isInGroups($this->content['reqGroups'])) {
                        $this->printContent();
                    }
                } else {
                    if (Sys_User_Management::checkForGroups('sys.user.groups.guest', $this->content['reqGroups'])) {
                        $this->printContent();
                    } else {
                        throw new Sys_Content_Exception('access denied for guests '.$contentId.'', 902, true);
                    }
                }
            }

        } else {
            throw new Sys_Content_Exception('can´t find content-entry '.$contentId.'', 901, true);
        }
    }
}

?>
