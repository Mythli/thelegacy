<?php
class Sys_Database_Helper {
      public static function updateEntry($data, $tableName, $id) {
        $paramObj = new Sys_Database_Parameters();
        $paramObj->add('id', $id);

        $colCount = count($data);
        $i = 0;

        $sqlQuery = 'UPDATE '.$tableName.' SET ';

        foreach ($data as $key => $value) {
            if($value{0}=='!') {
                $isFunction=true;
                $value=substr($value,1);
            } else {
                $isFunction=false;
            }
            $paramObj->add($key, $value);
            if($isFunction==true) {
                $sqlQuery .= $key." = {".$key."}";
            } else {
                $sqlQuery .= $key." = '{".$key."}'";
            }
            if ($i<$colCount-1) {
                $sqlQuery.=", ";
            }
            $i++;
        }

        $sqlQuery.=" WHERE id={id};";

        Sys_Database::getInstance()->execute($sqlQuery, true, $paramObj);

        if (Sys_Database::getInstance()->affectedRows()>0) {
            return true;
        } else {
            return false;
        }
    }
}   


   
?>
