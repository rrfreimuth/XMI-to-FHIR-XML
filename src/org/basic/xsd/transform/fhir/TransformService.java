package org.basic.xsd.transform.fhir;


	/*
	 * Copyright (c) 2006 Sun Microsystems, Inc.  All rights reserved.  U.S.
	 * Government Rights - Commercial software.  Government users are subject
	 * to the Sun Microsystems, Inc. standard license agreement and
	 * applicable provisions of the FAR and its supplements.  Use is subject
	 * to license terms.
	 *
	 * This distribution may include materials developed by third parties.
	 * Sun, Sun Microsystems, the Sun logo, Java and J2EE are trademarks
	 * or registered trademarks of Sun Microsystems, Inc. in the U.S. and
	 * other countries.
	 *
	 * Copyright (c) 2006 Sun Microsystems, Inc. Tous droits reserves.
	 *
	 * Droits du gouvernement americain, utilisateurs gouvernementaux - logiciel
	 * commercial. Les utilisateurs gouvernementaux sont soumis au contrat de
	 * licence standard de Sun Microsystems, Inc., ainsi qu'aux dispositions
	 * en vigueur de la FAR (Federal Acquisition Regulations) et des
	 * supplements a celles-ci.  Distribue par des licences qui en
	 * restreignent l'utilisation.
	 *
	 * Cette distribution peut comprendre des composants developpes par des
	 * tierces parties. Sun, Sun Microsystems, le logo Sun, Java et J2EE
	 * sont des marques de fabrique ou des marques deposees de Sun
	 * Microsystems, Inc. aux Etats-Unis et dans d'autres pays.
	 */


	import javax.xml.parsers.DocumentBuilder;
	import javax.xml.parsers.DocumentBuilderFactory;
	import javax.xml.parsers.FactoryConfigurationError;
	import javax.xml.parsers.ParserConfigurationException;
	import org.xml.sax.SAXException;
	import org.xml.sax.SAXParseException;
	import org.w3c.dom.Document;
	import org.w3c.dom.DOMException;

	// For write operation
	import javax.xml.transform.Transformer;
	import javax.xml.transform.TransformerException;
	import javax.xml.transform.TransformerFactory;
	import javax.xml.transform.TransformerConfigurationException;
	import javax.xml.transform.dom.DOMSource;
	import javax.xml.transform.stream.StreamSource;
	import javax.xml.transform.stream.StreamResult;
	import java.io.*;


	public class TransformService {
	    static Document document;

	    public static void main(String[] argv) {
	        if (argv.length != 2) {
	            return;
	        }

	        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();

	        //factory.setNamespaceAware(true);
	        //factory.setValidating(true);
	        try {
	            File stylesheet = new File(argv[0]);
	            File datafile = new File(argv[1]);

	            DocumentBuilder builder = factory.newDocumentBuilder();
	            document = builder.parse(datafile);

	            TransformerFactory tFactory = TransformerFactory.newInstance();
	            StreamSource stylesource = new StreamSource(stylesheet);
	            Transformer transformer = tFactory.newTransformer(stylesource);

	            DOMSource source = new DOMSource(document);
	            StreamResult result = new StreamResult(System.out);
	            transformer.transform(source, result);
	        } catch (TransformerConfigurationException tce) {
	            System.out.println("\n** Configuration error");
	            System.out.println("   " + tce.getMessage());
	            tce.printStackTrace();
	        } catch (TransformerException te) {
	            System.out.println("\n** Transformer error");
	            System.out.println("   " + te.getMessage());
	            te.printStackTrace();
	        } catch (SAXException sxe) {
	            sxe.printStackTrace();
	        } catch (ParserConfigurationException pce) {
	            pce.printStackTrace();
	        } catch (IOException ioe) {
	            ioe.printStackTrace();
	        }
	    } 


}
