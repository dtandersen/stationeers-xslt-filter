<?xml version="1.0"?>
<xsl:stylesheet version="2.0"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:math="http://exslt.org/math">

  <xsl:template match="/">
    <things>
      <xsl:for-each select="WorldData/Things/ThingSaveData">
        <thing>
          <xsl:attribute name = "ReferenceId">
            <xsl:value-of select="ReferenceId"/>
          </xsl:attribute>
          <xsl:attribute name = "distance">
            <xsl:value-of select="math:sqrt(WorldPosition/x*WorldPosition/x + WorldPosition/y*WorldPosition/y + WorldPosition/z*WorldPosition/z) "/>
          </xsl:attribute>
          <xsl:attribute name = "x">
            <xsl:value-of select="WorldPosition/x"/>
          </xsl:attribute>
          <xsl:attribute name = "y">
            <xsl:value-of select="WorldPosition/y"/>
          </xsl:attribute>
          <xsl:attribute name = "z">
            <xsl:value-of select="WorldPosition/z"/>
          </xsl:attribute>
          <xsl:attribute name = "name">
            <xsl:value-of select="PrefabName"/>
          </xsl:attribute>
        </thing>
      </xsl:for-each>
    </things>
  </xsl:template>

</xsl:stylesheet>
