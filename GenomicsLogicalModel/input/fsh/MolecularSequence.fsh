Logical: MolecularSequence
Parent: Element
Title: "Molecular Sequence"
Description: "Next version of MolecularSequence resource"
* name 0..1 string 
  "Name of sequence" 
  "The human-readable name of the sequence."
* type 1..1 CodeableConcept 
  "The type of sequence (genomic, mRNA, protein, ...)" 
  "The type of the sequence.  Ideally, a code from an ontology would be used to designate genomic (including plasmid and short oligonucleotides), RNA (including mRNA, tRNA, ncRNA, etc), and protein (including short peptides).  The bindings for this element have not yet been determined."
* identifier 0..* CodeableConcept 
  "Identifier(s) for the sequence" 
  "TO UPDATE: use SequenceDesignation datatype\n\nIdentifier(s) for the sequence, which should be expressed using the coding.code element.  The coding system should be specified to avoid ambiguity."
* genomeAssembly 0..* BackboneElement 
  "A genome assembly" 
  "A genome assembly"
  * build 1..1 Identifier 
    "Genome build" 
    "The identifier of a genome build."
  * organism 1..1 CodeableConcept 
    "Organism" 
    "The organism corresponding to the Genome Assembly.  Preferably expressed using an NCBI taxonomy code."
  * description 1..1 string 
    "Description of the Genome Assembly" 
    "A description of the Genome Assembly."
  * accession 0..1 CodeableConcept 
    "Genome build accession number" 
    "The accession number of the Genome Build"
* representations 0..* BackboneElement 
  "Represents the many different ways a molecular sequence could be represented" 
  "This element allows a single instance of Sequence to be represented in many different ways, including different file formats."
  * simple 0..1 BackboneElement 
    "Literal sequence" 
    "A sequence represented as a literal string"
    * encoding 0..1 CodeableConcept 
      "The coding system (alphabet) used by the sequence" 
      "The coding system (alphabet) used by the sequence.  While IUPAC symbols are frequently assumed, this attribute can denote whether an amino acid sequence is encoded as single letter or 3-letter abbreviations.  Ideally, a value set defining common coding systewould be developed."
    * value 1..1 string 
      "The literal sequence expressed as a string" 
      "The literal sequence expressed as a string"
  * formatted 0..1 BackboneElement 
    "A formatted sequence" 
    "A sequence expressed in a pre-defined format.  The attached sequence can be processed using existing software tools designed for the given format."
    * file 1..1 Attachment 
      "Attached file" 
      "A file containing the formatted sequence."
  * resolveable 0..1 BackboneElement 
    "A sequenced retrieved from a URI" 
    "Reference to a sequence that is not explicitly provided within this instance of Sequence, but which can be retrieved by resolving the URI"
    * uri 1..1 uri 
      "A URI that, when resolved, will return the sequence" 
      "A resolvable, absolute address that, when accessed, will return the Sequence"
    * format 0..1 code 
      "The format of the resolved sequence" 
      "The format of the resolved sequence.  The codes for this element should be the same as those for a Formatted Sequence."
  * relative 0..1 BackboneElement 
    "A Sequence defined relative to another Sequence(s)" 
    "The definition of a new sequence that is represented by applying an ordered series of edits to one or more other Sequences."
    * startingSequence[x] 1..1 string or Reference(MolecularSequence) 
      "The starting Sequence" 
      "A reference to the Sequence used as the starting \"base\" of the Sequence that is to be derived."
    * edits 1..* BackboneElement 
      "The edits to apply to the starting sequence" 
      "An ordered series of edits to apply to the starting sequence"
      * interval 1..1 MolecularPreciseInterval 
        "The interval on the current Sequence that defines the region to be replaced" 
        "The coordinate interval that defines the region of Sequence to be replaced during the current edit operation"
      * referenceSequence[x] 0..1 string or Reference(MolecularSequence) 
        "Contents of the sequence that will be edited" 
        "The content of the sub-Sequence that will be replaced in the current edit operation"
      * replacementSequence[x] 1..1 string or Reference(MolecularSequence) 
        "The content used in the replacement" 
        "The replacement Sequence used in the current edit operation"
* relationship 0..* BackboneElement 
  "Relationship between two Sequences" 
  "This element captures information about the relationship between two Sequences.  Ideally, the relationship will be codified using concepts from an ontology."
  * type 1..1 CodeableConcept 
    "Relationship type" 
    "The relationship between two sequences.  For example: transcribed to, transcribed from, translated to, translated from.  Ideally, the concepts used to express the relationship should be defined in an ontology."
  * description 0..1 string 
    "Relationship description" 
    "A description of the relationship between two sequences."
  * sequence 1..1 Reference(MolecularSequence) 
    "The target of the sequence relationship" 
    "A reference to a Sequence that represents the object of a defined relationship."