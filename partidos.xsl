<?xml version="1.0" encoding="utf-8"?>

<!--    Módulo: Lenguaje de marcas y sistemas de gestión de la información
        Unidad 4: Transformación de datos
        Tarea Evaluativa 2: XSLT
        Autor: Lucas Camarero Pérez
        Fecha: 16-02-2024
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output encoding="utf-8" method="html" doctype-system="about:legacy-doctype" />

    <!-- Plantilla principal: intercalamos código HTML con datos XML -->
    <xsl:template match="/club_voleibol" >

        <html lang="es">

            <head>
                <link href="./css/estilo.css" rel="stylesheet" type="text/css" />
                <meta name="description" content="Página principal" />
                <title>titulo de la web</title>
            </head>

            <body>
                <header>
                    <img src= "./img/logotipo.png" alt= "Reservas" />
                    <a href="tienda.xml">Tienda</a>
                    <a href="equipos.xml">Equipos</a>
                    <a href="partidos.xml">Partidos</a>
                </header>
                
                <main>
                    <h1>PARTIDOS</h1>
                    <table>
                        <tr>
                            <th>PARTIDO</th>
                            <th>FECHA</th>
                            <th>RESULTADO</th>
                        </tr>

                        <!-- Bucle para recorrer los partidos en el xml -->
                        <xsl:for-each select="partido">

                            <!-- Se ordenan por fecha mas cercana -->
                            <xsl:sort select="fecha" order="descending"/>
                                    
                                <!-- Mostrar solo los partidos jugados en Lima -->
                                <xsl:if test="lugar/@ciudad='Lima'">
                                    <tr>
                                        <td><xsl:value-of select="equipos/local"/> - <xsl:value-of select="equipos/visitante"/></td>
                                        <td><xsl:value-of select="fecha"/></td>

                                        <!-- Mostrar en azul el resultado cuando gana el visitante -->
                                        <xsl:choose>
                                            <xsl:when test="equipos/local/@puntuacion&lt;equipos/visitante/@puntuacion">
                                                <td class="azul"><xsl:value-of select="equipos/local/@puntuacion"/> - <xsl:value-of select="equipos/visitante/@puntuacion"/></td>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <td><xsl:value-of select="equipos/local/@puntuacion"/> - <xsl:value-of select="equipos/visitante/@puntuacion"/></td>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </tr>
                                </xsl:if>

                        </xsl:for-each>

                    </table>			
                </main>

                <footer>
                    <address>&#169; Desarrollado por info@birt.eus</address>
                </footer>
            </body>

        </html>

    </xsl:template>

</xsl:stylesheet>