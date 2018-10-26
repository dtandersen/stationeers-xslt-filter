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

    <!--
    <xsl:template match="ThingSaveData[ParentReferenceId = 0 and (not(@xsi:type='HumanSaveData'))]" />
    -->

    <xsl:template match="ThingSaveData[ParentReferenceId = 0 and PrefabName='ItemIronOre']" />
    <xsl:template match="ThingSaveData[ParentReferenceId = 0 and PrefabName='ItemCoalOre']" />
    <xsl:template match="ThingSaveData[ParentReferenceId = 0 and PrefabName='ItemSilverOre']" />
    <xsl:template match="ThingSaveData[ParentReferenceId = 0 and PrefabName='ItemCopperOre']" />
    <xsl:template match="ThingSaveData[ParentReferenceId = 0 and PrefabName='ItemGoldOre']" />
    <xsl:template match="ThingSaveData[ParentReferenceId = 0 and PrefabName='ItemSiliconOre']" />
    <xsl:template match="ThingSaveData[ParentReferenceId = 0 and PrefabName='ItemLeadOre']" />
    <xsl:template match="ThingSaveData[ParentReferenceId = 0 and PrefabName='ItemReagentMix']" />

    <xsl:template match="ThingSaveData[ParentReferenceId = 0 and PrefabName='ItemWrench']" />
    <xsl:template match="ThingSaveData[ParentReferenceId = 0 and PrefabName='ItemCrowbar']" />
    <xsl:template match="ThingSaveData[ParentReferenceId = 0 and PrefabName='ItemDrill']" />
    <xsl:template match="ThingSaveData[ParentReferenceId = 0 and PrefabName='ItemTablet']" />
    <xsl:template match="ThingSaveData[ParentReferenceId = 0 and PrefabName='ItemWireCutters']" />
    <xsl:template match="ThingSaveData[ParentReferenceId = 0 and PrefabName='ItemScrewdriver']" />
    <xsl:template match="ThingSaveData[ParentReferenceId = 0 and PrefabName='ItemAngleGrinder']" />

    <!--
    <xsl:template match="ThingSaveData[ParentReferenceId = 0 and PrefabName='ItemLabeller']" />
    -->
    <xsl:template match="ThingSaveData[ParentReferenceId = 0 and PrefabName='']" />

    <xsl:template match="ThingSaveData[ParentReferenceId = 0 and PrefabName='ItemMiningDrill']" />

    <!--
    <xsl:template match="ThingSaveData[ParentReferenceId = 0 and PrefabName='ItemMiningBelt']" />
    <xsl:template match="ThingSaveData[ParentReferenceId = 0 and PrefabName='ItemToolBelt']" />
    -->

    <xsl:template match="ThingSaveData[ParentReferenceId = 0 and PrefabName='ItemDuctTape']" />    

    <xsl:template match="ThingSaveData[ParentReferenceId = 0 and PrefabName='ItemSpaceHelmet']" />
    <xsl:template match="ThingSaveData[ParentReferenceId = 0 and PrefabName='ItemEvaSuit']" />
    <xsl:template match="ThingSaveData[ParentReferenceId = 0 and PrefabName='ItemSpacepack']" />

    <xsl:template match="ThingSaveData[ParentReferenceId = 0 and PrefabName='ItemPillHeal']" />
    <xsl:template match="ThingSaveData[ParentReferenceId = 0 and PrefabName='ItemPickaxe']" />
    <xsl:template match="ThingSaveData[ParentReferenceId = 0 and PrefabName='ItemRoadFlare']" />
    <xsl:template match="ThingSaveData[ParentReferenceId = 0 and PrefabName='CartridgeTracker']" />
    <xsl:template match="ThingSaveData[ParentReferenceId = 0 and PrefabName='CartridgeElectronicReader']" />
    <xsl:template match="ThingSaveData[ParentReferenceId = 0 and PrefabName='CartridgeAtmosAnalyser']" />
    <xsl:template match="ThingSaveData[ParentReferenceId = 0 and PrefabName='CartridgeNetworkAnalyser']" />
    <xsl:template match="ThingSaveData[ParentReferenceId = 0 and PrefabName='UniformOrangeJumpSuit']" />
    <xsl:template match="ThingSaveData[ParentReferenceId = 0 and PrefabName='ItemGasFilterCarbonDioxide']" />
    <xsl:template match="ThingSaveData[ParentReferenceId = 0 and PrefabName='']" />
    <xsl:template match="ThingSaveData[ParentReferenceId = 0 and PrefabName='']" />
    <xsl:template match="ThingSaveData[ParentReferenceId = 0 and PrefabName='']" />

    <xsl:key name="childs" match="/WorldData/Things/ThingSaveData" use="ParentReferenceId" />

    <!--
    <xsl:template match="ThingSaveData" priority="1">
    <xsl:template match="ThingSaveData[ParentReferenceId = 0 and /WorldData/Things/ThingSaveData/ParentReferenceId = ReferenceId]]">
    -->
    <xsl:template match="ThingSaveData[ParentReferenceId = 0 and key('childs', ReferenceId)]">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>


</xsl:stylesheet>
