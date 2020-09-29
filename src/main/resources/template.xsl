<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.1"
	xmlns:xs="http://www.w3.org/2001/XMLSchema"
	xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:template match="OfflinePaperlessKyc">
		<fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
			<fo:layout-master-set>
				<fo:simple-page-master master-name="adhar">
					<fo:region-body/>
				</fo:simple-page-master>
			</fo:layout-master-set>
			<fo:page-sequence master-reference="adhar">
				<fo:flow flow-name="xsl-region-body">
					<fo:block>referenceId <xsl:value-of select="OfflinePaperlessKyc"/>
					</fo:block>
					<fo:block>
						<xsl:apply-templates select="UidData"/>
					</fo:block>
				</fo:flow>
			</fo:page-sequence>
            <xsl:template match="Signature">
                <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
                    <fo:layout-master-set>
                        <fo:simple-page-master master-name="adhar-2">
                            <fo:region-body/>
                        </fo:simple-page-master>
                    </fo:layout-master-set>
                    <fo:page-sequence master-reference="adhar-2">
                        <fo:flow flow-name="xsl-region-body">
                            <fo:block>
                                <xsl:apply-templates select="SignedInfo"/>
                            </fo:block>
                        </fo:flow>
                    </fo:page-sequence>
                </fo:root>
            </xsl:template>
		</fo:root>
	</xsl:template>
    <xsl:template match="UidData">
		<fo:block>
			<xsl:value-of select="Poi"/>
		</fo:block>
		<fo:block>
			<xsl:value-of select="Poa"/>
		</fo:block>
		<fo:block>
			<xsl:value-of select="Pht"/>
		</fo:block>
	</xsl:template>

	<xsl:template match="SignedInfo">
		<fo:block><xsl:value-of select="CanonicalizationMethod"/></fo:block>
		<fo:block><xsl:value-of select="SignatureMethod"/></fo:block>
		<fo:block><xsl:apply-templates select="Reference"/></fo:block>
	</xsl:template>

	<xsl:template match="Reference">
		<fo:block><xsl:apply-templates select="Transform"/></fo:block>
		<fo:block><xsl:value-of select="DigestMethod"/></fo:block>
		<fo:block><xsl:value-of select="DigestValue"/></fo:block>
	</xsl:template>

    <xsl:template match="Transforms">
        <fo:block><xsl:value-of select="Transform"/></fo:block>
    </xsl:template>
</xsl:stylesheet>
