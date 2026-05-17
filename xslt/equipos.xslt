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
                <xsl:variable name="teamName" select="normalize-space(nombre)"/>
                <xsl:variable name="bannerColor">
                    <xsl:choose>
                        <xsl:when test="$teamName='Aprilia'">#020202</xsl:when>
                        <xsl:when test="$teamName='Ducati Lenovo Team'">#D40000</xsl:when>
                        <xsl:when test="$teamName='Gresini'">#111111</xsl:when>
                        <xsl:when test="$teamName='Honda HCR'">#E60012</xsl:when>
                        <xsl:when test="$teamName='Honda LCR'">#000000</xsl:when>
                        <xsl:when test="$teamName='Yamaha'">#0F3D82</xsl:when>
                        <xsl:when test="$teamName='VR46'">#000000</xsl:when>
                        <xsl:when test="$teamName='Prima Pramac'">#E60012</xsl:when>
                        <xsl:when test="$teamName='KTM'">#F15A24</xsl:when>
                        <xsl:when test="$teamName='KTM Tech3'">#F15A24</xsl:when>
                        <xsl:when test="$teamName='Trackhouse'">#002B5B</xsl:when>
                        <xsl:otherwise>#222222</xsl:otherwise>
                    </xsl:choose>
                </xsl:variable>
                <xsl:variable name="accentColor">
                    <xsl:choose>
                        <xsl:when test="$teamName='Aprilia'">#FFD600</xsl:when>
                        <xsl:when test="$teamName='Ducati Lenovo Team'">#1A1A1A</xsl:when>
                        <xsl:when test="$teamName='Gresini'">#E67E22</xsl:when>
                        <xsl:when test="$teamName='Honda HCR'">#111111</xsl:when>
                        <xsl:when test="$teamName='Honda LCR'">#E60012</xsl:when>
                        <xsl:when test="$teamName='Yamaha'">#FFFFFF</xsl:when>
                        <xsl:when test="$teamName='VR46'">#F2D400</xsl:when>
                        <xsl:when test="$teamName='Prima Pramac'">#1F1F1F</xsl:when>
                        <xsl:when test="$teamName='KTM'">#141414</xsl:when>
                        <xsl:when test="$teamName='KTM Tech3'">#0A0A0A</xsl:when>
                        <xsl:when test="$teamName='Trackhouse'">#FFD700</xsl:when>
                        <xsl:otherwise>#d40000</xsl:otherwise>
                    </xsl:choose>
                </xsl:variable>
                <xsl:variable name="textColor">
                    <xsl:choose>
                        <xsl:when test="$teamName='Aprilia'">#111111</xsl:when>
                        <xsl:otherwise>#FFFFFF</xsl:otherwise>
                    </xsl:choose>
                </xsl:variable>
                <article class="team-card" style="border-color: {$accentColor};">
                    <div class="team-header" style="background: {$bannerColor}; color: {$textColor};">
                        <h3><xsl:value-of select="nombre"/></h3>
                    </div>
                    <div class="team-meta">
                        <span class="team-badge" style="background: {$accentColor}; color: {$textColor};"><xsl:value-of select="moto"/></span>
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
