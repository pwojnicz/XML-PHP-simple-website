<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html>
<html xsl:version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=Edge, chrome=1" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <title><xsl:value-of select="/db/siteinfo/head" /></title>

    <link rel="stylesheet" href="assets/css/animate.min.css" />
    <link rel="stylesheet" href="assets/css/styles.min.css" />
</head>
<body>
	<header role="banner" class="animated fadeInDown"><div  class="container">
		<h1><a href="index.php"><xsl:value-of select="/db/siteinfo/head" /></a></h1>
		<p><xsl:value-of select="/db/siteinfo//description" /></p>
	</div></header>
	<main class="container animated fadeIn">
