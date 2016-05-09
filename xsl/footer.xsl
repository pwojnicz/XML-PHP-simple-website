	</main>

    <footer role="contentinfo" class="animated fadeInUp"><div class="container">
        <small><xsl:value-of select="/db/siteinfo/about" /></small>
        <small><xsl:value-of select="/db/siteinfo/author" /></small>
        <small>Źródła: 
        	<xsl:for-each select="/db/siteinfo/sources/source">
				<xsl:sort />
				<a href="{@href}"><xsl:value-of select="." /></a>
				<xsl:if test="not(position() = last())">, </xsl:if>
        	</xsl:for-each>
        </small>
    </div></footer>

</body>
</html>
