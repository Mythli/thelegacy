<?php
class Sys_User_Management {

    public static function updateUser($data, $userId) {
      return Sys_Database_Helper::updateEntry($data, 'users', $userId);
    }

    public static function arrayToGroups($groups, $saveToDb=false, $userId=null) {
       $groupString = implode(',', $groups);
        if ($saveToDb == true) {
            if ($userId == null) { throw new Sys_User_Exception("Userid cant be null", 501); }
            self::updateUser(array ('groups' => $groupString), $userId);
        }

        return $groupString;
    }

    public static function groupsToArray($groupString) {
        return explode(',', $groupString);
    }

    public static function checkForGroups($groups, $userGroups) {
        if (!is_array($groups)) { $groups=self::groupsToArray($groups); }
        if (!is_array($userGroups)) { $userGroups=self::groupsToArray($userGroups); }

        foreach ($groups as $group) {

            if (array_search($group, $userGroups) === false) {
                return false;
            }
        }

        return true;
    }

    public static function getUserGroups($userID) {
        $paramObj= new Sys_Database_Parameters();
        $paramObj->add('id', $userID);

        $sqlQuery="select groups from users where id={id};";
        Sys_Database::getInstance()->execute($sqlQuery, true, $paramObj);
        return Sys_Database::getInstance()->fetchAssoc();
    }

    public static function addGroupToUser($group, $userID) {
        $groupString=self::getUserGroups($userID);
        $groups=self::groupsToArray($groupString);

        if (!Sys_Groups::validateGroups($group)) {
            throw new Sys_User_Exception('group is not valid!', 600);
        }
        $groups[]=$group;
        return self::updateUser(array ('groups' => $groups), $userId);
    }

    public static function removeGroupFromUser($group, $userID) {
        $groupString=self::getUserGroups($userID);
        $groups=self::groupsToArray($groupString);

        if (!Sys_Groups::validateGroups($group)) {
            throw new Sys_User_Exception('group is not valid!', 600);
        }

        unset($groups[$group]);
        return self::updateUser(array ('groups' => $groups), $userId);
    }

    public static function deleteUser($userId) {
        $paramObj=new Sys_Database_Parameters();
        $paramObj->add('id', $userId);

        $sqlQuery="DELETE FROM users where id={id};";
        Sys_Database::getInstance()->execute($sqlQuery, true, $paramObj);

        if (Sys_Database::getInstance()->affectedRows()>0) {
            return true;
        } else {
            return false;
        }

    }
}
?>
