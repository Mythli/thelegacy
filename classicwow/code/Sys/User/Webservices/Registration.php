<?php
$client = new SoapClient('http://www.xmethods.net/sd/2001/BabelFishService.wsdl');
$result = $client->BabelFish('de_en', 'Hallo Welt');
echo $result;
?>
