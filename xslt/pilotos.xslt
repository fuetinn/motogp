<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="html" encoding="UTF-8"/>

<xsl:template match="/">

<div class="row g-4">

    <xsl:for-each select="/pilotos/piloto">
    <xsl:sort select="puntos" data-type="number" order="descending"/>

        <div class="col-12 col-sm-6 col-md-4 col-lg-3">

            <div class="card piloto-card text-white h-100">

                <div class="card-body">

                    <h3 class="piloto-nombre">
                        <xsl:value-of select="nombre"/>
                    </h3>

                    <p><strong>#</strong> <xsl:value-of select="numero"/></p>
                    <p><strong>País:</strong> <xsl:value-of select="pais"/></p>
                    <p><strong>Equipo:</strong> <xsl:value-of select="equipo"/></p>

                    <hr/>

                    <div class="row text-center">

                        <div class="col-6">
                            <small>Victorias</small>
                            <div><xsl:value-of select="victorias"/></div>
                        </div>

                        <div class="col-6">
                            <small>Podios</small>
                            <div><xsl:value-of select="podios"/></div>
                        </div>

                        <div class="col-6">
                            <small>Poles</small>
                            <div><xsl:value-of select="poles"/></div>
                        </div>

                        <div class="col-6">
                            <small>Puntos</small>
                            <div class="text-warning">
                                <xsl:value-of select="puntos"/>
                            </div>
                        </div>

                    </div>

                </div>

            </div>

        </div>

    </xsl:for-each>

</div>

</xsl:template>

</xsl:stylesheet>