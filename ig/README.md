# ig
An implementation guide for the generated resources

## build
* cd ig
* run `\_updatePublisher.(bat/sh)` (and say Y)
* run `\_genonce.(bat/sh)`
* in browser, open ig/output/index.html
* in browser, open ig/output/qa.html to review for errors

## To add new resources / classes (aka StructureDefinition)
* copy SD file to the ig/input/resources folder
* edit ig/input/genomics-logicalmodel.xml file to reference the new file
* re-build the ig
