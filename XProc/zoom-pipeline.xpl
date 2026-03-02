<?xml version="1.0" encoding="UTF-8"?>
<p:declare-step name="onepiece-to-XML" xmlns:p="http://www.w3.org/ns/xproc"
    exclude-inline-prefixes="#all" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:ex="extensions"
    xmlns:cx="http://xmlcalabash.com/ns/extensions" xmlns:c="http://www.w3.org/ns/xproc-step"
    version="3.0">

    <p:input port="source" primary="true" content-types="text/plain" href="source/zoom-transcript_copy.txt"/>
 
    <p:identity message="Got some plain text input here ready to process."/>

    <p:invisible-xml cx:processor="markup-blitz">
        <p:with-input port="grammar">
            <p:document href="zoom.ixml" content-type="text/plain"/>
        </p:with-input>
    </p:invisible-xml>
    <p:identity message="Added markup with ixml"/>
    
    
    <p:store name="simple-XML" href="output-zoom.xml"/>
    <p:identity message="Stored some simple XML made by invisible XML grammar."/>
    
    <p:xslt>

        <p:with-input port="stylesheet" href="zoom-regex.xsl"/>
    </p:xslt>
    <p:identity message="Running the Identity Trnasformation XSLT to develop the XML"/>
    
    <p:store href="output-zoom-revised.xml" serialization="map {
        'method' : 'xml',
        'indent' : true(),
        'omit-xml-declaration' : false()
        }"/>
    <p:identity message="Saved finalized XML"/>
   

</p:declare-step>
