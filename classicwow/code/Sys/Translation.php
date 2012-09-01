<?php
class Sys_Translation extends Sys_Singleton {
    public $defaultLanguage = 'gb';
    private $language;
    private $country;
    private $localizationGroups = array();
    private $localizationKeys = array();
    public $localizedArray = array();
    private $isLoadedFromDb = false;

    private function __construct() {
        if (!isset($_COOKIE['Language']) || !self::isValidLanzguage($_COOKIE['Language'])) {
            $tmpArr = self::getLanguageFromBrowser('data');
            if (self::isValidLanguage($tmpArr[0][1])) {
                $this->setLanguage($tmpArr[0][1]);
            } else {
                $this->setLanguage($this->defaultLanguage);
            }
        } else {
            $this->setLanguage($_COOKIE['Language']);
        }
        try {
            if (isset($_COOKIE['Country'])) {
               $this->setCountry($_COOKIE['Country']);
            } else {
                $this->setCountry($this->ipToCountry($_SERVER['REMOTE_ADDR']));
            }
        } catch(Sys_Translation_Exception $e) {
            if ($e->getCode()==300) {
                //load default-country from configuration-file.
                $this->country=Sys_Config::getInstance()->getClassConfigAttr(__CLASS__.'_DefaultCountry');
                $this->country['default']=true;
            }
        }
    }

    public function isDefaultCountry() {
       return $this->country['default'];
    }

    public function getCountry() {
        return $this->country;
    }

    public function getLocalizedArray() {
        if ($this->isLoadedFromDb == false) {
            $this->loadFromDb();
        }
        return $this->localizedArray;
    }

    private function ipToCountry($ip) {
        $mysqlObj = Sys_Database::getInstance();
        $ip = ip2long($ip);
        $parameters = new Sys_Database_Parameters();
        $parameters->add('ip', $ip);
        $sqlQuery = "SELECT
                        symbol,
                        largeSymbol,
                        name
                     FROM
                        iplist
                     WHERE
                        IP_from <= '{ip}' AND
                        IP_to >= '{ip}'
                     LIMIT 1;";
        $mysqlObj->execute($sqlQuery, true, $parameters);
        if ($mysqlObj->numRows() > 0) {
            $dataArray = $mysqlObj->fetchAssoc();
            $dataArray['default']=false;
            if (file_exists(BASE_PATH.'/img/icons/flags/'.$dataArray['symbol'].'jpg')) {
                $dataArray['flag'] = BASE_URL.'/img/icons/flags/'.$dataArray['symbol'].'jpg';
            }
            return $dataArray;
        } else {
            throw new Sys_Translation_Exception('no country found', 300);
        }
    }

    private function setCountry($country) {

        $countrySerialized = serialize($country);
        setcookie('Country', $countrySerialized, time()+60*60*365);
        $this->country = $country;
    }

    private function setLanguage($language) {
        $language = strtolower($language);
        setcookie('Language', $language, time()+60*60*365);
        $this->language = $language;
    }

    public static function isValidLanguage($language) {
        $language=strtolower($language);
        $keys = Sys_Config::getInstance()->getLangKeyArr();
        if ( false !== array_search($language, $keys, false)) {
            return true;
        } else {
            return false;
        }
    }

    public function addGroups($groups) {
        if (!is_array($groups)) {
            $groups = explode(',', $groups);
        }
        if (count($groups) != 0 && $this->isLoadedFromDb == true) {
            $this->isLoadedFromDb = false;
        }
        foreach ($groups as $group) {
            if (!in_array($group, $this->localizationGroups)) {
                $this->localizationGroups[] = $group;
            }
        }
    }

    public function addKeys($keys) {
        if (!is_array($keys)) {
            $keys = explode(',', $keys);
        }
        if (count($keys) != 0 && $this->isLoadedFromDb == true) {
            $this->isLoadedFromDb = false;
        }
        foreach ($keys as $key) {
            if (strpos($key, '.') != false) {
                $tmpKey = explode('.', $key);
                if (!in_array($tmpKey[0], $this->localizationGroups)) {
                    $this->localizationKeys[] = $key;
                }
            } else {
                $this->localizationKeys[] = $key;
            }
        }
    }

    private function loadFromDb() {
        if (count($this->localizationGroups) == 0 && count($this->localizationKeys) == 0) {
            throw new Sys_Translation_Exception('nothing to load', 301);
        }
        $sqlQuery = "SELECT
                        *
                     FROM
                        localization
                     WHERE
                        (";
        for ($i = 0; $i < count($this->localizationKeys); $i++) {
            if ($i != count($this->localizationKeys) - 1) {
                $sqlQuery .= "localizationKey = '{key".$i."}' OR ";
            } else {
                $sqlQuery .= "localizationKey = '{key".$i."}'";
            }
        }
        if (count($this->localizationGroups) != 0) {
            if (count($this->localizationKeys) != 0) {
                $sqlQuery .= " OR ";
            }
            for ($i = 0; $i < count($this->localizationGroups); $i++) {
                if ($i != count($this->localizationGroups) - 1) {
                    $sqlQuery .= "localizationKey LIKE '{group".$i."}.%' OR ";
                } else {
                    $sqlQuery .= "localizationKey LIKE '{group".$i."}.%'";
                }
            }
        }
        $sqlQuery .= ") AND language = '{language}';";
        $parameters = new Sys_Database_Parameters();
        $parameters->add('language', $this->language);
        for ($i = 0; $i < count($this->localizationKeys); $i++) {
            $parameters->add('key'.$i, $this->localizationKeys[$i]);
        }
        for ($i = 0; $i < count($this->localizationGroups); $i++) {
            $parameters->add('group'.$i, $this->localizationGroups[$i]);
        }
        $mysqlObj = Sys_Database::getInstance();
        $mysqlObj->execute($sqlQuery, true, $parameters);
        if ($mysqlObj->numRows() == 0) {
            throw new Sys_Translation_Exception('no translations found', 302);
        }
        while ($row = $mysqlObj->fetchObject()) {
            $this->registerTranslation($row->localizationKey, $row->localization);
        }

        

        $this->localizationGroups = array();
        $this->localizationKeys = array();
        $this->isLoadedFromDb = true;
    }

    private function registerTranslation($languageKey, $translation) {
        if (strpos($languageKey, '.') != false) {
            $tmpKeyArr = explode('.', $languageKey);
            $tmpKeyArrCount = count($tmpKeyArr);
            $arrayReference = &$this->localizedArray;
            for ($i = 0; $i < $tmpKeyArrCount; $i++) {
                if ($i != $tmpKeyArrCount - 1) {
                    $arrayReference = &$arrayReference[$tmpKeyArr[$i]];
                } else {
                    $arrayReference[$tmpKeyArr[$i]] = $translation;
                }
            }
        } else {
            $this->localizedArray[$languageKey] = $translation;
        }
    }

    public function translate($languageKey) {
        try {
            if ($this->isLoadedFromDb == false) {
                $this->loadFromDb();
            }


            $translation = '';
            if (strpos($languageKey, '.') != false) {
                $tmpKeyArr = explode('.', $languageKey);
                $tmpKeyArrCount = count($tmpKeyArr);
                $arrayReference = &$this->localizedArray;
                for ($i = 0; $i < $tmpKeyArrCount; $i++) {
                    if ($i != $tmpKeyArrCount - 1) {
                        if (!isset($arrayReference[$tmpKeyArr[$i]])) {
                                Sys_Log::getInstance()->write('translation of '.$languageKey.' failed unkown group '.$tmpKeyArr[$i], 1);
                                return $languageKey;
                        }
                        $arrayReference = &$arrayReference[$tmpKeyArr[$i]];
                    } else {
                        if (!isset($arrayReference[$tmpKeyArr[$i]])) {
                                Sys_Log::getInstance()->write('translation of '.$languageKey.' failed unkown key '.$tmpKeyArr[$i], 1);
                                return $languageKey;
                        }
                        $translation = $arrayReference[$tmpKeyArr[$i]];
                    }
                }
            } else {
                if (!isset($this->localizedArray[$languageKey])) {
                    Sys_Log::getInstance()->write('translation of '.$languageKey.' failed', 1);
                    return $languageKey;
                }
                $translation = $this->localizedArray[$languageKey];
            }

            return $translation;
        } catch(Sys_Translation_Exception $e) {
            return $languageKey;
        }
        }

    public static function getLanguageFromBrowser( $feature, $spare='' )
    {
            // get the languages
            $a_languages = Sys_Config::getInstance()->getClassConfig(__CLASS__.'_AvaibleLanguages');
            $index = '';
            $complete = '';
            $found = false;// set to default value
            //prepare user language array
            $user_languages = array();

            //check to see if language is set
            if ( isset( $_SERVER["HTTP_ACCEPT_LANGUAGE"] ) )
            {
                    $languages = strtolower( $_SERVER["HTTP_ACCEPT_LANGUAGE"] );
                    // $languages = ' fr-ch;q=0.3, da, en-us;q=0.8, en;q=0.5, fr;q=0.3';
                    // need to remove spaces from strings to avoid error
                    $languages = str_replace( ' ', '', $languages );
                    $languages = explode( ",", $languages );
                    //$languages = explode( ",", $test);// this is for testing purposes only

                    foreach ( $languages as $language_list )
                    {
                            // pull out the language, place languages into array of full and primary
                            // string structure:
                            $temp_array = array();
                            // slice out the part before ; on first step, the part before - on second, place into array
                            $temp_array[0] = substr( $language_list, 0, strcspn( $language_list, ';' ) );//full language
                            $temp_array[1] = substr( $language_list, 0, 2 );// cut out primary language
                            //place this array into main $user_languages language array
                            $user_languages[] = $temp_array;
                    }

                    //start going through each one
                    for ( $i = 0; $i < count( $user_languages ); $i++ )
                    {
                            foreach ( $a_languages as $index => $complete )
                            {
                                    if ( $index == $user_languages[$i][0] )
                                    {
                                            // complete language, like english (canada)
                                            $user_languages[$i][2] = $complete;
                                            // extract working language, like english
                                            $user_languages[$i][3] = substr( $complete, 0, strcspn( $complete, ' (' ) );
                                    }
                            }
                    }
            }
            else// if no languages found
            {
                    $user_languages[0] = array( '','','','' ); //return blank array.
            }
            // print_r($user_languages);
            // return parameters
            if ( $feature == 'data' )
            {
                    return $user_languages;
            }

            // this is just a sample, replace target language and file names with your own.
            elseif ( $feature == 'header' )
            {
                    switch ( $user_languages[0][1] )// get default primary language, the first one in array that is
                    {
                            case 'en':
                                    $location = 'english.php';
                                    $found = true;
                                    break;
                            case 'sp':
                                    $location = 'spanish.php';
                                    $found = true;
                                    break;
                            default:
                                    break;
                    }
                    if ( $found )
                    {
                            header("Location: $location");
                    }
                    else// make sure you have a default page to send them to
                    {
                            header("Location: default.php");
                    }
            }
    }


    
}
?>
