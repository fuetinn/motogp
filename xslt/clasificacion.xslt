<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="UTF-8" indent="yes"/>

<xsl:template match="/">

<div class="container py-5">

    <h1 class="text-center text-danger mb-5">
        Clasificación de Pilotos
    </h1>

    <div class="row gx-4 gy-4 diseño-clasificacion">

        <div class="col-12 col-xl-8 columna-pilotos">
            <div class="row g-4">
                <xsl:for-each select="datos/pilotos/piloto">
                    <xsl:sort select="puntos" data-type="number" order="descending"/>

                    <div class="col-12">
                        <div class="card tarjeta-piloto bg-black border-danger text-white h-100">
                            <div class="card-body tarjeta-posicion">
                                <span class="distintivo-posicion">#<xsl:value-of select="position()"/></span>
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

        <div class="col-12 col-xl-4 columna-equipos">
            <h2 class="text-danger mb-4">Equipos</h2>
            <div class="row g-4">
                <xsl:for-each select="datos/equipos/equipo">
                    <xsl:variable name="teamName" select="nombre"/>
                    <xsl:sort select="sum(/datos/pilotos/piloto[equipo=$teamName]/puntos)" data-type="number" order="descending"/>
                    <div class="col-12">
                        <div class="card tarjeta-equipo bg-black border-danger text-white h-100">
                            <div class="card-body tarjeta-posicion">
                                <span class="distintivo-posicion">#<xsl:value-of select="position()"/></span>
                                <h3 class="piloto-nombre">
                                    <xsl:value-of select="nombre"/>
                                </h3>
                                <p><strong>Puntos:</strong> <xsl:value-of select="sum(/datos/pilotos/piloto[equipo=$teamName]/puntos)"/></p>
                                <p><strong>País:</strong> <xsl:value-of select="pais"/></p>
                                <p><strong>Moto:</strong> <xsl:value-of select="moto"/></p>
                                <p><strong>Pilotos:</strong> <xsl:value-of select="pilotos"/></p>
                            </div>
                        </div>
                    </div>
                </xsl:for-each>
            </div>
        </div>

    </div>

</div>

</xsl:template>

</xsl:stylesheet>
