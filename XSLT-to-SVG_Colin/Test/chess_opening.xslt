<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns="http://www.w3.org/2000/svg"
    exclude-result-prefixes="xs"
    version="3.0">
    
    
    <xsl:variable name="x-spacer" select="200"/>
    
    <xsl:variable name="y-spacer" select="3"/>
    
    <xsl:output method="xml" indent="yes"/>
    
    
    <xsl:template match="/">
        <xsl:variable name="trackedMoves"
            select="('e4','d4','c4','Nf3','g3','e5','f4','Nc3')"/>
       
        <xsl:variable name="allMoves" 
            select="tokenize(replace(string-join(//moves, ' '), '\d+\.', ''), '\s+')"/>
      
        <xsl:variable name="countTrackedMoves"
            select="$allMoves[. = $trackedMoves] => count()"/>

       
        <svg>
            <rect width="100%" height="100%" fill="rgb(66,66,112)"></rect>
            <xsl:for-each select="$trackedMoves">
                <xsl:variable name="move" select="."/>
                <xsl:variable name="countHere" select="count($allMoves[normalize-space(.) = $move])"/>
                
                <!-- sum counts of all previous moves -->
                <xsl:variable name="previousCounts" select="
                    for $i in 1 to (position() - 1)
                    return $allMoves[. = $trackedMoves[$i]] => count()
                    "/>
                
                <xsl:variable name="y-stacker" select="sum($previousCounts) * $y-spacer + 100"/> <!-- +100 to offset from top -->
                
       
                <desc>Stacked Plot</desc>
                <line x1="600" x2="600"
                    y1="{$y-stacker -2}"
                    y2="{$y-stacker + ($countHere * $y-spacer)}"
                    stroke-width="150"
                    stroke="rgb(200,{position() * 30},200)"/>
            <!--    this is for the text between the bars -->
                <text x="685" 
                    y="{$y-stacker + ($countHere * $y-spacer) div 2}" 
                    fill="white" 
                    font-size="14">
                    <xsl:value-of select="$move"/>:
                    <xsl:value-of select="$countHere"/> instances
                </text>
            </xsl:for-each>
        <!--    This I made for fun because I was really stressed out with the XSLT lol-->
           <desc>chess piece</desc>
           
           <circle cx="200" cy="200" r="40" fill="black"></circle>
           
           
           <polygon points="185 200, 150 400, 250 400, 215 200 " fill="black"/>
           <polygon points="140 400, 140 425, 260 425, 260 400  " fill="black"/>
           <polygon points="120 450, 120 475, 280 475, 280 450  " fill="white"/>
           <polygon points="200 300, 130 400, 270 400" fill="black"/>
           <polygon points="200 260, 140 240, 260 240" fill="black"/>
           <text x="400" y="25" fill="white" font-size="17">What Are The Most Common Moves in 100 Chess Openings</text>
           <text x="178" y="468" fill="black" font-size="17">PAWN</text>
           <circle cx="185" cy="190" r="20" fill="rgb(64, 64, 64)"></circle>
           <circle cx="180" cy="185" r="10" fill="grey"></circle>
          
       
            
       </svg>
    </xsl:template>
    
</xsl:stylesheet>