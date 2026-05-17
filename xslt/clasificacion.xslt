<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="UTF-8" indent="yes"/>

<xsl:template match="/">

<div class="container py-5">

    <h1 class="text-center text-danger mb-5">
        Clasificación de Pilotos
    </h1>

    <div class="row gx-4 gy-4 clasificacion-layout">

        <div class="col-12 col-xl-8 pilots-column">
            <div class="row g-4">
                <xsl:for-each select="datos/pilotos/piloto">
                    <xsl:sort select="puntos" data-type="number" order="descending"/>

                    <div class="col-12 col-md-6">
                        <div class="card piloto-card bg-black border-danger text-white h-100">
                            <div class="card-body position-card">
                                <span class="position-badge">#<xsl:value-of select="position()"/></span>
                                <h3 class="piloto-nombre">
                                    <xsl:value-of select="nombre"/>
                                </h3>

                                <p><strong>Número:</strong> <xsl:value-of select="numero"/></p>
                                <p><strong>País:</strong> <xsl:value-of select="pais"/></p>
                                <p><strong>Equipo:</strong> <xsl:value-of select="equipo"/></p>

                                <hr/>

                                <div class="row text-center">
                                    <div class="col-6">
                                        <h5>Victorias</h5>
                                        <p><xsl:value-of select="victorias"/></p>
                                    </div>
                                    <div class="col-6">
                                        <h5>Podios</h5>
                                        <p><xsl:value-of select="podios"/></p>
                                    </div>
                                    <div class="col-6">
                                        <h5>Poles</h5>
                                        <p><xsl:value-of select="poles"/></p>
                                    </div>
                                    <div class="col-6">
                                        <h5>Puntos</h5>
                                        <p class="text-warning fs-4"><xsl:value-of select="puntos"/></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </xsl:for-each>
            </div>
        </div>

        <div class="col-12 col-xl-4 teams-column">
            <h2 class="text-danger mb-4">Equipos</h2>
            <xsl:for-each select="datos/equipos/equipo">
                <div class="card team-card bg-black border-danger text-white mb-4">
                    <div class="card-body">
                        <h3><xsl:value-of select="nombre"/></h3>
                        <p><strong>País:</strong> <xsl:value-of select="pais"/></p>
                        <p><strong>Moto:</strong> <xsl:value-of select="moto"/></p>
                        <p><strong>Pilotos:</strong> <xsl:value-of select="pilotos"/></p>
                    </div>
                </div>
            </xsl:for-each>
        </div>

    </div>

</div>

</xsl:template>

</xsl:stylesheet>
