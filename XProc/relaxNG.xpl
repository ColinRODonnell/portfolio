<?xml version="1.0" encoding="UTF-8"?>
<p:declare-step name="onepiece-to-XML" xmlns:p="http://www.w3.org/ns/xproc"
    exclude-inline-prefixes="#all" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:ex="extensions"
    xmlns:cx="http://xmlcalabash.com/ns/extensions" xmlns:c="http://www.w3.org/ns/xproc-step"
    version="3.0">
    <p:validate-with-relax-ng>
        <p:with-input port="schema">
            <p:document href="mySchema.rnc" content-type="application/relax-ng-compact-syntax"/>
        </p:with-input>
    </p:validate-with-relax-ng>
    <p:identity message="Validated with Relax NG"/>
</p:declare-step>