<?xml version="1.0"?>
<xsl:stylesheet version="2.0"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:math="http://www.w3.org/2005/xpath-functions/math"
  xmlns:my="my:my"
  exclude-result-prefixes="math my"
  xmlns:xsd="http://www.w3.org/2001/XMLSchema">
    <!-- removes everything on the ground -->

    <!-- identity -->
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>

    <!--
    <xsl:template match="ThingSaveData" priority="1">
    <xsl:template match="ThingSaveData[ParentReferenceId = 0 and /WorldData/Things/ThingSaveData/ParentReferenceId = ReferenceId]]">
    -->
    <!-- <xsl:template match="ThingSaveData[key('top-level-junk2', ReferenceId)]"> -->
    <xsl:template match="ThingSaveData[key('toplevel', ReferenceId)]/WorldPosition">
      <WorldPosition xmlns="">
        <x><xsl:value-of select="$junkX" /></x>
        <y><xsl:value-of select="$junkY + 10 + math:sqrt(math:pow(x + y + z + (../ReferenceId div 1000), 2))" /></y>
        <z><xsl:value-of select="$junkZ" /></z>
      </WorldPosition>
    </xsl:template>

    <xsl:variable name="junkX">
      <xsl:value-of select="//ThingSaveData[CustomName='Junk'][1]/WorldPosition/x" />
    </xsl:variable>

    <xsl:variable name="junkY">
      <xsl:value-of select="//ThingSaveData[CustomName='Junk'][1]/WorldPosition/y" />
    </xsl:variable>

    <xsl:variable name="junkZ">
      <xsl:value-of select="//ThingSaveData[CustomName='Junk'][1]/WorldPosition/z" />
    </xsl:variable>

    <!-- <xsl:template match="/WorldData/Game">
      <out>
      <xsl:copy-of select="$h/item"/>
      </out>
    </xsl:template> -->

<!-- 11021 -->
    <xsl:key name="junk" match="ThingSaveData[PrefabName = $junks]" use="ReferenceId" />
    <xsl:key name="top-level-junk" match="$h/item[@name = $junks]" use="@id" />
    <xsl:key name="child-of-top-level-junk" match="$h/item[key('top-level-junk', id)]//item" use="@id" />

    <xsl:key name="top-level-junk2" match="ThingSaveData[ReferenceId = $h/item[key('top-level-junk', @id)]/@id]" use="ReferenceId" />
    <xsl:key name="child-of-top-level-junk2" match="ThingSaveData[ReferenceId = $h/item[key('top-level-junk', @id)]//item/@id]" use="ReferenceId" />

    <!-- <xsl:key name="top-level-junk2" match="ThingSaveData[key('toplevel', ReferenceId) and key('junk', ReferenceId)]" use="ReferenceId" />
    <xsl:key name="child-of-top-level-junk2" match="ThingSaveData[$h/item::]" use="ReferenceId" /> -->
    <xsl:key name="orphan" match="ThingSaveData[ReferenceId = $h/item/@id]" use="ReferenceId" />
    <xsl:key name="toplevel" match="ThingSaveData[ParentReferenceId = 0]" use="ReferenceId" />
    <xsl:key name="ore" match="ThingSaveData[PrefabName = $ore]" use="ReferenceId" />
    <xsl:key name="nearby" match="ThingSaveData[math:sqrt(WorldPosition/x*WorldPosition/x + WorldPosition/y*WorldPosition/y + WorldPosition/z*WorldPosition/z) >= 25]" use="ReferenceId" />
    <xsl:key name="far-away" match="ThingSaveData[math:sqrt(WorldPosition/x*WorldPosition/x + WorldPosition/y*WorldPosition/y + WorldPosition/z*WorldPosition/z) >= 250]" use="ReferenceId" />
    <xsl:key name="nearby-ore" match="ThingSaveData[key('toplevel', ReferenceId) and key('ore', ReferenceId) and key('nearby', ReferenceId)]" use="ReferenceId" />

    <!-- <xsl:variable name="z" select="'red'"/>
    <xsl:variable name="y">
      <abc></abc>
    </xsl:variable> -->

    <xsl:variable name="h">
      <xsl:call-template name="hi">
        <xsl:with-param name="elements" select="//ThingSaveData[ParentReferenceId = 0]" />
      </xsl:call-template>
    </xsl:variable>

    <xsl:template name="hi">
      <xsl:param name="elements" />
      <xsl:for-each select="$elements">
        <item>
          <xsl:attribute name="id">
            <xsl:value-of select="ReferenceId" />
          </xsl:attribute>
          <xsl:attribute name="name">
            <xsl:value-of select="PrefabName" />
          </xsl:attribute>
          <!-- <xsl:attribute name="parent">
            <xsl:value-of select="ParentReferenceId" />
          </xsl:attribute> -->
          <xsl:variable name="id" select="ReferenceId" />
          <xsl:call-template name="hi">
            <xsl:with-param name="elements" select="//ThingSaveData[$id = ParentReferenceId]" />
          </xsl:call-template>
        </item>
      </xsl:for-each>
    </xsl:template>

    <!--
    <xsl:template match="ThingSaveData[ParentReferenceId = 0 and (not(@xsi:type='HumanSaveData'))]" />
    -->
    <my:junk>
      <name>CartridgeAtmosAnalyser</name>
      <name>CartridgeElectronicReader</name>
      <name>CartridgeNetworkAnalyser</name>
      <name>CartridgeTracker</name>
      <name>ItemAngleGrinder</name>
      <name>ItemCrowbar</name>
      <name>ItemDrill</name>
      <name>ItemDuctTape</name>
      <name>ItemEvaSuit</name>
      <name>ItemGasFilterCarbonDioxide</name>
      <name>ItemMiningDrill</name>
      <name>ItemPickaxe</name>
      <name>ItemPillHeal</name>
      <name>ItemRoadFlare</name>
      <name>ItemScrewdriver</name>
      <name>ItemSpaceHelmet</name>
      <name>ItemSpacepack</name>
      <name>ItemTablet</name>
      <name>ItemWireCutters</name>
      <name>ItemWrench</name>
      <name>UniformOrangeJumpSuit</name>
      <name>PortableSolarPanel</name>
    </my:junk>

    <my:ore>
      <name>ItemCoalOre</name>
      <name>ItemCopperOre</name>
      <name>ItemGoldOre</name>
      <name>ItemIronOre</name>
      <name>ItemLeadOre</name>
      <name>ItemReagentMix</name>
      <name>ItemSiliconOre</name>
      <name>ItemSilverOre</name>
    </my:ore>

    <xsl:variable name="junks" select="document('')/*/my:junk/name"/>
    <xsl:variable name="ore" select="document('')/*/my:ore/name"/>

</xsl:stylesheet>
