Class CHUBXL.DB.WISH.PATIENTS Extends %Library.Persistent [ ClassType = persistent, Not ProcedureBlock, SqlRowIdPrivate, SqlTableName = PATIENTS, StorageStrategy = GSQLStorage ]
{

Property ADPR As %String(EXTERNALSQLNAME = "ADPR", EXTERNALSQLTYPE = 1, MAXLEN = 60) [ Required, SqlColumnNumber = 32, SqlFieldName = ADPR ];

Property CETC2 As %String(EXTERNALSQLNAME = "CETC2", EXTERNALSQLTYPE = 1, MAXLEN = 1) [ Required, SqlColumnNumber = 46, SqlFieldName = CETC2 ];

Property CETC3 As %String(EXTERNALSQLNAME = "CETC3", EXTERNALSQLTYPE = 1, MAXLEN = 1) [ Required, SqlColumnNumber = 48, SqlFieldName = CETC3 ];

Property CLNG As %String(EXTERNALSQLNAME = "CLNG", EXTERNALSQLTYPE = 1, MAXLEN = 1) [ Required, SqlColumnNumber = 13, SqlFieldName = CLNG ];

Property CNAMEC As %String(EXTERNALSQLNAME = "CNAMEC", EXTERNALSQLTYPE = 1, MAXLEN = 38) [ Required, SqlColumnNumber = 76, SqlFieldName = CNAMEC ];

Property CPAY As %String(EXTERNALSQLNAME = "CPAY", EXTERNALSQLTYPE = 1, MAXLEN = 3) [ Required, SqlColumnNumber = 8, SqlFieldName = CPAY ];

Property CPPR As %String(EXTERNALSQLNAME = "CPPR", EXTERNALSQLTYPE = 1, MAXLEN = 6) [ Required, SqlColumnNumber = 33, SqlFieldName = CPPR ];

Property CST1 As %String(EXTERNALSQLNAME = "CST1", EXTERNALSQLTYPE = 1, MAXLEN = 2) [ Required, SqlColumnNumber = 35, SqlFieldName = CST1 ];

Property CST2 As %String(EXTERNALSQLNAME = "CST2", EXTERNALSQLTYPE = 1, MAXLEN = 2) [ Required, SqlColumnNumber = 36, SqlFieldName = CST2 ];

Property CST3 As %String(EXTERNALSQLNAME = "CST3", EXTERNALSQLTYPE = 1, MAXLEN = 2) [ Required, SqlColumnNumber = 37, SqlFieldName = CST3 ];

Property CST4 As %String(EXTERNALSQLNAME = "CST4", EXTERNALSQLTYPE = 1, MAXLEN = 2) [ Required, SqlColumnNumber = 38, SqlFieldName = CST4 ];

Property CST5 As %String(EXTERNALSQLNAME = "CST5", EXTERNALSQLTYPE = 1, MAXLEN = 2) [ Required, SqlColumnNumber = 39, SqlFieldName = CST5 ];

Property DCPR As %Numeric(EXTERNALSQLNAME = "DCPR", EXTERNALSQLTYPE = 3, MAXVAL = 99999999, MINVAL = -99999999, SCALE = 0) [ Required, SqlColumnNumber = 31, SqlFieldName = DCPR ];

Property DDBL As %String(EXTERNALSQLNAME = "DDBL", EXTERNALSQLTYPE = 1, MAXLEN = 1) [ Required, SqlColumnNumber = 10, SqlFieldName = DDBL ];

Property DDVI As %Numeric(EXTERNALSQLNAME = "DDVI", EXTERNALSQLTYPE = 3, MAXVAL = 99999999, MINVAL = -99999999, SCALE = 0) [ Required, SqlColumnNumber = 66, SqlFieldName = DDVI ];

Property DETC1 As %Numeric(EXTERNALSQLNAME = "DETC1", EXTERNALSQLTYPE = 3, MAXVAL = 99999999, MINVAL = -99999999, SCALE = 0) [ Required, SqlColumnNumber = 45, SqlFieldName = DETC1 ];

Property DETC2 As %Numeric(EXTERNALSQLNAME = "DETC2", EXTERNALSQLTYPE = 3, MAXVAL = 99999999, MINVAL = -99999999, SCALE = 0) [ Required, SqlColumnNumber = 47, SqlFieldName = DETC2 ];

Property DETC3 As %Numeric(EXTERNALSQLNAME = "DETC3", EXTERNALSQLTYPE = 3, MAXVAL = 99999999, MINVAL = -99999999, SCALE = 0) [ Required, SqlColumnNumber = 49, SqlFieldName = DETC3 ];

Property DETC4 As %Numeric(EXTERNALSQLNAME = "DETC4", EXTERNALSQLTYPE = 3, MAXVAL = 99999999, MINVAL = -99999999, SCALE = 0) [ Required, SqlColumnNumber = 15, SqlFieldName = DETC4 ];

Property DZL1 As %String(EXTERNALSQLNAME = "DZL1", EXTERNALSQLTYPE = 1, MAXLEN = 2) [ Required, SqlColumnNumber = 53, SqlFieldName = DZL1 ];

Property DZL2 As %String(EXTERNALSQLNAME = "DZL2", EXTERNALSQLTYPE = 1, MAXLEN = 2) [ Required, SqlColumnNumber = 54, SqlFieldName = DZL2 ];

Property DZL3 As %String(EXTERNALSQLNAME = "DZL3", EXTERNALSQLTYPE = 1, MAXLEN = 2) [ Required, SqlColumnNumber = 55, SqlFieldName = DZL3 ];

Property DZL4 As %String(EXTERNALSQLNAME = "DZL4", EXTERNALSQLTYPE = 1, MAXLEN = 2) [ Required, SqlColumnNumber = 56, SqlFieldName = DZL4 ];

Property DZL5 As %String(EXTERNALSQLNAME = "DZL5", EXTERNALSQLTYPE = 1, MAXLEN = 2) [ Required, SqlColumnNumber = 57, SqlFieldName = DZL5 ];

Property DZL6 As %String(EXTERNALSQLNAME = "DZL6", EXTERNALSQLTYPE = 1, MAXLEN = 10) [ Required, SqlColumnNumber = 58, SqlFieldName = DZL6 ];

Property IDUC As %String(EXTERNALSQLNAME = "IDUC", EXTERNALSQLTYPE = 1, MAXLEN = 10) [ Required, SqlColumnNumber = 77, SqlFieldName = IDUC ];

Property IDUM As %String(EXTERNALSQLNAME = "IDUM", EXTERNALSQLTYPE = 1, MAXLEN = 10) [ Required, SqlColumnNumber = 79, SqlFieldName = IDUM ];

Property LNAI As %String(EXTERNALSQLNAME = "LNAI", EXTERNALSQLTYPE = 1, MAXLEN = 20) [ Required, SqlColumnNumber = 43, SqlFieldName = LNAI ];

Property LPFE As %String(EXTERNALSQLNAME = "LPFE", EXTERNALSQLTYPE = 1, MAXLEN = 15) [ Required, SqlColumnNumber = 52, SqlFieldName = LPFE ];

Property NADM As %Numeric(EXTERNALSQLNAME = "NADM", EXTERNALSQLTYPE = 2, MAXVAL = 9999999999, MINVAL = -9999999999, SCALE = 0) [ Required, SqlColumnNumber = 61, SqlFieldName = NADM ];

Property NBSJ As %Numeric(EXTERNALSQLNAME = "NBSJ", EXTERNALSQLTYPE = 3, MAXVAL = 999, MINVAL = -999, SCALE = 0) [ Required, SqlColumnNumber = 67, SqlFieldName = NBSJ ];

Property NENF As %Numeric(EXTERNALSQLNAME = "NENF", EXTERNALSQLTYPE = 3, MAXVAL = 99, MINVAL = -99, SCALE = 0) [ Required, SqlColumnNumber = 50, SqlFieldName = NENF ];

Property NIDE As %String(EXTERNALSQLNAME = "NIDE", EXTERNALSQLTYPE = 1, MAXLEN = 12) [ Required, SqlColumnNumber = 28, SqlFieldName = NIDE ];

Property NMDT As %Numeric(EXTERNALSQLNAME = "NMDT", EXTERNALSQLTYPE = 3, MAXVAL = 99999999, MINVAL = -99999999, SCALE = 0) [ Required, SqlColumnNumber = 30, SqlFieldName = NMDT ];

Property NMER As %String(EXTERNALSQLNAME = "NMER", EXTERNALSQLTYPE = 1, MAXLEN = 25) [ Required, SqlColumnNumber = 42, SqlFieldName = NMER ];

Property NPER As %String(EXTERNALSQLNAME = "NPER", EXTERNALSQLTYPE = 1, MAXLEN = 25) [ Required, SqlColumnNumber = 41, SqlFieldName = NPER ];

Property PBADDR As %String(EXTERNALSQLNAME = "PBADDR", EXTERNALSQLTYPE = 1, MAXLEN = 60) [ Required, SqlColumnNumber = 6, SqlFieldName = PBADDR ];

Property PBALRG As %String(EXTERNALSQLNAME = "PBALRG", EXTERNALSQLTYPE = 1, MAXLEN = 1) [ Required, SqlColumnNumber = 68, SqlFieldName = PBALRG ];

Property PBATNM As %String(EXTERNALSQLNAME = "PBATNM", EXTERNALSQLTYPE = 1, MAXLEN = 38) [ Required, SqlColumnNumber = 16, SqlFieldName = PBATNM ];

Property PBBLOD As %String(EXTERNALSQLNAME = "PBBLOD", EXTERNALSQLTYPE = 1, MAXLEN = 2) [ Required, SqlColumnNumber = 70, SqlFieldName = PBBLOD ];

Property PBBLRH As %String(EXTERNALSQLNAME = "PBBLRH", EXTERNALSQLTYPE = 1, MAXLEN = 1) [ Required, SqlColumnNumber = 71, SqlFieldName = PBBLRH ];

Property PBDCRE As %Numeric(EXTERNALSQLNAME = "PBDCRE", EXTERNALSQLTYPE = 3, MAXVAL = 999999999999, MINVAL = -999999999999, SCALE = 0) [ Required, SqlColumnNumber = 78, SqlFieldName = PBDCRE ];

Property PBDETH As %String(EXTERNALSQLNAME = "PBDETH", EXTERNALSQLTYPE = 1, MAXLEN = 1) [ Required, SqlColumnNumber = 14, SqlFieldName = PBDETH ];

Property PBDOB As %Numeric(EXTERNALSQLNAME = "PBDOB", EXTERNALSQLTYPE = 2, MAXVAL = 99999999, MINVAL = -99999999, SCALE = 0) [ Required, SqlColumnNumber = 4, SqlFieldName = PBDOB ];

Property PBEMPL As %String(EXTERNALSQLNAME = "PBEMPL", EXTERNALSQLTYPE = 1, MAXLEN = 1) [ Required, SqlColumnNumber = 11, SqlFieldName = PBEMPL ];

Property PBLCAS As %Numeric(EXTERNALSQLNAME = "PBLCAS", EXTERNALSQLTYPE = 2, MAXVAL = 9999999999, MINVAL = -9999999999, SCALE = 0) [ Required, SqlColumnNumber = 63, SqlFieldName = PBLCAS ];

Property PBLCST As %String(EXTERNALSQLNAME = "PBLCST", EXTERNALSQLTYPE = 1, MAXLEN = 1) [ Required, SqlColumnNumber = 65, SqlFieldName = PBLCST ];

Property PBLTYP As %String(EXTERNALSQLNAME = "PBLTYP", EXTERNALSQLTYPE = 1, MAXLEN = 1) [ Required, SqlColumnNumber = 64, SqlFieldName = PBLTYP ];

Property PBMARI As %String(EXTERNALSQLNAME = "PBMARI", EXTERNALSQLTYPE = 1, MAXLEN = 1) [ Required, SqlColumnNumber = 44, SqlFieldName = PBMARI ];

Property PBMRN As %Numeric(EXTERNALSQLNAME = "PBMRN", EXTERNALSQLTYPE = 2, MAXVAL = 9999999999, MINVAL = -9999999999, SCALE = 0) [ Required, SqlColumnNumber = 2, SqlFieldName = PBMRN ];

Property PBNAME As %String(EXTERNALSQLNAME = "PBNAME", EXTERNALSQLTYPE = 1, MAXLEN = 38) [ Required, SqlColumnNumber = 3, SqlFieldName = PBNAME ];

Property PBNATN As %String(EXTERNALSQLNAME = "PBNATN", EXTERNALSQLTYPE = 1, MAXLEN = 3) [ Required, SqlColumnNumber = 9, SqlFieldName = PBNATN ];

Property PBNPI As %String(EXTERNALSQLNAME = "PBNPI", EXTERNALSQLTYPE = 1, MAXLEN = 11) [ Required, SqlColumnNumber = 18, SqlFieldName = PBNPI ];

Property PBORGN As %String(EXTERNALSQLNAME = "PBORGN", EXTERNALSQLTYPE = 1, MAXLEN = 1) [ Required, SqlColumnNumber = 69, SqlFieldName = PBORGN ];

Property PBPHON As %String(EXTERNALSQLNAME = "PBPHON", EXTERNALSQLTYPE = 1, MAXLEN = 15) [ Required, SqlColumnNumber = 17, SqlFieldName = PBPHON ];

Property PBPMRN As %Numeric(EXTERNALSQLNAME = "PBPMRN", EXTERNALSQLTYPE = 2, MAXVAL = 9999999999, MINVAL = -9999999999, SCALE = 0) [ Required, SqlColumnNumber = 62, SqlFieldName = PBPMRN ];

Property PBREGN As %String(EXTERNALSQLNAME = "PBREGN", EXTERNALSQLTYPE = 1, MAXLEN = 5) [ Required, SqlColumnNumber = 40, SqlFieldName = PBREGN ];

Property PBRGDT As %Numeric(EXTERNALSQLNAME = "PBRGDT", EXTERNALSQLTYPE = 3, MAXVAL = 999999999999, MINVAL = -999999999999, SCALE = 0) [ Required, SqlColumnNumber = 80, SqlFieldName = PBRGDT ];

Property PBSECU As %String(EXTERNALSQLNAME = "PBSECU", EXTERNALSQLTYPE = 1, MAXLEN = 1) [ Required, SqlColumnNumber = 59, SqlFieldName = PBSECU ];

Property PBSEX As %String(EXTERNALSQLNAME = "PBSEX", EXTERNALSQLTYPE = 1, MAXLEN = 1) [ Required, SqlColumnNumber = 5, SqlFieldName = PBSEX ];

Property PBUFIL As %String(EXTERNALSQLNAME = "PBUFIL", EXTERNALSQLTYPE = 1, MAXLEN = 13) [ Required, SqlColumnNumber = 60, SqlFieldName = PBUFIL ];

Property PBVFIL As %String(EXTERNALSQLNAME = "PBVFIL", EXTERNALSQLTYPE = 1, MAXLEN = 10) [ Required, SqlColumnNumber = 72, SqlFieldName = PBVFIL ];

Property PBZIP As %String(EXTERNALSQLNAME = "PBZIP", EXTERNALSQLTYPE = 1, MAXLEN = 7) [ Required, SqlColumnNumber = 7, SqlFieldName = PBZIP ];

Property PHNE As %String(EXTERNALSQLNAME = "PHNE", EXTERNALSQLTYPE = 1, MAXLEN = 6) [ Required, SqlColumnNumber = 75, SqlFieldName = PHNE ];

Property PHPP As %String(EXTERNALSQLNAME = "PHPP", EXTERNALSQLTYPE = 1, MAXLEN = 6) [ Required, SqlColumnNumber = 73, SqlFieldName = PHPP ];

Property PIDE As %String(EXTERNALSQLNAME = "PIDE", EXTERNALSQLTYPE = 1, MAXLEN = 3) [ Required, SqlColumnNumber = 29, SqlFieldName = PIDE ];

Property PNAMEC As %String(EXTERNALSQLNAME = "PNAMEC", EXTERNALSQLTYPE = 1, MAXLEN = 38) [ Required, SqlColumnNumber = 74, SqlFieldName = PNAMEC ];

Property PYPR As %String(EXTERNALSQLNAME = "PYPR", EXTERNALSQLTYPE = 1, MAXLEN = 3) [ Required, SqlColumnNumber = 34, SqlFieldName = PYPR ];

Property REDP As %Numeric(EXTERNALSQLNAME = "REDP", EXTERNALSQLTYPE = 3, MAXVAL = 999, MINVAL = -999, SCALE = 0) [ Required, SqlColumnNumber = 12, SqlFieldName = REDP ];

Property RGSCL As %String(EXTERNALSQLNAME = "RGSCL", EXTERNALSQLTYPE = 1, MAXLEN = 2) [ Required, SqlColumnNumber = 51, SqlFieldName = RGSCL ];

Property SPREA1 As %String(EXTERNALSQLNAME = "SPREA1", EXTERNALSQLTYPE = 1, MAXLEN = 10) [ Required, SqlColumnNumber = 85, SqlFieldName = SPREA1 ];

Property SPREA2 As %Numeric(EXTERNALSQLNAME = "SPREA2", EXTERNALSQLTYPE = 3, MAXVAL = 999999999999, MINVAL = -999999999999, SCALE = 0) [ Required, SqlColumnNumber = 86, SqlFieldName = SPREA2 ];

Property SPRES1 As %String(EXTERNALSQLNAME = "SPRES1", EXTERNALSQLTYPE = 1, MAXLEN = 1) [ Required, SqlColumnNumber = 81, SqlFieldName = SPRES1 ];

Property SPRES2 As %String(EXTERNALSQLNAME = "SPRES2", EXTERNALSQLTYPE = 1, MAXLEN = 1) [ Required, SqlColumnNumber = 82, SqlFieldName = SPRES2 ];

Property SPRES3 As %String(EXTERNALSQLNAME = "SPRES3", EXTERNALSQLTYPE = 1, MAXLEN = 6) [ Required, SqlColumnNumber = 83, SqlFieldName = SPRES3 ];

Property SPRES4 As %String(EXTERNALSQLNAME = "SPRES4", EXTERNALSQLTYPE = 1, MAXLEN = 8) [ Required, SqlColumnNumber = 84, SqlFieldName = SPRES4 ];

Property SPTFADR As %String(EXTERNALSQLNAME = "SPTFADR", EXTERNALSQLTYPE = 1, MAXLEN = 1) [ Required, SqlColumnNumber = 26, SqlFieldName = SPTFADR ];

Property SPTFCAR As %String(EXTERNALSQLNAME = "SPTFCAR", EXTERNALSQLTYPE = 1, MAXLEN = 1) [ Required, SqlColumnNumber = 20, SqlFieldName = SPTFCAR ];

Property SPTFCPO As %String(EXTERNALSQLNAME = "SPTFCPO", EXTERNALSQLTYPE = 1, MAXLEN = 1) [ Required, SqlColumnNumber = 27, SqlFieldName = SPTFCPO ];

Property SPTFDEC As %String(EXTERNALSQLNAME = "SPTFDEC", EXTERNALSQLTYPE = 1, MAXLEN = 1) [ Required, SqlColumnNumber = 24, SqlFieldName = SPTFDEC ];

Property SPTFEID As %String(EXTERNALSQLNAME = "SPTFEID", EXTERNALSQLTYPE = 1, MAXLEN = 1) [ Required, SqlColumnNumber = 19, SqlFieldName = SPTFEID ];

Property SPTFNAI As %String(EXTERNALSQLNAME = "SPTFNAI", EXTERNALSQLTYPE = 1, MAXLEN = 1) [ Required, SqlColumnNumber = 23, SqlFieldName = SPTFNAI ];

Property SPTFNOM As %String(EXTERNALSQLNAME = "SPTFNOM", EXTERNALSQLTYPE = 1, MAXLEN = 1) [ Required, SqlColumnNumber = 21, SqlFieldName = SPTFNOM ];

Property SPTFPRE As %String(EXTERNALSQLNAME = "SPTFPRE", EXTERNALSQLTYPE = 1, MAXLEN = 1) [ Required, SqlColumnNumber = 22, SqlFieldName = SPTFPRE ];

Property SPTFRGN As %String(EXTERNALSQLNAME = "SPTFRGN", EXTERNALSQLTYPE = 1, MAXLEN = 1) [ Required, SqlColumnNumber = 25, SqlFieldName = SPTFRGN ];

Index MainIndex On PBMRN [ IdKey, PrimaryKey ];

Parameter CONNECTION = "WISHBRU,NOCREATE";

Parameter EXTDBNAME = "DB2/400 SQL";

Parameter EXTERNALTABLENAME = "MEDBRGF.SPTML0";

Storage GSQLStorage
{
<ExtentSize>100000</ExtentSize>
<StreamLocation>^CHUBXL.DB.WISH.PATIENTSS</StreamLocation>
<Type>%CacheSQLStorage</Type>
}

}
