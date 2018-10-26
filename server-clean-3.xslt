<?xml version="1.0"?>
<xsl:stylesheet version="2.0"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:data="http://example.com/data"
  exclude-result-prefixes="data xsi">

  <xsl:variable name="things">
    <xsl:for-each select="/WorldData/Things/ThingSaveData[ParentReferenceId = 0]">
      <xsl:call-template name="thing">
        <xsl:with-param name="id" select="ReferenceId"/>
      </xsl:call-template>
    </xsl:for-each>
  </xsl:variable>

  <xsl:template name="thing">
      <xsl:param name="id"/>

      <thing>
        <xsl:attribute name = "id">
          <xsl:value-of select="$id"/>
        </xsl:attribute>
        <xsl:attribute name = "PrefabName">
          <xsl:value-of select="/WorldData/Things/ThingSaveData[ReferenceId = $id]/PrefabName"/>
        </xsl:attribute>
        <xsl:for-each select="/WorldData/Things/ThingSaveData[ParentReferenceId = $id]">
          <xsl:call-template name="thing">
            <xsl:with-param name="id" select="ReferenceId"/>
          </xsl:call-template>
        </xsl:for-each>
      </thing>
      <xsl:text>&#xa;</xsl:text>
  </xsl:template>

  <xsl:key name="anc" match="thing" use="@id" />

  <!-- identity -->
  <xsl:template match="@*|node()">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
  </xsl:template>

  <xsl:template match="ThingSaveData[PrefabName='ItemCerealBar']">
    <xsl:variable name="xx" select="ReferenceId" />
    <xsl:choose>
            <xsl:when test="$things/thing[@id=$xx]/ancestor">
            </xsl:when>
            <xsl:otherwise>
              <xsl:copy>
                <xsl:apply-templates select="@*|node()"/>
              </xsl:copy>
            </xsl:otherwise>
          </xsl:choose>
  </xsl:template>

  <xsl:template match="Things">
    <xsl:message select="$things">
    </xsl:message>
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>

  </xsl:template >


</xsl:stylesheet>
