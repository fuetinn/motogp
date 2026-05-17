<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html" encoding="UTF-8"/>

    <xsl:template name="render-pilotos">
        <xsl:param name="texto"/>
        <xsl:if test="string-length(normalize-space($texto))">
            <xsl:variable name="value" select="normalize-space(substring-before(concat($texto, ','), ','))"/>
            <li><xsl:value-of select="$value"/></li>
            <xsl:variable name="rest" select="normalize-space(substring-after($texto, ','))"/>
            <xsl:if test="string-length($rest)">
                <xsl:call-template name="render-pilotos">
                    <xsl:with-param name="texto" select="$rest"/>
                </xsl:call-template>
            </xsl:if>
        </xsl:if>
    </xsl:template>

    <xsl:template match="/">
        <div class="equipos-grid">
            <xsl:for-each select="/equipos/equipo">
                <xsl:sort select="normalize-space(nombre)" data-type="text" order="ascending"/>
                <article class="team-card">
                    <div class="team-header">
                        <h3><xsl:value-of select="nombre"/></h3>
                    </div>
                    <div class="team-meta">
                        <span class="team-badge"><xsl:value-of select="moto"/></span>
                        <p><strong>País:</strong> <xsl:value-of select="pais"/></p>
                    </div>
                    <div class="team-pilots">
                        <h4>Pilotos</h4>
                        <ul>
                            <xsl:call-template name="render-pilotos">
                                <xsl:with-param name="texto" select="pilotos"/>
                            </xsl:call-template>
                        </ul>
                    </div>
                </article>
            </xsl:for-each>
        </div>
    </xsl:template>

</xsl:stylesheet>
