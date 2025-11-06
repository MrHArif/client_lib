<?xml version="1.0" encoding="UTF-8"?>
<!-- # Last commit $Id: unified.xsl 11742 2011-02-03 16:48:17Z jkay $ -->

<!--                                                                           -->
<!-- # Copyright (c) 2008-2011, Workbooks Online Limited. All Rights Reserved. -->
<!--                                                                           -->
<!-- Generic Output Document Template - modify as required. We recommend you   -->
<!-- continue to use the configuration tools in the Workbooks Desktop to set   -->
<!-- parameters to your templates - these appear beneath the /hash/text path.  -->
<!--                                                                           -->

<xsl:stylesheet xmlns:date="http://exslt.org/dates-and-times" xmlns:str="http://exslt.org/strings" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:xf="http://www.ecrion.com/xf/1.0" xmlns:xc="http://www.ecrion.com/2008/xc" xmlns:xfd="http://www.ecrion.com/xfd/1.0" xmlns:svg="http://www.w3.org/2000/svg" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" extension-element-prefixes="date str">
    <xsl:output indent="yes" encoding="utf-8"/>
    <xsl:template match="/">
        <fo:root>
			<!-- ==== PAGE LAYOUT - CONTROLLED BY Page_Orientation PDF Setting==== -->

            <!-- Logic applied around page layouts to say when it is landscape then output with the correct formatting, otherwise output portrait -->

            <xsl:choose>
                <xsl:when test="/hash/text/Page_Orientation = 'Landscape'">
                    <fo:layout-master-set>
                        <fo:simple-page-master master-name="Letter Page" page-width="11.7in" page-height="8.3in" margin-top="0px" margin-bottom="0px" margin-right="0px" margin-left="0px">
                            <fo:region-body region-name="xsl-region-body" padding-top="0px" padding-bottom="0px" padding-left="0px" padding-right="0px" margin-top="4.250cm" margin-bottom="2.750cm" margin-left="1.8cm" margin-right="1.8cm" border-style="none" border-width="0px" border-color="" background="" background-repeat="no-repeat" background-position-horizontal="0px" background-position-vertical="0px" extent="0px" column-gap="0px" column-count="1" reference-orientation="0"/>
                            <fo:region-before region-name="xsl-region-before" display-align="after" extent="3.8cm" padding-top="0px" padding-bottom="0px" padding-left="0px" padding-right="0px" border-style="none" border-width="0px" border-color="" background="" background-repeat="no-repeat" background-position-horizontal="0px" background-position-vertical="0px" reference-orientation="0"/>
                            <fo:region-after region-name="xsl-region-after" display-align="before" extent="2.750cm" padding-top="0px" padding-bottom="0px" padding-left="0px" padding-right="0px" border-style="none" border-width="0px" border-color="" background="" background-repeat="no-repeat" background-position-horizontal="0px" background-position-vertical="0px" reference-orientation="0"/>
                            <fo:region-start region-name="xsl-region-start" extent="1.8cm" padding-top="0px" padding-bottom="0px" padding-left="0px" padding-right="0px" border-style="none" border-width="0px" border-color="" background="" background-repeat="no-repeat" background-position-horizontal="0px" background-position-vertical="0px" reference-orientation="0"/>
                            <fo:region-end region-name="xsl-region-end" extent="1.8cm" padding-top="0px" padding-bottom="0px" padding-left="0px" padding-right="0px" border-style="none" border-width="0px" border-color="" background="" background-repeat="no-repeat" background-position-horizontal="0px" background-position-vertical="0px" reference-orientation="0"/>
                        </fo:simple-page-master>
                    </fo:layout-master-set>
                </xsl:when>
                <xsl:otherwise>
                    <fo:layout-master-set>
                        <fo:simple-page-master master-name="Letter Page" page-width="8.3in" page-height="11.7in" margin-top="0px" margin-bottom="0px" margin-right="0px" margin-left="0px">
                            <fo:region-body region-name="xsl-region-body" padding-top="0px" padding-bottom="0px" padding-left="0px" padding-right="0px" margin-top="5.250cm" margin-bottom="2.750cm" margin-left="1.8cm" margin-right="1.8cm" border-style="none" border-width="0px" border-color="" background="" background-repeat="no-repeat" background-position-horizontal="0px" background-position-vertical="0px" extent="0px" column-gap="0px" column-count="1" reference-orientation="0"/>
                            <fo:region-before region-name="xsl-region-before" display-align="after" extent="4.8cm" padding-top="0px" padding-bottom="0px" padding-left="0px" padding-right="0px" border-style="none" border-width="0px" border-color="" background="" background-repeat="no-repeat" background-position-horizontal="0px" background-position-vertical="0px" reference-orientation="0"/>
                            <fo:region-after region-name="xsl-region-after" display-align="before" extent="2.750cm" padding-top="0px" padding-bottom="0px" padding-left="0px" padding-right="0px" border-style="none" border-width="0px" border-color="" background="" background-repeat="no-repeat" background-position-horizontal="0px" background-position-vertical="0px" reference-orientation="0"/>
                            <fo:region-start region-name="xsl-region-start" extent="1.8cm" padding-top="0px" padding-bottom="0px" padding-left="0px" padding-right="0px" border-style="none" border-width="0px" border-color="" background="" background-repeat="no-repeat" background-position-horizontal="0px" background-position-vertical="0px" reference-orientation="0"/>
                            <fo:region-end region-name="xsl-region-end" extent="1.8cm" padding-top="0px" padding-bottom="0px" padding-left="0px" padding-right="0px" border-style="none" border-width="0px" border-color="" background="" background-repeat="no-repeat" background-position-horizontal="0px" background-position-vertical="0px" reference-orientation="0"/>
                        </fo:simple-page-master>
                    </fo:layout-master-set>
                </xsl:otherwise>
            </xsl:choose>

            <fo:page-sequence master-reference="Letter Page">

                <!-- ==== BEFORE REGION (Header) ==== -->
                <fo:static-content flow-name="xsl-region-before" font-size="8pt" font-family="Helvetica">
                    <!-- === Enter stuff that should go in the page header here === -->
                    <fo:block>
                        <fo:table border-collapse="collapse" table-layout="fixed" width="100%">
                          <fo:table-column column-width="50%" column-number="1"/>
                          <fo:table-column column-width="50%" column-number="2"/>
                          <fo:table-body>
                            <fo:table-row>
                              <fo:table-cell>
                                  <fo:block linefeed-treatment="preserve">
                                    <xsl:value-of select="/hash/own_organisation/main_address"/>
                                  </fo:block>
                               </fo:table-cell>
                               <fo:table-cell>
                                  <fo:block>
                                  </fo:block>
                               </fo:table-cell>
                              <fo:table-cell>
                                  <fo:block>
                                    <fo:external-graphic src="url()" content-width="4cm">
                                    <xsl:attribute name="src">
                                        <xsl:value-of select="/hash/images/header_logo"/>
                                    </xsl:attribute>
                                    </fo:external-graphic>
                                  </fo:block>
                               </fo:table-cell>
                               <fo:table-cell>
                                  <fo:block>
                                  </fo:block>
                               </fo:table-cell>
                                        </fo:table-row>

                          </fo:table-body>
                        </fo:table>
                      </fo:block>
                </fo:static-content>
                <!-- ==== AFTER REGION (Footer) ==== -->
                <fo:static-content flow-name="xsl-region-after" font-size="8pt" font-family="Helvetica">
                    <!-- === Enter stuff that should go in the page footer here === -->
                </fo:static-content>

                <!-- ==== START REGION - Left margin - Normally unused ==== -->
                <fo:static-content flow-name="xsl-region-start" font-size="8pt" font-family="Helvetica">
                    <!-- === "Enter stuff here" === -->
                </fo:static-content>

                <!-- ==== END REGION - Right margin - normally unused ==== -->
                <fo:static-content flow-name="xsl-region-end" font-size="8pt" font-family="Helvetica">
					<!-- === "Enter stuff here" === -->
                </fo:static-content>

                <!-- ==== BODY FLOW - MAIN CONTENTS ==== -->
                <fo:flow flow-name="xsl-region-body" font-size="11pt" font-family="Helvetica" color="rgb(0,0,0)">
				<fo:block>
                </fo:block>
                </fo:flow>

            </fo:page-sequence>
        </fo:root>
    </xsl:template>
	
	<xsl:template name="string-replace-all">
		<xsl:param name="text" />
		<xsl:param name="replace" />
		<xsl:param name="with" /> 
		<xsl:choose>
			<xsl:when test="contains($text, $replace)">
				<xsl:value-of select="substring-before($text,$replace)" />
				<xsl:value-of select="$with" />
				<xsl:call-template name="string-replace-all">
					<xsl:with-param name="text" select="substring-after($text,$replace)" />
					<xsl:with-param name="replace" select="$replace" />
					<xsl:with-param name="with" select="$with" />
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$text" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template name="FormatDate">
        <xsl:param name="DateTime" />
        <xsl:param name="Format" /> 

        <!-- Separates out the components of the DateTime -->

        <xsl:variable name="year">
            <xsl:value-of select="substring($DateTime,1,4)" />
        </xsl:variable>
        <xsl:variable name="month-temp">
            <xsl:value-of select="substring-after($DateTime,'-')" />
        </xsl:variable>
        <xsl:variable name="month">
            <xsl:value-of select="substring-before($month-temp,'-')" />
        </xsl:variable>
        <xsl:variable name="day-temp">
            <xsl:value-of select="substring-after($month-temp,'-')" />
        </xsl:variable>
        <xsl:variable name="day">
            <xsl:value-of select="substring($day-temp,1,2)" />
        </xsl:variable>
        <xsl:variable name="day-short">
            <xsl:choose>
                <xsl:when test="$day &lt; 10"><xsl:value-of select="substring($day-temp,2,1)" /></xsl:when>
                <xsl:otherwise><xsl:value-of select="substring($day-temp,1,2)" /></xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="time">
            <xsl:value-of select="substring-after($day-temp,' ')" />
        </xsl:variable>
        <xsl:variable name="hour">
            <xsl:value-of select="substring($time,1,2)" />
        </xsl:variable>
        <xsl:variable name="minute">
            <xsl:value-of select="substring($time,4,2)" />
        </xsl:variable>
        <xsl:variable name="second">
            <xsl:value-of select="substring($time,7,2)" />
        </xsl:variable>

        <!-- Month output options -->
        <xsl:variable name="short-month">
            <xsl:choose>
                <xsl:when test="$month = '01'">Jan</xsl:when>
                <xsl:when test="$month = '02'">Feb</xsl:when>
                <xsl:when test="$month = '03'">Mar</xsl:when>
                <xsl:when test="$month = '04'">Apr</xsl:when>
				<xsl:when test="$month = '05'">May</xsl:when>
                <xsl:when test="$month = '06'">Jun</xsl:when>
                <xsl:when test="$month = '07'">Jul</xsl:when>
                <xsl:when test="$month = '08'">Aug</xsl:when>
				<xsl:when test="$month = '09'">Sep</xsl:when>
                <xsl:when test="$month = '10'">Oct</xsl:when>
                <xsl:when test="$month = '11'">Nov</xsl:when>
                <xsl:when test="$month = '12'">Dec</xsl:when>
                <xsl:otherwise><xsl:value-of select="$month"/></xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="long-month">
            <xsl:choose>
                <xsl:when test="$month = '01'">January</xsl:when>
				<xsl:when test="$month = '02'">February</xsl:when>
                <xsl:when test="$month = '03'">March</xsl:when>
                <xsl:when test="$month = '04'">April</xsl:when>
                <xsl:when test="$month = '05'">May</xsl:when>
				<xsl:when test="$month = '06'">June</xsl:when>
                <xsl:when test="$month = '07'">July</xsl:when>
                <xsl:when test="$month = '08'">August</xsl:when>
                <xsl:when test="$month = '09'">September</xsl:when>
				<xsl:when test="$month = '10'">October</xsl:when>
                <xsl:when test="$month = '11'">November</xsl:when>
                <xsl:when test="$month = '12'">December</xsl:when>
                <xsl:otherwise><xsl:value-of select="$month"/></xsl:otherwise>
            </xsl:choose>
        </xsl:variable>

        <!--  Day Suffix output option (st/nd/rd/th) -->
        <xsl:variable name="day-suffix">
            <xsl:if test="$day &gt; 9">
                <xsl:choose>
                    <xsl:when test="substring($day, 2, 2) = 1 and substring($day, 1, 1) != 1">st</xsl:when>
                    <xsl:when test="substring($day, 2, 2) = 2 and substring($day, 1, 1) != 1">nd</xsl:when>
                    <xsl:when test="substring($day, 2, 2) = 3 and substring($day, 1, 1) != 1">rd</xsl:when>
                    <xsl:otherwise>th</xsl:otherwise>
                </xsl:choose>
            </xsl:if>
            <xsl:if test="$day &lt; 10">
                <xsl:choose>
                    <xsl:when test="$day = 1">st</xsl:when>
                    <xsl:when test="$day = 2">nd</xsl:when>
                    <xsl:when test="$day = 3">rd</xsl:when>
                    <xsl:otherwise>th</xsl:otherwise>
                </xsl:choose>
            </xsl:if>
        </xsl:variable>


        <!-- Year output option -->
        <xsl:variable name="short-year" select="substring($year,3,4)"/>
        <xsl:variable name="long-year" select="$year"/>

        <!-- Hour output options -->
        <xsl:variable name="twelve-hour-output">
            <xsl:choose>
                <xsl:when test="$hour &gt; 12">
                    <xsl:value-of select="$hour - 12"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="$hour"/>
				</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>

        <!-- AM/PM outputs -->
        <xsl:variable name="ampm-output">
            <xsl:choose>
                <xsl:when test="$hour &gt; 11">PM</xsl:when>
				<xsl:otherwise>AM</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>

        <!-- Replace $Format with relevant output variables from above -->
        <xsl:variable name="format1">
            <xsl:call-template name="string-replace-all">
                <xsl:with-param name="text" select="$Format" />
                <xsl:with-param name="replace" select="'%y'" />
                <xsl:with-param name="with" select="$short-year" />
            </xsl:call-template>
        </xsl:variable>

        <xsl:variable name="format2">
            <xsl:call-template name="string-replace-all">
                <xsl:with-param name="text" select="$format1" />
                <xsl:with-param name="replace" select="'%Y'" />
                <xsl:with-param name="with" select="$long-year" />
            </xsl:call-template>
        </xsl:variable>

        <xsl:variable name="format3">
            <xsl:call-template name="string-replace-all">
                <xsl:with-param name="text" select="$format2" />
                <xsl:with-param name="replace" select="'%B'" />
                <xsl:with-param name="with" select="$long-month" />
            </xsl:call-template>
        </xsl:variable>

        <xsl:variable name="format4">
            <xsl:call-template name="string-replace-all">
                <xsl:with-param name="text" select="$format3" />
                <xsl:with-param name="replace" select="'%b'" />
                <xsl:with-param name="with" select="$short-month" />
            </xsl:call-template>
        </xsl:variable>

        <xsl:variable name="format5">
            <xsl:call-template name="string-replace-all">
                <xsl:with-param name="text" select="$format4" />
                <xsl:with-param name="replace" select="'%m'" />
                <xsl:with-param name="with" select="$month" />
            </xsl:call-template>
        </xsl:variable>

        <xsl:variable name="format6">
            <xsl:call-template name="string-replace-all">
                <xsl:with-param name="text" select="$format5" />
                <xsl:with-param name="replace" select="'%D'" />
                <xsl:with-param name="with" select="$day" />
            </xsl:call-template>
        </xsl:variable>

        <xsl:variable name="format7">
            <xsl:call-template name="string-replace-all">
                <xsl:with-param name="text" select="$format6" />
                <xsl:with-param name="replace" select="'%H'" />
                <xsl:with-param name="with" select="$hour" />
            </xsl:call-template>
		</xsl:variable>

        <xsl:variable name="format8">
            <xsl:call-template name="string-replace-all">
                <xsl:with-param name="text" select="$format7" />
                <xsl:with-param name="replace" select="'%I'" />
				<xsl:with-param name="with" select="$twelve-hour-output" />
            </xsl:call-template>
        </xsl:variable>

        <xsl:variable name="format9">
            <xsl:call-template name="string-replace-all">
                <xsl:with-param name="text" select="$format8" />
                <xsl:with-param name="replace" select="'%M'" />
                <xsl:with-param name="with" select="$minute" />
            </xsl:call-template>
        </xsl:variable>

        <xsl:variable name="format10">
			<xsl:call-template name="string-replace-all">
                <xsl:with-param name="text" select="$format9" />
                <xsl:with-param name="replace" select="'%s'" />
                <xsl:with-param name="with" select="$second" />
			</xsl:call-template>
        </xsl:variable>

        <xsl:variable name="format11">
            <xsl:call-template name="string-replace-all">
                <xsl:with-param name="text" select="$format10" />
                <xsl:with-param name="replace" select="'%p'" />
                <xsl:with-param name="with" select="$ampm-output" />
            </xsl:call-template>
        </xsl:variable>

        <xsl:variable name="format12">
            <xsl:call-template name="string-replace-all">
				<xsl:with-param name="text" select="$format11" />
                <xsl:with-param name="replace" select="'%d'" />
                <xsl:with-param name="with" select="$day-short" />
            </xsl:call-template>
        </xsl:variable>

        <xsl:variable name="final-output">
            <xsl:call-template name="string-replace-all">
                <xsl:with-param name="text" select="$format12" />
                <xsl:with-param name="replace" select="'%e'" />
                <xsl:with-param name="with" select="$day-suffix" />
            </xsl:call-template>
        </xsl:variable>

        <xsl:choose>
            <xsl:when test="$DateTime != ''"><xsl:value-of select="$final-output"/></xsl:when>
            <xsl:otherwise> </xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>