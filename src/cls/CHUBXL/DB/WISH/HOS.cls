Class CHUBXL.DB.WISH.HOS Extends %Library.Persistent [ ClassType = persistent, Not ProcedureBlock, SqlRowIdPrivate, SqlTableName = HOS, StorageStrategy = GSQLStorage ]
{

Property ABSE As %String(EXTERNALSQLNAME = "ABSE", EXTERNALSQLTYPE = 1, MAXLEN = 1) [ Required, SqlColumnNumber = 61, SqlFieldName = ABSE ];

Property ADOC1 As %String(EXTERNALSQLNAME = "ADOC1", EXTERNALSQLTYPE = 1, MAXLEN = 5) [ Required, SqlColumnNumber = 26, SqlFieldName = ADOC1 ];

Property AFPE As %String(EXTERNALSQLNAME = "AFPE", EXTERNALSQLTYPE = 1, MAXLEN = 1) [ Required, SqlColumnNumber = 63, SqlFieldName = AFPE ];

Property AGRP As %Numeric(EXTERNALSQLNAME = "AGRP", EXTERNALSQLTYPE = 3, MAXVAL = 99999999999, MINVAL = -99999999999, SCALE = 0) [ Required, SqlColumnNumber = 47, SqlFieldName = AGRP ];

Property ASCO As %String(EXTERNALSQLNAME = "ASCO", EXTERNALSQLTYPE = 1, MAXLEN = 1) [ Required, SqlColumnNumber = 52, SqlFieldName = ASCO ];

Property BED1 As %String(EXTERNALSQLNAME = "BED1", EXTERNALSQLTYPE = 1, MAXLEN = 3) [ Required, SqlColumnNumber = 23, SqlFieldName = BED1 ];

Property CADF As %String(EXTERNALSQLNAME = "CADF", EXTERNALSQLTYPE = 1, MAXLEN = 2) [ Required, SqlColumnNumber = 51, SqlFieldName = CADF ];

Property CBACTY As %String(EXTERNALSQLNAME = "CBACTY", EXTERNALSQLTYPE = 1, MAXLEN = 1) [ Required, SqlColumnNumber = 64, SqlFieldName = CBACTY ];

Property CBACUT As %String(EXTERNALSQLNAME = "CBACUT", EXTERNALSQLTYPE = 1, MAXLEN = 3) [ Required, SqlColumnNumber = 76, SqlFieldName = CBACUT ];

Property CBADDT As %Numeric(EXTERNALSQLNAME = "CBADDT", EXTERNALSQLTYPE = 2, MAXVAL = 999999999999, MINVAL = -999999999999, SCALE = 0) [ Required, SqlColumnNumber = 11, SqlFieldName = CBADDT ];

Property CBADOC As %String(EXTERNALSQLNAME = "CBADOC", EXTERNALSQLTYPE = 1, MAXLEN = 5) [ Required, SqlColumnNumber = 24, SqlFieldName = CBADOC ];

Property CBADSU As %String(EXTERNALSQLNAME = "CBADSU", EXTERNALSQLTYPE = 1, MAXLEN = 2) [ Required, SqlColumnNumber = 14, SqlFieldName = CBADSU ];

Property CBADTY As %String(EXTERNALSQLNAME = "CBADTY", EXTERNALSQLTYPE = 1, MAXLEN = 1) [ Required, SqlColumnNumber = 5, SqlFieldName = CBADTY ];

Property CBBED As %String(EXTERNALSQLNAME = "CBBED", EXTERNALSQLTYPE = 1, MAXLEN = 3) [ Required, SqlColumnNumber = 19, SqlFieldName = CBBED ];

Property CBCOAC As %String(EXTERNALSQLNAME = "CBCOAC", EXTERNALSQLTYPE = 1, MAXLEN = 1) [ Required, SqlColumnNumber = 66, SqlFieldName = CBCOAC ];

Property CBCONT As %String(EXTERNALSQLNAME = "CBCONT", EXTERNALSQLTYPE = 1, MAXLEN = 1) [ Required, SqlColumnNumber = 69, SqlFieldName = CBCONT ];

Property CBDCRE As %Numeric(EXTERNALSQLNAME = "CBDCRE", EXTERNALSQLTYPE = 3, MAXVAL = 999999999999, MINVAL = -999999999999, SCALE = 0) [ Required, SqlColumnNumber = 87, SqlFieldName = CBDCRE ];

Property CBDDOC As %String(EXTERNALSQLNAME = "CBDDOC", EXTERNALSQLTYPE = 1, MAXLEN = 5) [ Required, SqlColumnNumber = 28, SqlFieldName = CBDDOC ];

Property CBDEPT As %String(EXTERNALSQLNAME = "CBDEPT", EXTERNALSQLTYPE = 1, MAXLEN = 4) [ Required, SqlColumnNumber = 16, SqlFieldName = CBDEPT ];

Property CBDHDT As %Numeric(EXTERNALSQLNAME = "CBDHDT", EXTERNALSQLTYPE = 2, MAXVAL = 999999999999, MINVAL = -999999999999, SCALE = 0) [ Required, SqlColumnNumber = 13, SqlFieldName = CBDHDT ];

Property CBDHTY As %String(EXTERNALSQLNAME = "CBDHTY", EXTERNALSQLTYPE = 1, MAXLEN = 2) [ Required, SqlColumnNumber = 12, SqlFieldName = CBDHTY ];

Property CBDVDT As %Numeric(EXTERNALSQLNAME = "CBDVDT", EXTERNALSQLTYPE = 2, MAXVAL = 999999999999, MINVAL = -999999999999, SCALE = 0) [ Required, SqlColumnNumber = 77, SqlFieldName = CBDVDT ];

Property CBEXLN As %Numeric(EXTERNALSQLNAME = "CBEXLN", EXTERNALSQLTYPE = 2, MAXVAL = 9999, MINVAL = -9999, SCALE = 0) [ Required, SqlColumnNumber = 72, SqlFieldName = CBEXLN ];

Property CBHEIG As %Numeric(EXTERNALSQLNAME = "CBHEIG", EXTERNALSQLTYPE = 2, MAXVAL = 99999, MINVAL = -99999, SCALE = 0) [ Required, SqlColumnNumber = 78, SqlFieldName = CBHEIG ];

Property CBIDUC As %String(EXTERNALSQLNAME = "CBIDUC", EXTERNALSQLTYPE = 1, MAXLEN = 10) [ Required, SqlColumnNumber = 86, SqlFieldName = CBIDUC ];

Property CBINFT As %String(EXTERNALSQLNAME = "CBINFT", EXTERNALSQLTYPE = 1, MAXLEN = 1) [ Required, SqlColumnNumber = 70, SqlFieldName = CBINFT ];

Property CBINJU As %String(EXTERNALSQLNAME = "CBINJU", EXTERNALSQLTYPE = 1, MAXLEN = 1) [ Required, SqlColumnNumber = 67, SqlFieldName = CBINJU ];

Property CBMRN As %Numeric(EXTERNALSQLNAME = "CBMRN", EXTERNALSQLTYPE = 2, MAXVAL = 9999999999, MINVAL = -9999999999, SCALE = 0) [ Required, SqlColumnNumber = 3, SqlFieldName = CBMRN ];

Property CBNCAT As %String(EXTERNALSQLNAME = "CBNCAT", EXTERNALSQLTYPE = 1, MAXLEN = 4) [ Required, SqlColumnNumber = 75, SqlFieldName = CBNCAT ];

Property CBNSID As %String(EXTERNALSQLNAME = "CBNSID", EXTERNALSQLTYPE = 1, MAXLEN = 4) [ Required, SqlColumnNumber = 17, SqlFieldName = CBNSID ];

Property CBPCON As %String(EXTERNALSQLNAME = "CBPCON", EXTERNALSQLTYPE = 1, MAXLEN = 5) [ Required, SqlColumnNumber = 65, SqlFieldName = CBPCON ];

Property CBPRIV As %String(EXTERNALSQLNAME = "CBPRIV", EXTERNALSQLTYPE = 1, MAXLEN = 1) [ Required, SqlColumnNumber = 71, SqlFieldName = CBPRIV ];

Property CBROOM As %String(EXTERNALSQLNAME = "CBROOM", EXTERNALSQLTYPE = 1, MAXLEN = 4) [ Required, SqlColumnNumber = 18, SqlFieldName = CBROOM ];

Property CBSMOK As %String(EXTERNALSQLNAME = "CBSMOK", EXTERNALSQLTYPE = 1, MAXLEN = 1) [ Required, SqlColumnNumber = 68, SqlFieldName = CBSMOK ];

Property CBSTUS As %String(EXTERNALSQLNAME = "CBSTUS", EXTERNALSQLTYPE = 1, MAXLEN = 1) [ Required, SqlColumnNumber = 10, SqlFieldName = CBSTUS ];

Property CBTRNS As %String(EXTERNALSQLNAME = "CBTRNS", EXTERNALSQLTYPE = 1, MAXLEN = 1) [ Required, SqlColumnNumber = 73, SqlFieldName = CBTRNS ];

Property CBTYPE As %String(EXTERNALSQLNAME = "CBTYPE", EXTERNALSQLTYPE = 1, MAXLEN = 1) [ Required, SqlColumnNumber = 4, SqlFieldName = CBTYPE ];

Property CBUPDT As %Numeric(EXTERNALSQLNAME = "CBUPDT", EXTERNALSQLTYPE = 3, MAXVAL = 999999999999, MINVAL = -999999999999, SCALE = 0) [ Required, SqlColumnNumber = 89, SqlFieldName = CBUPDT ];

Property CBVIST As %String(EXTERNALSQLNAME = "CBVIST", EXTERNALSQLTYPE = 1, MAXLEN = 1) [ Required, SqlColumnNumber = 74, SqlFieldName = CBVIST ];

Property CBWEIG As %Numeric(EXTERNALSQLNAME = "CBWEIG", EXTERNALSQLTYPE = 2, MAXVAL = 99999, MINVAL = -99999, SCALE = 0) [ Required, SqlColumnNumber = 79, SqlFieldName = CBWEIG ];

Property CCAT As %Numeric(EXTERNALSQLNAME = "CCAT", EXTERNALSQLTYPE = 3, MAXVAL = 9, MINVAL = -9, SCALE = 0) [ Required, SqlColumnNumber = 62, SqlFieldName = CCAT ];

Property CDES As %String(EXTERNALSQLNAME = "CDES", EXTERNALSQLTYPE = 1, MAXLEN = 1) [ Required, SqlColumnNumber = 53, SqlFieldName = CDES ];

Property CFAC As %Numeric(EXTERNALSQLNAME = "CFAC", EXTERNALSQLTYPE = 3, MAXVAL = 9, MINVAL = -9, SCALE = 0) [ Required, SqlColumnNumber = 45, SqlFieldName = CFAC ];

Property CGAD As %String(EXTERNALSQLNAME = "CGAD", EXTERNALSQLTYPE = 1, MAXLEN = 1) [ Required, SqlColumnNumber = 56, SqlFieldName = CGAD ];

Property CGAR As %String(EXTERNALSQLNAME = "CGAR", EXTERNALSQLTYPE = 1, MAXLEN = 1) [ Required, SqlColumnNumber = 55, SqlFieldName = CGAR ];

Property COJE As %Numeric(EXTERNALSQLNAME = "COJE", EXTERNALSQLTYPE = 3, MAXVAL = 999, MINVAL = -999, SCALE = 0) [ Required, SqlColumnNumber = 6, SqlFieldName = COJE ];

Property CPAS As %Numeric(EXTERNALSQLNAME = "CPAS", EXTERNALSQLTYPE = 3, MAXVAL = 99999, MINVAL = -99999, SCALE = 0) [ Required, SqlColumnNumber = 9, SqlFieldName = CPAS ];

Property DDCL As %Numeric(EXTERNALSQLNAME = "DDCL", EXTERNALSQLTYPE = 3, MAXVAL = 99999999, MINVAL = -99999999, SCALE = 0) [ Required, SqlColumnNumber = 46, SqlFieldName = DDCL ];

Property DDEF As %Numeric(EXTERNALSQLNAME = "DDEF", EXTERNALSQLTYPE = 3, MAXVAL = 99999999, MINVAL = -99999999, SCALE = 0) [ Required, SqlColumnNumber = 43, SqlFieldName = DDEF ];

Property DEPT1 As %String(EXTERNALSQLNAME = "DEPT1", EXTERNALSQLTYPE = 1, MAXLEN = 4) [ Required, SqlColumnNumber = 20, SqlFieldName = DEPT1 ];

Property DEST As %String(EXTERNALSQLNAME = "DEST", EXTERNALSQLTYPE = 1, MAXLEN = 20) [ Required, SqlColumnNumber = 54, SqlFieldName = DEST ];

Property DPIP As %Numeric(EXTERNALSQLNAME = "DPIP", EXTERNALSQLTYPE = 3, MAXVAL = 99999999, MINVAL = -99999999, SCALE = 0) [ Required, SqlColumnNumber = 38, SqlFieldName = DPIP ];

Property DPRF As %Numeric(EXTERNALSQLNAME = "DPRF", EXTERNALSQLTYPE = 3, MAXVAL = 99999999, MINVAL = -99999999, SCALE = 0) [ Required, SqlColumnNumber = 41, SqlFieldName = DPRF ];

Property FAPA As %String(EXTERNALSQLNAME = "FAPA", EXTERNALSQLTYPE = 1, MAXLEN = 1) [ Required, SqlColumnNumber = 8, SqlFieldName = FAPA ];

Property HDOC1 As %String(EXTERNALSQLNAME = "HDOC1", EXTERNALSQLTYPE = 1, MAXLEN = 5) [ Required, SqlColumnNumber = 27, SqlFieldName = HDOC1 ];

Property HDOC2 As %String(EXTERNALSQLNAME = "HDOC2", EXTERNALSQLTYPE = 1, MAXLEN = 5) [ Required, SqlColumnNumber = 25, SqlFieldName = HDOC2 ];

Property IDUM As %String(EXTERNALSQLNAME = "IDUM", EXTERNALSQLTYPE = 1, MAXLEN = 10) [ Required, SqlColumnNumber = 88, SqlFieldName = IDUM ];

Property LAVADM As %String(EXTERNALSQLNAME = "LAVADM", EXTERNALSQLTYPE = 1, MAXLEN = 1) [ Required, SqlColumnNumber = 32, SqlFieldName = LAVADM ];

Property MOTE As %Numeric(EXTERNALSQLNAME = "MOTE", EXTERNALSQLTYPE = 3, MAXVAL = 99, MINVAL = -99, SCALE = 0) [ Required, SqlColumnNumber = 7, SqlFieldName = MOTE ];

Property MOYE As %String(EXTERNALSQLNAME = "MOYE", EXTERNALSQLTYPE = 1, MAXLEN = 1) [ Required, SqlColumnNumber = 58, SqlFieldName = MOYE ];

Property NDEF As %Numeric(EXTERNALSQLNAME = "NDEF", EXTERNALSQLTYPE = 3, MAXVAL = 999999, MINVAL = -999999, SCALE = 0) [ Required, SqlColumnNumber = 44, SqlFieldName = NDEF ];

Property NIRC As %String(EXTERNALSQLNAME = "NIRC", EXTERNALSQLTYPE = 1, MAXLEN = 10) [ Required, SqlColumnNumber = 59, SqlFieldName = NIRC ];

Property NJHS As %Numeric(EXTERNALSQLNAME = "NJHS", EXTERNALSQLTYPE = 3, MAXVAL = 999, MINVAL = -999, SCALE = 0) [ Required, SqlColumnNumber = 60, SqlFieldName = NJHS ];

Property NPRF As %Numeric(EXTERNALSQLNAME = "NPRF", EXTERNALSQLTYPE = 3, MAXVAL = 999999, MINVAL = -999999, SCALE = 0) [ Required, SqlColumnNumber = 42, SqlFieldName = NPRF ];

Property NSEJ As %Numeric(EXTERNALSQLNAME = "NSEJ", EXTERNALSQLTYPE = 2, MAXVAL = 9999999999, MINVAL = -9999999999, SCALE = 0) [ Required, SqlColumnNumber = 2, SqlFieldName = NSEJ ];

Property NSID1 As %String(EXTERNALSQLNAME = "NSID1", EXTERNALSQLTYPE = 1, MAXLEN = 4) [ Required, SqlColumnNumber = 21, SqlFieldName = NSID1 ];

Property REDP As %Numeric(EXTERNALSQLNAME = "REDP", EXTERNALSQLTYPE = 3, MAXVAL = 999, MINVAL = -999, SCALE = 0) [ Required, SqlColumnNumber = 49, SqlFieldName = REDP ];

Property ROOM1 As %String(EXTERNALSQLNAME = "ROOM1", EXTERNALSQLTYPE = 1, MAXLEN = 4) [ Required, SqlColumnNumber = 22, SqlFieldName = ROOM1 ];

Property SACEVF As %String(EXTERNALSQLNAME = "SACEVF", EXTERNALSQLTYPE = 1, MAXLEN = 1) [ Required, SqlColumnNumber = 31, SqlFieldName = SACEVF ];

Property SACRSF As %String(EXTERNALSQLNAME = "SACRSF", EXTERNALSQLTYPE = 1, MAXLEN = 2) [ Required, SqlColumnNumber = 40, SqlFieldName = SACRSF ];

Property SAENGP As %String(EXTERNALSQLNAME = "SAENGP", EXTERNALSQLTYPE = 1, MAXLEN = 1) [ Required, SqlColumnNumber = 37, SqlFieldName = SAENGP ];

Property SAREA1 As %String(EXTERNALSQLNAME = "SAREA1", EXTERNALSQLTYPE = 1, MAXLEN = 10) [ Required, SqlColumnNumber = 94, SqlFieldName = SAREA1 ];

Property SAREA2 As %Numeric(EXTERNALSQLNAME = "SAREA2", EXTERNALSQLTYPE = 3, MAXVAL = 999999999999, MINVAL = -999999999999, SCALE = 0) [ Required, SqlColumnNumber = 95, SqlFieldName = SAREA2 ];

Property SASITE As %String(EXTERNALSQLNAME = "SASITE", EXTERNALSQLTYPE = 1, MAXLEN = 2) [ Required, SqlColumnNumber = 15, SqlFieldName = SASITE ];

Property SASTOF As %String(EXTERNALSQLNAME = "SASTOF", EXTERNALSQLTYPE = 1, MAXLEN = 1) [ Required, SqlColumnNumber = 39, SqlFieldName = SASTOF ];

Property SATARS As %Numeric(EXTERNALSQLNAME = "SATARS", EXTERNALSQLTYPE = 2, MAXVAL = 9, MINVAL = -9, SCALE = 0) [ Required, SqlColumnNumber = 33, SqlFieldName = SATARS ];

Property SATYAM As %String(EXTERNALSQLNAME = "SATYAM", EXTERNALSQLTYPE = 1, MAXLEN = 4) [ Required, SqlColumnNumber = 29, SqlFieldName = SATYAM ];

Property SZL1 As %String(EXTERNALSQLNAME = "SZL1", EXTERNALSQLTYPE = 1, MAXLEN = 2) [ Required, SqlColumnNumber = 80, SqlFieldName = SZL1 ];

Property SZL2 As %String(EXTERNALSQLNAME = "SZL2", EXTERNALSQLTYPE = 1, MAXLEN = 2) [ Required, SqlColumnNumber = 81, SqlFieldName = SZL2 ];

Property SZL3 As %String(EXTERNALSQLNAME = "SZL3", EXTERNALSQLTYPE = 1, MAXLEN = 2) [ Required, SqlColumnNumber = 82, SqlFieldName = SZL3 ];

Property SZL4 As %String(EXTERNALSQLNAME = "SZL4", EXTERNALSQLTYPE = 1, MAXLEN = 2) [ Required, SqlColumnNumber = 83, SqlFieldName = SZL4 ];

Property SZL5 As %String(EXTERNALSQLNAME = "SZL5", EXTERNALSQLTYPE = 1, MAXLEN = 2) [ Required, SqlColumnNumber = 84, SqlFieldName = SZL5 ];

Property SZL6 As %String(EXTERNALSQLNAME = "SZL6", EXTERNALSQLTYPE = 1, MAXLEN = 10) [ Required, SqlColumnNumber = 85, SqlFieldName = SZL6 ];

Property TARA As %Numeric(EXTERNALSQLNAME = "TARA", EXTERNALSQLTYPE = 3, MAXVAL = 9, MINVAL = -9, SCALE = 0) [ Required, SqlColumnNumber = 36, SqlFieldName = TARA ];

Property TARC As %Numeric(EXTERNALSQLNAME = "TARC", EXTERNALSQLTYPE = 3, MAXVAL = 9, MINVAL = -9, SCALE = 0) [ Required, SqlColumnNumber = 34, SqlFieldName = TARC ];

Property TARE As %Numeric(EXTERNALSQLNAME = "TARE", EXTERNALSQLTYPE = 3, MAXVAL = 9, MINVAL = -9, SCALE = 0) [ Required, SqlColumnNumber = 35, SqlFieldName = TARE ];

Property TBFA As %String(EXTERNALSQLNAME = "TBFA", EXTERNALSQLTYPE = 1, MAXLEN = 3) [ Required, SqlColumnNumber = 50, SqlFieldName = TBFA ];

Property URGE As %String(EXTERNALSQLNAME = "URGE", EXTERNALSQLTYPE = 1, MAXLEN = 1) [ Required, SqlColumnNumber = 57, SqlFieldName = URGE ];

Index MainIndex On NSEJ [ IdKey, PrimaryKey ];

Parameter CONNECTION = "WISHBRU,NOCREATE";

Parameter EXTDBNAME = "DB2/400 SQL";

Parameter EXTERNALTABLENAME = "MEDBRGF.SAHML0";

Storage GSQLStorage
{
<ExtentSize>100000</ExtentSize>
<StreamLocation>^CHUBXL.DB.WISH.HOSS</StreamLocation>
<Type>%CacheSQLStorage</Type>
}

}
