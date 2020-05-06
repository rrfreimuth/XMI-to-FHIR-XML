#!/bin/bash

echo running Transform
java -jar ./saxon/saxon9he.jar -t -s:resources/EAFullModelNativeCorrected.xml -xsl:resources/XMI2FHIRXML.xsl

echo building IG
cd ig
sh ./_genonce.sh
cd ..

echo ALL DONE!
