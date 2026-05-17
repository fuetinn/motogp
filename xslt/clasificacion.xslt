<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="UTF-8" indent="yes"/>

<xsl:template match="/">

<html>

<head>

    <meta charset="UTF-8"/>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"/>

    <!-- CSS propio -->
    <link rel="stylesheet" href="../css/pilotosstyle.css"/>

    <title>Clasificación MotoGP</title>

</head>

<body class="bg-dark text-white">

<div class="container py-5">

    <h1 class="text-center text-danger mb-5">
        Clasificación de Pilotos
    </h1>

    <div class="row g-4">

        <!--ordenar automáticamente -->
        <xsl:for-each select="pilotos/piloto">

            <!-- ordenar por puntos -->
            <xsl:sort select="puntos"
            data-type="number"
            order="descending"/>

            <div class="col-12 col-md-6">

                <div class="card bg-black border-danger text-white h-100">

                    <div class="card-body">

                        <!-- posición -->
                        <h2 class="text-danger">
                            #
                            <xsl:value-of select="position()"/>
                        </h2>

                        <!-- nombre -->
                        <h3>
                            <xsl:value-of select="nombre"/>
                        </h3>

                        <p>
                            <strong>Número:</strong>
                            <xsl:value-of select="numero"/>
                        </p>

                        <p>
                            <strong>País:</strong>
                            <xsl:value-of select="pais"/>
                        </p>

                        <p>
                            <strong>Equipo:</strong>
                            <xsl:value-of select="equipo"/>
                        </p>

                        <hr/>

                        <div class="row text-center">

                            <div class="col-6">
                                <h5>Victorias</h5>
                                <p>
                                    <xsl:value-of select="victorias"/>
                                </p>
                            </div>

                            <div class="col-6">
                                <h5>Podios</h5>
                                <p>
                                    <xsl:value-of select="podios"/>
                                </p>
                            </div>

                            <div class="col-6">
                                <h5>Poles</h5>
                                <p>
                                    <xsl:value-of select="poles"/>
                                </p>
                            </div>

                            <div class="col-6">
                                <h5>Puntos</h5>

                                <p class="text-warning fs-4">
                                    <xsl:value-of select="puntos"/>
                                </p>

                            </div>

                        </div>

                    </div>

                </div>

            </div>

        </xsl:for-each>

    </div>

</div>

</body>
</html>

</xsl:template>

</xsl:stylesheet>