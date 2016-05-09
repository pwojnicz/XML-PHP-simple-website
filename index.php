<?php

function createPage($content, $param = null, $sortDesc = null) {

/* LOAD & PROCESS =================================== */

    // xml content
    $xml = file_get_contents('xml/db.xml');

    // xsl content
    $styles = file_get_contents('xsl/header.xsl');
    $styles.= file_get_contents('xsl/'.$content.'.xsl'); // xsl content file
    $styles.= file_get_contents('xsl/footer.xsl');

    // load xsl
    $xslDoc = new DOMDocument();
    $xslDoc->loadXML($styles);

    // load xml
    $xmlDoc = new DOMDocument();
    $xmlDoc->loadXML($xml);

    // process xsl
    $proc = new XSLTProcessor();
    $proc->importStylesheet($xslDoc);
    
/* SET PARAMS & CREATE SORTING =================================== */

    // set param
    if ($param) $proc->setParameter('', 'Param', $param);

    // set sorting
    if ($param && $sortDesc) $proc->setParameter('', 'sortOrder', 'descending');
    else $proc->setParameter('', 'sortOrder', 'ascending');

    // set sorting datatype
    if ($param == "title") $proc->setParameter('', 'sortData', 'text');
    else $proc->setParameter('', 'sortData', 'number');

/* RETURN DATA =================================== */

    $return = $proc->transformToXML($xmlDoc);
    return $return;
}

if ($_GET) {

    // artist page
    if (isset($_GET['artist'])) 
        echo createPage('artist', $_GET['artist']);

    // index page: sort sth desc
    else if (isset($_GET['sort']) && isset($_GET['desc']))
        echo createPage('toplist', $_GET['sort'], true);

    // index page: sort sth asc
    else if (isset($_GET['sort']))
        echo createPage('toplist', $_GET['sort']);

    // index: sort @position desc
    else if (isset($_GET['desc']))
        echo createPage('toplist', 'position', true);

}

// index: sort @position asc
else echo createPage('toplist', 'position');

?>