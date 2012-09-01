<?php

header("Content-Type: application/octet-stream");
if ($_GET["imageName"]=="") {
	$_GET["imageName"]="full/GoldenReign.jpg"	;
}
header("Content-Disposition: attachment; filename=".$_GET["imageName"]."");




if (file_exists("full/".$_GET["imageName"]."")) {
	echo readfile("full/".$_GET["imageName"]."");	
}
	
?>
