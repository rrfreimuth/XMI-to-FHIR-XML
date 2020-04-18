#!/bin/bash

echo running Transform
java -jar ./saxon/saxon9he.jar -t -s:resources/EAFullModelNative.xml -xsl:resources/XMI2FHIRXML.xsl

echo copying models to IG folder
cp output/CoordinateInterval.xml ig/input/resources
cp output/FormattedSequence.xml ig/input/resources
cp output/GenomeAssembly.xml ig/input/resources
cp output/RelativeSequence.xml ig/input/resources
cp output/Sequence.xml ig/input/resources
cp output/SequenceEdit.xml ig/input/resources
cp output/SequenceRepresentation.xml ig/input/resources
cp output/SimpleSequence.xml ig/input/resources

echo building IG
cd ig
sh ./_genonce.sh
cd ..

echo ALL DONE!
