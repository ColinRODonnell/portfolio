<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    version="3.0">
   <!--this replaces all the <transcript> and <timestamp> tags with something new for a revised xml -->
    <xsl:output method="xml" indent="yes"/>
    <xsl:template match="transcript">
        <speech>
            <xsl:apply-templates/>
        </speech>
    </xsl:template>
    
    <xsl:template match="timestamp">
        <timeframe>
            <xsl:apply-templates/>
        </timeframe>
    </xsl:template>
  
    
</xsl:stylesheet>