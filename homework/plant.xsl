<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
	<xsl:template match="CATALOG">
		<html>
			<head>
				<title>Plant Catalog</title>
				<link rel="stylesheet" type="text/css" href="https://aewingate.github.io/css/main.css"/>
			</head>
			<body>
				<h3>Plant Catalog</h3>
				<p>Below is a listing of the plants sold at our nursery. For each plant, the table lists the common name, the botanical name in Latin, its <a href="https://planthardiness.ars.usda.gov/PHZMWeb/Default.aspx">hardiness or growing zone</a>, how much light it needs, the price in USD, and an availability barcode.</p>
				<table>
					<tr>
						<th>Common name</th>
						<th>Botanical name</th>
						<th>Hardiness zone</th>
						<th>Light needs</th>
						<th>Price</th>
						<th>Availability</th>
					</tr>
					<xsl:for-each select="child::PLANT">
						<xsl:sort select="."/>
						<tr>
							<td>
								<xsl:value-of select="./COMMON"/>
							</td>
							<td>
								<xsl:value-of select="./BOTANICAL"/>
							</td>
							<td>
								<xsl:value-of select="./ZONE"/>
							</td>
							<td>
								<xsl:value-of select="./LIGHT"/>
							</td>
							<td>
								<xsl:value-of select="./PRICE"/>
							</td>
							<td>
								<xsl:value-of select="./AVAILABILITY"/>
							</td>
						</tr>
					</xsl:for-each>
				</table>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
