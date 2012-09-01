<?php
class Sys_Base {
    private static $instance = NULL;
    private $userObject = NULL;

    public static function getInstance() {
        if(self::$instance === NULL) {
            if (isset($_SESSION['sysObj'])) {
                self::$instance = unserialize($_SESSION['sysObj']);
            } else {
                self::$instance = new self;
            }
        }
        return self::$instance;
    }

    public function  __destruct() {
        $_SESSION['sysObj'] = serialize(self::$instance);
    }

    public function getUserObject() {
        if ($this->userObject === NULL) {
            $this->userObject = new Sys_User();
        }
        return $this->userObject;
    }

    public static function applyReplacement($string, $data) {
        foreach ($data as $key => $value) {
            $string = str_replace('{'.$key.'}', $value, $string);
        }
        return $string;
    }

    public static function rand_str($length = 32, $chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890') { $chars_length = (strlen($chars) - 1); $string = $chars{rand(0, $chars_length)}; for ($i = 1; $i < $length; $i = strlen($string)) { $r = $chars{rand(0, $chars_length)}; if ($r != $string{$i - 1}) $string .= $r; } return $string; }

    public static function extractNumbers($string) {
        preg_match_all('/([\d]+)/', $string, $match);
        return $match[0];
    }

}
?>
