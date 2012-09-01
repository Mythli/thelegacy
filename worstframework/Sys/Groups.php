<?php
class Sys_Groups {
    public static function validateGroups($groups) {
        if (!is_array($groups)) { $groups=Sys_User_Management::groupsToArray($groups); }

        $mysqlObj = Sys_Database::getInstance();
        $paramObj = new Sys_Database_Parameters();
        $groupCount = count($groups);
        $i = 0;
        $sqlQuery = "SELECT
                        id
                     FROM
                        user_groups
                     WHERE ";
        foreach ($groups as $key => $value) {
            $paramObj->add($key, $value);
            $sqlQuery .= "groupName = '{".$key."}'";
            if ($i < $groupCount - 1) {
                $sqlQuery .= " OR ";
            }
            $i++;
        }

        $sqlQuery .= " LIMIT 0, 1;";
        
        $mysqlObj->execute($sqlQuery, true, $paramObj);
        if ($mysqlObj->numRows() >= $groupCount) {
            return true;
        } else {
            return false;
        }
    }

    public static function createGroup($groupName) {
        if (self::validateGroups($groupName)) {
            throw new Sys_Exception('groupname '.$groupName.' is already in use');
        }
        $mysqlObj = Sys_Database::getInstance();
        $parameters = new Sys_Database_Parameters();
        $parameters->add('groupName', $groupName);
        $sqlQuery = "INSERT INTO user_groups
                        (groupName)
                     VALUES
                        '{groupName}';";
        $mysqlObj->execute($sqlQuery, true, $parameters);
        Sys_Log::getInstance()->write('creating group with name '.$groupName, 1);
    }

    public static function getUsersFromGroup($groupName) {
        if (!self::validateGroups($groupName)) {
            throw new Sys_Exception('unknown group '.$groupName);
        }
        $mysqlObj = Sys_Database::getInstance();
        $sqlQuery = "SELECT
                        *
                     FROM
                        users;";
        $mysqlObj->execute($sqlQuery, false);
        $dataArray = $mysqlObj->fetchAll();
        $userArray = array();
        foreach($dataArray as $user) {
            $grpArr = explode(',', $user['groups']);
            if (in_array($groupName, $grpArr)) {
                $userArray[] = $user;
            }
        }
        return $userArray;
    }

    public static function deleteGroup($groupName) {
        if (!self::validateGroups($groupName)) {
            throw new Sys_Exception('cant delete unknown group');
        }
        $usersInGroup = self::getUsersFromGroup($groupName);
        $mysqlObj = Sys_Database::getInstance();
        $parameters = new Sys_Database_Parameters();
        if (count($usersInGroup) != 0) {            
            foreach($usersInGroup as $users) {
                $sqlQuery = "SELECT
                                groups
                             FROM
                                users
                             WHERE
                                id = '{id}';";
                $parameters->clear();
                $parameters->add('id', $users['id']);
                $mysqlObj->execute($sqlQuery, true, $parameters);
                $userData = $mysqlObj->fetchAssoc();
                $groupArray = explode(',', $userData['groups']);
                unset($groupArray[array_search($groupName, $groupArray)]);
                $userData['groups'] = implode(',', $groupArray);
                $parameters->add('groups', $userData['groups']);
                $sqlQuery = "UPDATE
                                users
                             SET
                                groups = '{groups}'
                             WHERE
                                id = '{id}';";
                $mysqlObj->execute($sqlQuery, true, $parameters);
                Sys_Log::getInstance()->write('removing group '.$groupName.' from user '.$userData['login'], 1);
            }
        }
        $sqlQuery = "DELETE FROM
                        user_groups
                     WHERE
                        groupName = '{groupName}';";
        $parameters->clear();
        $parameters->add('groupName', $groupName);
        $mysqlObj->execute($sqlQuery, true, $groupName);
        Sys_Log::getInstance()->write('deleting group '.$groupName, 1);
    }
}
?>