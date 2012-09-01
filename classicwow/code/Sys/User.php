<?php
class Sys_User {
    private $groups = array('guest');
    private $data = array();

    public function login($loginname, $password) {
        if ($this->isLoggedIn()) {
            throw new Sys_User_Exception('User already logged in', 405);
        }
        $mysqlObj = Sys_Database::getInstance();
        $sqlQuery = "SELECT
                        *
                     FROM
                        users
                     WHERE
                        login = '{loginname}' OR
                        email = '{loginname}'
                     LIMIT 0, 1;";
        $parameters = new Sys_Database_Parameters();
        $parameters->add('loginname', $loginname);
        $mysqlObj->execute($sqlQuery, true, $parameters);
        if ($mysqlObj->numRows() == 0) {
            throw new Sys_User_Exception('User dont exist!', 406);
        }
        $dataObj = $mysqlObj->fetchObject();
        $userId = $dataObj->id;
        $userName = $dataObj->login;
        $hashedPassword = sha1(strtoupper($userName).':'.strtoupper($password));
        $parameters->clear();
        $parameters->add('id', $userId);
        $parameters->add('password', $hashedPassword);
        $sqlQuery = "SELECT
                        *
                     FROM
                        users
                     WHERE
                        id = '{id}' AND
                        password = '{password}'
                     LIMIT 0, 1;";
        $mysqlObj->execute($sqlQuery, true, $parameters);
        if ($mysqlObj->numRows() == 0) {
            throw new Sys_User_Exception('Password does not match to user!', 407);
        }
        $this->data = $mysqlObj->fetchAssoc();
        $this->groups = Sys_User_Management::groupsToArray($this->data['groups']);

        $data=array ('lastip' => $_SERVER['REMOTE_ADDR'], 'lastlogin' => '!NOW()' );

        Sys_User_Management::updateUser($data, $userId);

        return true;


    }

    public function getData() {
        if (!$this->isLoggedIn()) {
            throw new Sys_User_Exception('cant get data if user is´nt logged in', 420);
        }

        return $this->data;
    }

    public function addGroup($groupName) {
        if (!$this->isLoggedIn()) {
            throw new Sys_User_Exception('cant add group to user, when user isnt logged in', 401);
        }
        if (!Sys_Groups::validateGroups($groupName)) {
            throw new Sys_User_Exception('unknown group '.$groupName, 402);
        }
        if ($this->isInGroups($groupName)) {
            throw new Sys_User_Exception('user is already in group '.$groupName, 403);
        }
        $this->groups[] = $groupName;
        $groupString = Sys_User_Management::arrayToGroups($this->groups);
        $this->data['groups'] = $groupString;
        return Sys_User_Management::updateUser(array ('groups' => $groupString), $this->data['id']);
    }

    public function removeGroup ($groupName) {
        if (!$this->isLoggedIn()) {
            throw new Sys_User_Exception('cant remove group from user, when user isnt logged in', 404);
        }
        if ($this->isInGroups($groupName) == true && Sys_Groups::validateGroups($groupName) == true) {

            unset($this->groups[array_search($groupName, $this->groups)]);

            $groupString = Sys_User_Management::arrayToGroups($this->groups);
            $this->data['groups'] = $groupString;
            return Sys_User_Management::updateUser(array ('groups' => $groupString), $this->data['id']);
        }
    }

    public function isInGroups($groups) {
        return Sys_User_Management::checkForGroups($groups, $this->groups);

       
    }

     public function isLoggedIn() {
        if (isset($this->data['id'])) {
            return true;
        } else {
            return false;
        }
    }

    public function logout() {
        $this->data = array('guest');
        $this->groups = array();
    }

    public function delete() {
        if (Sys_User_Management::deleteUser($this->data['id'])) {
            //TODO: send email notification.
            logout();
            return true;
        } else {
            return false;
        }

    }


}
?>
