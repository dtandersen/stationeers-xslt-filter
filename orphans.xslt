<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  exclude-result-prefixes="xsi">

  <xsl:output omit-xml-declaration="yes" indent="yes"/>

  <xsl:key name="exists" match="ThingSaveData" use="ReferenceId" />
  <xsl:key name="orphaned" match="ThingSaveData[not(not(ParentReferenceId) or ParentReferenceId=0 or key('exists', ParentReferenceId))]" use="ReferenceId" />

  <xsl:template match="@*|node()">
    <xsl:apply-templates select="@*|node()"/>
  </xsl:template>

  <!-- identity -->
  <xsl:template match="ThingSaveData[key('orphaned', ReferenceId)]">
    <orphan>
      <xsl:attribute name = "PrefabName">
        <xsl:value-of select="PrefabName"/>
      </xsl:attribute>
      <xsl:attribute name = "ReferenceId">
        <xsl:value-of select="ReferenceId"/>
      </xsl:attribute>
      <xsl:attribute name = "ParentReferenceId">
        <xsl:value-of select="ParentReferenceId"/>
      </xsl:attribute>
    </orphan>
    <xsl:text>&#xa;</xsl:text>
  </xsl:template>

</xsl:stylesheet>
