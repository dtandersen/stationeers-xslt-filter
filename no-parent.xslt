<?xml version="1.0"?>
<xsl:stylesheet version="1.0" 
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <!-- removes everything on the ground -->  

    <!-- identity -->
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>

    <!-- match objects without a parent, except players -->
    <xsl:template match="ThingSaveData[@xsi:type='HumanSaveData']">  
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="ThingSaveData[ParentReferenceId = 0 and (not(@xsi:type='HumanSaveData'))]" />  
</xsl:stylesheet>
