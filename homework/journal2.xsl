<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xs="http://www.w3.org/2001/XMLSchema"
	exclude-result-prefixes="xs"
	version="2.0">
	<xsl:output indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:template match="div[@class='interior-content']/ul">
		<xsl:result-document href="/Users/Alex/Desktop/journal_data2.xml">
		<journal_data>
			<xsl:apply-templates select="li">
				<xsl:sort select="p[1]/span/substring-after(.,' - ')"/>
			</xsl:apply-templates>
		</journal_data>
		</xsl:result-document>
	</xsl:template>
	<!-- empty templates -->
	<xsl:template match="head"/>
	<xsl:template match="input"/>
	<xsl:template match="script"/>
	<xsl:template match="header"/>
	<xsl:template match="div[@class='container breadcrumbs-wrapper']"/>
	<xsl:template match="div[@class='interior-top']"/>
	<xsl:template match="div[@id='maincontent']"/>
	<xsl:template match="div[@class='grid-3 pull-9 interior-rail-wrapper']"/>
	<xsl:template match="div[@class='interior-content']/div[@class='block']"/>
	<xsl:template match="div[@id='tb_external']"/>
	<!-- journal li -->
	<xsl:template match="li">

		<journal_record>
			<xsl:apply-templates/>
		</journal_record>
	</xsl:template>
	<xsl:template match="li/p[1]">
		<xsl:apply-templates/>
	</xsl:template>
	<!-- title -->
	<xsl:template match="a">
		<journal_title>
			<xsl:apply-templates/>
		</journal_title>
		<!-- URL -->
		<journal_URL>
			<xsl:value-of select="@href"/>
		</journal_URL>
	</xsl:template>
	<!-- institution -->
	<xsl:template match="span">
		<journal_inst>
			<xsl:choose>
				<xsl:when test="text()">
			<xsl:value-of select="substring-after(.,' - ')"/>
				</xsl:when>

			</xsl:choose>
		</journal_inst>
	</xsl:template>
	<!-- description -->
	<xsl:template match="li/p[2]">
		<journal_desc>
			<xsl:apply-templates/>
		</journal_desc>
	</xsl:template>
	<xsl:template match="text()">
		<xsl:value-of select="normalize-space()"/>
	</xsl:template>
</xsl:stylesheet>