<h1>Top 10 Wszech Czasów</h1>

<ul class="inline" id="sort">
    <li><a href="index.php">pozycja <i class="fa fa-arrow-up"></i></a></li>
    <li><a href="index.php?desc">pozycja <i class="fa fa-arrow-down"></i></a></li>
    <li><a href="index.php?sort=title">tytuł <i class="fa fa-arrow-up"></i></a></li>
    <li><a href="index.php?sort=title&amp;desc">tytuł <i class="fa fa-arrow-down"></i></a></li>
    <li><a href="index.php?sort=date">rok <i class="fa fa-arrow-up"></i></a></li>
    <li><a href="index.php?sort=date&amp;desc">rok <i class="fa fa-arrow-down"></i></a></li>
</ul>

<xsl:for-each select="/db/toplist/song">
    <xsl:sort select="@*[name()=$Param] | *[name()=$Param]" data-type="{$sortData}" order="{$sortOrder}" />

    <!-- Variables: -->
    <xsl:variable name="artistID" select="@artist_id" />
    <xsl:variable name="artist" select="/db/artists/artist[@id=$artistID]/name" />
    <xsl:variable name="albumart" select="concat(translate($artist, ' ', '_'), '_', translate(album, ' ', '_'))" />

    <!-- Toplist elements: -->
    <section id="toplist">
        <article><div>
            <aside>
                <span class="pos"><xsl:value-of select="@position" /></span>
                <a href="https://www.youtube.com/watch?v={yt}" class="play" target="_blank"><i class="fa fa-play fa-3x"></i></a>
            </aside>
            <h2><xsl:value-of select="title" /> <span>by <a href="?artist={@artist_id}"><xsl:value-of select="/db/artists/artist[@id=$artistID]/name" /></a> (<xsl:value-of select="date" />)</span></h2>
            <div class="cover">
                <img src="assets/img/covers/{$albumart}.jpg" alt="{album}" />
            </div></div>
        </article>
    </section>
</xsl:for-each>
