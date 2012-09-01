<?php


class Sys_Translation_GTranslate extends Sys_Singleton
{

        private $gTranslateConfig=array ();

        public function __construct()
        {
            $this->gTranslateConfig=Sys_Config::getInstance()->getClassConfigAttr(__CLASS__);
        }

        private function urlFormat($from, $to, $string)
        {
                $parameters = array(
                        "v" => $this->gTranslateConfig['apiVersion'],
                        "q" => $string,
                        "langpair"=> $from.'|'.$to
                );

                $parameters["key"] = $this->gTranslateConfig['apiKey'];
                $url  = "";
                
                foreach($parameters as $k=>$p)
                {
                    $url .= $k."=".urlencode($p)."&";
                }
                return $url;
        }

        public function query($from, $to, $string)
        {
                $queryUrl = $this->urlFormat($from, $to, $string);
                $response = $this->{"request".ucwords($this->gTranslateConfig['requestType'])}($queryUrl);
                return $response;
        }

        private function requestHttp($url)
        {
                return self::evalResponse(json_decode(file_get_contents($this->gTranslateConfig['apiUrl']."?".$url)));
        }

        private function requestCurl($url)
        {
                if (!function_exists("curl_init")) {
                    throw new Sys_Translation_GTranslate_Exception('curlplugin not installed!', 1504);
                }
                
                $ch = curl_init();
                curl_setopt($ch, CURLOPT_URL, $this->gTranslateConfig['apiUrl']);
                curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
                curl_setopt($ch, CURLOPT_REFERER, !empty($_SERVER["HTTP_REFERER"]) ? $_SERVER["HTTP_REFERER"] : "");
                curl_setopt($ch, CURLOPT_POST, 1);
                curl_setopt($ch, CURLOPT_POSTFIELDS, $url);
                $body = curl_exec($ch);
                curl_close($ch);
                return self::evalResponse(json_decode($body));
        }

        private function evalResponse($jsonResponse)
        {
                switch($jsonResponse->responseStatus)
                {
                        case 200:
                                return $jsonResponse->responseData->translatedText;
                                break;
                        default:
                                throw new Sys_Translation_GTranslate_Exception("Unable to perform Translation:".$jsonResponse->responseDetails, 1500);
                        break;
                }
        }



        public function translate($from, $to, $string) {
            $languages_list[0]=$from;
            $languages_list[1]=$to;

            if (Sys_Translation::isValidLanguage($from) && Sys_Translation::isValidLanguage($to)) {
                return $this->query($from, $to, $string);
            } else {
                throw new Sys_Translation_GTranslate_Exception('Languages are not valid!',1502);
            }
        }
}

?>
