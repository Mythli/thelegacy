<?php
class Sys_User_Registration {
    public static function register($data) {
        if (self::checkEmail($data['email']) == false) {
            throw new Sys_User_Exception('invalid email', 100);
        }
        if (self::checkEmailExist($data['email'])) {
            throw new Sys_User_Exception('Email already in use', 101);
        }
        if (self::checkUsername($data['username']) == false) {
            throw new Sys_User_Exception('invalid username', 102);
        }
        if (self::checkUsernameExists($data['username'])) {
            throw new Sys_User_Exception('username is already in use', 103);
        }
        if (self::checkPassword($data['password'], $data['confirmPassword'])) {
            throw new Sys_User_Exception('password is too short or passwords arensign se´t equal', 104);
        }
        if(!is_bool($data['newsletter'])) {
            throw new Sys_User_Exception('wrong value for newsletter', 105);
        }
        $affirmationCode = sha1(time().$data['username']);
        $hashedPassword = sha1(strtoupper($data['username'].':'.strtoupper($data['password'])));

        $parameters = new Sys_Database_Parameters();
        $parameters->add('username', $data['username']);
        $parameters->add('password', $hashedPassword);
        $parameters->add('email', $data['email']);
        $parameters->add('newsletter', $data['newsletter']);
        $parameters->add('affirmation', $affirmationCode);

        $sqlQuery = "INSERT INTO users
                        (login,
                         password,
                         email,
                         creationdate,
                         newsletter,
                         groups,
                         affirmationCode)
                     VALUES
                        ('{username}',
                         '{password}',
                         '{email}',
                         NOW(),
                         '{newsletter}',
                         'guest',
                         '{affirmation}');";        
        //Sprachklasse laden
        $translation = Sys_Translation::getInstance();
        //Bestätigungs-Email versenden
        $registerMail = Sys_Config::getInstance()->getClassConfig('Sys_Emails_register');
        $mail = new Sys_Mail();

        if (is_null($registerMail)) {
            throw new Sys_User_Exception('Sender-Email is empty!');
        }
        
        $translation->addGroups('mail');

        $mail->setFrom($registerMail);
        $mail->setSubject($translation->translate('mail.subject', false));

        $emailInfo = array(
            'loginname' => $data['username'],
            'password' => $data['password'],
            'email' => $data['email'],
            'activationKey' => $affirmationCode,
        );

        $text = $translation->translate('mail.text', false);
        $text = Sys_Base::applyReplacement($text, $emailInfo);
        $mail->setText($text);

        $html = $translation->translate('mail.html', false);
        $html = Sys_Base::applyReplacement($html, $emailInfo);
        $mail->setHTML($html);        
        //Email absenden
        if (!$mail->send(array($data['email']))) {
            //throw new Sys_User_Exception('Cant send activation email', 150);
        }
        echo 'PENIS';
        Sys_Database::getInstance()->execute($sqlQuery, true, $parameters);
    }
    

    public static function checkEmail($email) {
        if (!preg_match('^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$^', $email)) {
            return false;
        } else {
            return true;
        }
    }

    public static function checkEmailExist($email) {
        $parameters = new Sys_Database_Parameters();
        $parameters->add('email', $email);
        $sqlQuery = "SELECT
                        id
                     FROM
                        users
                     WHERE
                        email = '{email}';";
        Sys_Database::getInstance()->execute($sqlQuery, true, $parameters);
        if (Sys_Database::getInstance()->numRows() == 0) {
            return false;
        } else {
            return true;
        }
    }

    public static function checkUsernameExists($username) {
        $parameters = new Sys_Database_Parameters();
        $parameters->add('login', $username);
        $sqlQuery = "SELECT
                        id
                     FROM
                        users
                     WHERE
                        login = '{login}';";
        Sys_Database::getInstance()->execute($sqlQuery, true, $parameters);
        if (Sys_Database::getInstance()->numRows() == 0) {
            return false;
        } else {
            return true;
        }
    }

    public static function checkUsername($username) {
        if (!preg_match('^((\w|[-_]){4,15})$^', $username)) {
            return false;
        } else {
            return true;
        }
    }

    public static function checkPassword($password, $confirmPassword) {
        if ($password != $confirmPassword) {
            return false;
        }
        if (!preg_match('/^[.]{3,}/', $password)) {
            return false;
        } else {
            return true;
        }
    }

    public static function affirmEmail($affirmationCode) {
        $parameters = new Sys_Database_Parameters();
        $parameters->add('affiCode', $affirmationCode);
        $sqlQuery = "SELECT
                        id,
                        groups
                     FROM
                        users
                     WHERE
                        affirmationCode = '{affiCode}';";
        $mysqlObj = Sys_Database::getInstance();
        $mysqlObj->execute($sqlQuery, true, $parameters);
        if ($mysqlObj->numRows() == 0) {
            throw new Sys_User_Exception('unknown affirmation code');
        } else {
            $userDataObj = $mysqlObj->fetchObject();
            $groupsArray = explode(',', $userDataObj->groups);
            if ( false !== array_search('emailAffirmed', $groupsArray)){
                throw new Sys_User_Exception('user is already in this group', 106);
            }
            $groupsArray[] = 'emailAffirmed';
            $parameters->add('id', $userDataObj->id);
            Sys_User_Management::arrayToGroups($groupsArray, true, $userDataObj->id);

        }
    }
}
?>

