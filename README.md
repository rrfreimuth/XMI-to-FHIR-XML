# XMI-to-FHIR-XML

## Conceptual Model
Current conceptual model is [here](https://docs.google.com/document/d/1Wys14HNJAEB_YJ-EeDPAKX50_oxiDqAKi3WD4wlfjbk/edit)

## How to use this
The TransformerService can be run from the command line using java and requires two text inputs that represent the path of first
the XSL file and second the source XML(XMI or XSD) file.

## How to build
mvn package

## How to run
java org.basic.xsd.transform.fhir.TransformService "resources/ClinGen2Fhir.xsl" "resources/EASchemaAssertion.XSD"

java -jar target/XSLTTransformer-0.0.1-SNAPSHOT-jar-with-dependencies.jar resources/ClinGen2Fhir.xsl resources/EASchemaAssertion.XSD
