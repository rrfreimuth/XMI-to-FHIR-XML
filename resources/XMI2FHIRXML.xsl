<?xml version="1.0" encoding="ISO-8859-1"?>

<xsl:stylesheet exclude-result-prefixes="#all"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
     xmlns:xs="http://www.w3.org/2001/XMLSchema"
     xmlns:uml="http://schema.omg.org/spec/UML/2.1"
     xmlns:xmi="http://schema.omg.org/spec/XMI/2.1"
     xmlns:fhir="http://hl7.org/fhir"
     xmlns:thecustomprofile="http://www.sparxsystems.com/profiles/thecustomprofile/1.0"
  version="2.0">
 	<xsl:output method="xml" indent="yes" name="xml"/>
    <xsl:strip-space elements="*"/>

    <xsl:template match="/">
       <xsl:apply-templates/>
  	</xsl:template>

    <xsl:template match="packagedElement">
    <xsl:for-each select="packagedElement[@*[1] = 'uml:Class']"> <!-- qualifies on attribute xmi:type="uml:Class"  -->
      <xsl:variable name="filename"
    		select="concat('output/',@name,'.xml')" />
    	<xsl:variable name="classname" select="@name"/>

  	  <xsl:value-of select="$filename" />  <!-- Creating  -->
    	<xsl:result-document href="{$filename}" format="xml">

      <!-- hard coding the StructureDefintion like this (instead of using xsl:element)
           keeps all the child elements from having an empty 'xmlns:' (namespace) tag-->
      <StructureDefinition xmlns="http://hl7.org/fhir">
        <xsl:element name="id">
      	 	<xsl:attribute name="value">
      	 	   <xsl:value-of select="@name"/>
      	 	</xsl:attribute>
      	</xsl:element>
      	<xsl:element name="text">
      		<xsl:element name="status">
      	 		<xsl:attribute name="value">generated</xsl:attribute>
      		</xsl:element>
      		<div xmlns="http://www.w3.org/1999/xhtml">
    				<p><b>CG <xsl:value-of select="@name"/> Logical Model</b></p>
    				<p>A class to model <xsl:value-of select="@name"/></p>
  			</div>
  		</xsl:element>
  		<xsl:element name="url">
      	 	<xsl:attribute name="value">http://hl7.org/fhir/uv/genomics-logicalmodel/StructureDefinition/<xsl:value-of select="@name"/></xsl:attribute>
      	</xsl:element>
  		<xsl:element name="version">
      	 	<xsl:attribute name="value">0.1.0</xsl:attribute>
      	</xsl:element>
      	<xsl:element name="name">
      	 	<xsl:attribute name="value">
      	 		<xsl:value-of select="@name"/>
      	 	</xsl:attribute>
      	</xsl:element>
      	<xsl:element name="title">
      	 	<xsl:attribute name="value">CG <xsl:value-of select="@name"/> Logical Model</xsl:attribute>
      	</xsl:element>
      	<xsl:element name="status">
      	 	<xsl:attribute name="value">draft</xsl:attribute>
      	</xsl:element>
      	<xsl:element name="date">
      	 	<xsl:attribute name="value">2020-04-01T19:00:00-05:00</xsl:attribute>
      	</xsl:element>
      	<xsl:element name="publisher">
      	 	<xsl:attribute name="value">HL7 International - Clinical Genomics Work Group</xsl:attribute>
      	</xsl:element>
      	 <xsl:element name="contact">
      	 	<xsl:element name="telecom">
      	 	    <xsl:element name="system">
      	 			<xsl:attribute name="value">url</xsl:attribute>
      			</xsl:element>
      			<xsl:element name="value">
      	 			<xsl:attribute name="value">https://confluence.hl7.org/display/CGW/WorkGroup+Home</xsl:attribute>
      			</xsl:element>
      		</xsl:element>
      	</xsl:element>
      	<xsl:element name="description">
      	 	<xsl:attribute name="value">Model <xsl:value-of select="@name"/></xsl:attribute>
      	</xsl:element>
      	 <xsl:element name="jurisdiction">
  			   <xsl:element name="coding">
  			       	 <xsl:element name="system">
  						<xsl:attribute name="value">http://unstats.un.org/unsd/methods/m49/m49.htm</xsl:attribute>
      				</xsl:element>
      				 <xsl:element name="code">
  						<xsl:attribute name="value">001</xsl:attribute>
      				</xsl:element>
  			   </xsl:element>
      	</xsl:element>
      	<xsl:element name="fhirVersion">
  			<xsl:attribute name="value">4.0.1</xsl:attribute>
      	</xsl:element>
      	<xsl:element name="kind">
  			<xsl:attribute name="value">logical</xsl:attribute>
      	</xsl:element>
      	<xsl:element name="abstract">
  			<xsl:attribute name="value">false</xsl:attribute>
      	</xsl:element>
      	<xsl:element name="type">
  			<xsl:attribute name="value">
  				<xsl:value-of select="@name"/>
  			</xsl:attribute>
      	</xsl:element>
        <!-- For now, have all models have a base of Element -->
      	<xsl:element name="baseDefinition">
  			<xsl:attribute name="value">http://hl7.org/fhir/StructureDefinition/Element</xsl:attribute>
      	</xsl:element>
      	<xsl:element name="derivation">
  			<xsl:attribute name="value">specialization</xsl:attribute>
      	</xsl:element>
      	<xsl:element name="differential">
      	  <xsl:element name="element">
  			<xsl:attribute name="id"><xsl:value-of select="@name"/></xsl:attribute>
  			<xsl:element name="path">
  				<xsl:attribute name="value"><xsl:value-of select="@name"/></xsl:attribute>
      		</xsl:element>
      		<xsl:element name="definition">
  				<xsl:attribute name="value">Model <xsl:value-of select="$classname"/></xsl:attribute>
      		</xsl:element>
      		<xsl:element name="min">
  				<xsl:attribute name="value">0</xsl:attribute>
      		</xsl:element>
      		<xsl:element name="max">
  				<xsl:attribute name="value">*</xsl:attribute>
      		</xsl:element>
  		  </xsl:element>
  		  <xsl:for-each select="ownedAttribute">
    		  <xsl:element name="element">
    			<xsl:attribute name="id"><xsl:value-of select="concat($classname,'.',@name)"/></xsl:attribute>
    			<xsl:element name="path">
    				<xsl:attribute name="value"><xsl:value-of select="concat($classname,'.',@name)"/></xsl:attribute>
        		</xsl:element>
        		<xsl:element name="short">
    				<xsl:attribute name="value">Short definition of attribute <xsl:value-of select="@name"/></xsl:attribute>
        		</xsl:element>
        		<xsl:element name="definition">
    				<xsl:attribute name="value">Definition of attribute <xsl:value-of select="@name"/></xsl:attribute>
        		</xsl:element>
        		<xsl:element name="min">
    				<xsl:attribute name="value"><xsl:value-of select="lowerValue/@value"/></xsl:attribute>
        		</xsl:element>
        		<xsl:element name="max">
    				<xsl:attribute name="value"><xsl:value-of select="upperValue/@value"/></xsl:attribute>
        		</xsl:element>
        		<xsl:element name="type">
        			<xsl:element name="code">
        				<xsl:attribute name="value">
        						<xsl:value-of select="substring(type/@*[1],8)"/>
        				</xsl:attribute>
        		    </xsl:element>
        		</xsl:element>
    		  </xsl:element>
  		  </xsl:for-each>
      	</xsl:element>
      </StructureDefinition>
      </xsl:result-document>
    </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>
