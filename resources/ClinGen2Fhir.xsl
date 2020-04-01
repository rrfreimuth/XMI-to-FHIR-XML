<?xml version="1.0" encoding="ISO-8859-1"?>

<xsl:stylesheet 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
  version="1.0">
  <xsl:output method="xml" /> 
  <xsl:template match="/">
       <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="complexType">
  	<xsl:element name="{@name}" namespace="http://hl7.org/fhir">
  		<xsl:for-each select = "sequence/element">
  		 <xsl:element name="{@name}">
  		 </xsl:element>
  		</xsl:for-each>
     </xsl:element> 
  </xsl:template>


</xsl:stylesheet>


