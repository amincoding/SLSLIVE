<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/Ordinateurs">
        <html>
            <body>
                <div style="background-color:teal;color:white;padding:8px ">
                    <p5><b>
                        THE MOST POWERFUL LAPTOPS IN THE LAST 2 YEARS
                    </b></p5>
                </div>
                <br></br>
            <table border="1">
                <tr bgcolor="#9acd32">
                    <th>Model</th>
                    <th>Date_mise_en_service</th>
                    <th>ip</th>
                    <th>System_de_exploitation</th>
                    <th>Ram</th>
                    <th>Stockage</th>
                    <th>Processeur</th>
                    <th>Frequence</th>
                </tr>
                <xsl:for-each select="Ordinateur">
                    <tr>
                        <td><xsl:value-of select="Model"/></td>
                        <td><xsl:value-of select="Date_mise_en_service"/></td>
                        <td><xsl:value-of select="ip"/></td>
                        <td><xsl:value-of select="System_de_exploitation"/></td>
                        <td><xsl:value-of select="Ram"/></td>
                        <td><xsl:value-of select="Stockage"/></td>
                        <td><xsl:value-of select="Processeur"/></td>
                        <td><xsl:value-of select="Frequence"/></td>
                    </tr>
                </xsl:for-each>
            </table>
            <br></br>
            <div style="background-color:teal;color:white;padding:8px ">
                <p5><b>
                    THANKS FOR YOUR VISIT TO OUR WEBSITE
                </b></p5>
            </div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
