<xsl:variable name="artist" select="/db/artists/artist[@id=$Param]" />
<xsl:variable name="main_pic" select="translate($artist/name, ' ', '_')" />

<xsl:choose><xsl:when test="$artist">

<header>
	<div class="artist_img"><img src="assets/img/artists/{$main_pic}.jpg" alt="{$artist/name}" /></div>
	<h1><xsl:value-of select="$artist/name" /></h1>
</header>

<article class="artist_info">
	<p><xsl:value-of select="$artist/bio" /></p>

	<span>
		<span><i class="fa fa-calendar-times-o"></i> Lata działalności: </span>
		<xsl:value-of select="$artist/start-date" /> - 
		<xsl:choose>
			<xsl:when test="$artist/stop-date"><xsl:value-of select="$artist/stop-date" /></xsl:when>
			<xsl:otherwise>do dziś</xsl:otherwise>
		</xsl:choose>
	</span>

	<span>
		<span><i class="fa fa-globe"></i> Pochodzenie: </span>
		<xsl:value-of select="$artist/from" />
	</span>

	<span>
		<span><i class="fa fa-music"></i> Gatunki: </span>
		<xsl:for-each select="$artist/genres/genre">
			<xsl:sort />
			<xsl:value-of select="." />
			<xsl:if test="not(position() = last())">, </xsl:if>
		</xsl:for-each>
	</span>

	<span>
		<span><i class="fa fa-users"></i> Skład: </span>
		<ul>
		<xsl:for-each select="$artist/humans/human">
			<xsl:sort />
			<li>
				<xsl:value-of select="." />
			</li>
		</xsl:for-each>
		</ul>
	</span>
</article>

</xsl:when><xsl:otherwise>
	Brak artysty o takim ID w bazie danych :(
</xsl:otherwise></xsl:choose>