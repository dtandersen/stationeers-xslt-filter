<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:math="http://exslt.org/math">
  <xsl:output omit-xml-declaration="yes" indent="yes"/>
  <xsl:output method="text"/>
  <xsl:strip-space elements="*"/>
  <xsl:template match="/">
      <xsl:for-each select="WorldData/Things/ThingSaveData">
            <xsl:value-of select="math:sqrt(WorldPosition/x*WorldPosition/x + WorldPosition/y*WorldPosition/y + WorldPosition/z*WorldPosition/z) "/>
            <xsl:text>, </xsl:text>
            <xsl:value-of select="ReferenceId"/>
            <xsl:text>, </xsl:text>
            <xsl:value-of select="WorldPosition/x"/>
            <xsl:text>, </xsl:text>
            <xsl:value-of select="WorldPosition/y"/>
            <xsl:text>, </xsl:text>
            <xsl:value-of select="WorldPosition/z"/>
            <xsl:text>, </xsl:text>
            <xsl:value-of select="PrefabName"/>
            <xsl:text>, </xsl:text>
            <xsl:value-of select="CustomName"/>
            <xsl:text>
</xsl:text>

      </xsl:for-each>
  </xsl:template>

</xsl:stylesheet>
