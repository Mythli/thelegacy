<?
    function loadChilds($parentId) {
        $paramObj = new Sys_Database_Parameters();
        $dbObj = Sys_Database::getInstance();
        $retArr = array();

        $paramObj->add('parentId', $parentId);

        $query = "select * from acp_navigation where parent = '{parentId}' order by navOrder;";
        $dbObj->execute($query, true,  $paramObj);

        $navPoints = $dbObj->fetchAll();

        foreach ($navPoints as $row) {
            $tempArr = array(
                'data' => array (
                    'title' => $row['value'],
                    'icon' => BASE_URL.$row['icon']
                ),
                'attributes' => array (
                    'href' => $row['target'],
                    'id' => $row['id']
                )

            );

            $tempArr['children'] = loadChilds($row['id']);
            $retArr[]=$tempArr;
        }

        return $retArr;
    }

    echo json_encode(loadChilds(0));
?>