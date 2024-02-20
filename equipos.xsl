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

                    <!-- Recoge la url del entrenador del xml -->
                    <h1><a href="{equipo/entrenador/url}"><xsl:value-of select="equipo/entrenador/nombre"/></a></h1>
                    
                    <article class="equipos">
                        <h4><xsl:value-of select="equipo/nombre"/></h4>

                        <!-- Variable con el nombre del entrenador del primer equipo -->
                        <xsl:variable name="entren" select="equipo[position()=1]/entrenador/nombre"/>

                        <!-- Aplica la plantilla "jugador" en base a los entrenados por la variable -->
                        <xsl:apply-templates select="equipo[entrenador/nombre=$entren]/jugadores/jugador"/>
                    </article>

                </main>

                <footer>
                    <address>&#169; Desarrollado por info@birt.eus</address>
                </footer>
            </body>
            
        </html>

    </xsl:template>

    <!-- Plantilla para seleccionar los jugadores -->
    <xsl:template match="jugador">
        <xsl:if test="@titular='si'">
            <p><xsl:value-of select="@camiseta"/> - <xsl:value-of select="nombre"/></p>
        </xsl:if>
    </xsl:template>

</xsl:stylesheet>