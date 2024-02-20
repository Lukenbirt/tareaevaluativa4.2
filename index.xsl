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
				
				<main class="principal">
						<h1>TRABAJANDO CON PLANTILLAS XSLT</h1>
				</main>

				<footer>
					<address>&#169; Desarrollado por info@birt.eus</address>
				</footer>
			</body>
			
		</html>

	</xsl:template>

</xsl:stylesheet>
