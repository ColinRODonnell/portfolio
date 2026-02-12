<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    version="3.0">
    
      
    <xsl:mode on-no-match="shallow-copy"/>
    
    <xsl:template match="text()">
        <xsl:analyze-string select="." regex="\[(.+?)\]" flags="s">
           <!-- this string matches anything inside the square brackets (I remembered the correct terminology from class).
            I order for the REGEX to not mistake it for a character set, the square brakcets are met with a backslash first.-->
            <xsl:matching-substring>
                <stage><xsl:value-of select="regex-group(1)"/></stage>
            </xsl:matching-substring>
            
            <xsl:non-matching-substring>
                <xsl:analyze-string select="." regex="(^[A-Z].+?):">
            <!--        This REGEX string matches all the speaker names. Since they all are capitlized and end with a colon
                    we can match from the start of a sentence with a capital to the colon, grabbing the name.-->
                    <xsl:matching-substring>
                        <speaker><xsl:value-of select="regex-group(1)"/></speaker>
                    </xsl:matching-substring>
              <!--      A non-matching-substring is the string that does NOT match my REGEX code-->
                    <xsl:non-matching-substring>
                        <xsl:apply-templates select="."/>
                    </xsl:non-matching-substring>
                </xsl:analyze-string>
            </xsl:non-matching-substring>
        </xsl:analyze-string>
    </xsl:template>
    
    
</xsl:stylesheet>