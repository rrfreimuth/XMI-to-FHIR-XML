# XMI-to-FHIR-XML

## Conceptual Model
Current conceptual model is [here](https://docs.google.com/document/d/1Wys14HNJAEB_YJ-EeDPAKX50_oxiDqAKi3WD4wlfjbk/edit)

## How to use this
The TransformerService can be run from the command line using java and requires two text inputs that represent the path of first
the XSL file and second the source XML(XMI or XSD) file.

## How to build Java Project
```
mvn package
```

## How to run Java Project
```
java org.basic.xsd.transform.fhir.TransformService "resources/ClinGen2Fhir.xsl" "resources/EASchemaAssertion.XSD"
```

```
java -jar target/XSLTTransformer-0.0.1-SNAPSHOT-jar-with-dependencies.jar resources/ClinGen2Fhir.xsl resources/EASchemaAssertion.XSD
```

## How to run saxon parser
```
java -jar ./saxon/saxon9he.jar -t -s:resources/EASchemaAssertion.XSD -xsl:resources/ClinGen2Fhir.xsl -o:output.txt

java -jar ./saxon/saxon9he.jar -t -s:resources/EAFullModelNative.xml -xsl:resources/XMI2FHIRXML.xsl
```
