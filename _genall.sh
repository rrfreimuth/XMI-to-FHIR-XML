#!/bin/bash

echo running Transform
java -jar ./saxon/saxon9he.jar -t -s:resources/EAFullModelNative.xml -xsl:resources/XMI2FHIRXML.xsl

echo copying models to IG folder
cp output/CoordinateInterval.xml ig/input/resources

echo building IG
cd ig
sh ./_genonce.sh
cd ..

echo ALL DONE!
