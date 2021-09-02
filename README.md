# XMI-to-FHIR-XML

## Conceptual Model
Current conceptual model is [here](https://docs.google.com/document/d/1Wys14HNJAEB_YJ-EeDPAKX50_oxiDqAKi3WD4wlfjbk/edit)

## How to use this
Use the IG folder to manage the Implementation Guide
Add SD's to the ig\input\resources folder
Add a reference to that SD to the ig\genomics-logicalmodel.xml file (as a Resource)

## How to build the IG
In the IG folder, run
```
sh _updatePublisher.sh (answering Y to all prompts)
sh _genonce.sh
```

You can then view the ig\output\index.html to see the home page of the IG
