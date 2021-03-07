Class CHUBXL.DB.WISH.HISMUT Extends %Library.Persistent [ ClassType = persistent, Not ProcedureBlock, SqlRowIdPrivate, SqlTableName = HISMUT, StorageStrategy = GSQLStorage ]
{

Property ADRT As %String(EXTERNALSQLNAME = "ADRT", EXTERNALSQLTYPE = 1, MAXLEN = 30) [ Required, SqlColumnNumber = 16, SqlFieldName = ADRT ];

Property CDCNV As %String(EXTERNALSQLNAME = "CDCNV", EXTERNALSQLTYPE = 1, MAXLEN = 1) [ Required, SqlColumnNumber = 23, SqlFieldName = CDCNV ];

Property CEVF As %String(EXTERNALSQLNAME = "CEVF", EXTERNALSQLTYPE = 1, MAXLEN = 1) [ Required, SqlColumnNumber = 13, SqlFieldName = CEVF ];

Property CHOM As %String(EXTERNALSQLNAME = "CHOM", EXTERNALSQLTYPE = 1, MAXLEN = 1) [ Required, SqlColumnNumber = 20, SqlFieldName = CHOM ];

Property CPT As %String(EXTERNALSQLNAME = "CPT", EXTERNALSQLTYPE = 1, MAXLEN = 6) [ Required, SqlColumnNumber = 17, SqlFieldName = CPT ];

Property CQUB As %Numeric(EXTERNALSQLNAME = "CQUB", EXTERNALSQLTYPE = 2, MAXVAL = 9, MINVAL = -9, SCALE = 0) [ Required, SqlColumnNumber = 11, SqlFieldName = CQUB ];

Property CRASP As %Numeric(EXTERNALSQLNAME = "CRASP", EXTERNALSQLTYPE = 2, MAXVAL = 9, MINVAL = -9, SCALE = 0) [ Required, SqlColumnNumber = 10, SqlFieldName = CRASP ];

Property CT1P As %Numeric(EXTERNALSQLNAME = "CT1P", EXTERNALSQLTYPE = 3, MAXVAL = 999, MINVAL = -999, SCALE = 0) [ Required, SqlColumnNumber = 8, SqlFieldName = CT1P ];

Property CT2P As %Numeric(EXTERNALSQLNAME = "CT2P", EXTERNALSQLTYPE = 3, MAXVAL = 999, MINVAL = -999, SCALE = 0) [ Required, SqlColumnNumber = 9, SqlFieldName = CT2P ];

Property DINT As %Numeric(EXTERNALSQLNAME = "DINT", EXTERNALSQLTYPE = 3, MAXVAL = 99999999, MINVAL = -99999999, SCALE = 0) [ Required, SqlColumnNumber = 12, SqlFieldName = DINT ];

Property DMMU As %Numeric(EXTERNALSQLNAME = "DMMU", EXTERNALSQLTYPE = 3, MAXVAL = 99999999, MINVAL = -99999999, SCALE = 0) [ Required, SqlColumnNumber = 3, SqlFieldName = DMMU ];

Property DNAT As %Numeric(EXTERNALSQLNAME = "DNAT", EXTERNALSQLTYPE = 3, MAXVAL = 99999999, MINVAL = -99999999, SCALE = 0) [ Required, SqlColumnNumber = 19, SqlFieldName = DNAT ];

Property FCSO As %String(EXTERNALSQLNAME = "FCSO", EXTERNALSQLTYPE = 1, MAXLEN = 1) [ Required, SqlColumnNumber = 22, SqlFieldName = FCSO ];

Property MATP As %String(EXTERNALSQLNAME = "MATP", EXTERNALSQLTYPE = 1, MAXLEN = 13) [ Required, SqlColumnNumber = 6, SqlFieldName = MATP ];

Property MATPSV As %String(EXTERNALSQLNAME = "MATPSV", EXTERNALSQLTYPE = 1, MAXLEN = 13) [ Required, SqlColumnNumber = 24, SqlFieldName = MATPSV ];

Property MATT As %String(EXTERNALSQLNAME = "MATT", EXTERNALSQLTYPE = 1, MAXLEN = 13) [ Required, SqlColumnNumber = 7, SqlFieldName = MATT ];

Property MUCTIM As %Numeric(EXTERNALSQLNAME = "MUCTIM", EXTERNALSQLTYPE = 3, MAXVAL = 999999, MINVAL = -999999, SCALE = 0) [ Required, SqlColumnNumber = 35, SqlFieldName = MUCTIM ];

Property MUDATC As %Numeric(EXTERNALSQLNAME = "MUDATC", EXTERNALSQLTYPE = 3, MAXVAL = 99999999, MINVAL = -99999999, SCALE = 0) [ Required, SqlColumnNumber = 34, SqlFieldName = MUDATC ];

Property MUMDAT As %Numeric(EXTERNALSQLNAME = "MUMDAT", EXTERNALSQLTYPE = 3, MAXVAL = 99999999, MINVAL = -99999999, SCALE = 0) [ Required, SqlColumnNumber = 37, SqlFieldName = MUMDAT ];

Property MUMPCAR As %Numeric(EXTERNALSQLNAME = "MUMPCAR", EXTERNALSQLTYPE = 3, MAXVAL = 999999999999, MINVAL = -999999999999, SCALE = 0) [ Required, SqlColumnNumber = 25, SqlFieldName = MUMPCAR ];

Property MUMPVERC As %Numeric(EXTERNALSQLNAME = "MUMPVERC", EXTERNALSQLTYPE = 3, MAXVAL = 999999, MINVAL = -999999, SCALE = 0) [ Required, SqlColumnNumber = 26, SqlFieldName = MUMPVERC ];

Property MUMTIM As %Numeric(EXTERNALSQLNAME = "MUMTIM", EXTERNALSQLTYPE = 3, MAXVAL = 999999, MINVAL = -999999, SCALE = 0) [ Required, SqlColumnNumber = 38, SqlFieldName = MUMTIM ];

Property MUREA1 As %String(EXTERNALSQLNAME = "MUREA1", EXTERNALSQLTYPE = 1, MAXLEN = 10) [ Required, SqlColumnNumber = 31, SqlFieldName = MUREA1 ];

Property MUREA2 As %Numeric(EXTERNALSQLNAME = "MUREA2", EXTERNALSQLTYPE = 3, MAXVAL = 999999999999, MINVAL = -999999999999, SCALE = 0) [ Required, SqlColumnNumber = 32, SqlFieldName = MUREA2 ];

Property MURES1 As %String(EXTERNALSQLNAME = "MURES1", EXTERNALSQLTYPE = 1, MAXLEN = 1) [ Required, SqlColumnNumber = 27, SqlFieldName = MURES1 ];

Property MURES2 As %String(EXTERNALSQLNAME = "MURES2", EXTERNALSQLTYPE = 1, MAXLEN = 1) [ Required, SqlColumnNumber = 28, SqlFieldName = MURES2 ];

Property MURES3 As %String(EXTERNALSQLNAME = "MURES3", EXTERNALSQLTYPE = 1, MAXLEN = 6) [ Required, SqlColumnNumber = 29, SqlFieldName = MURES3 ];

Property MURES4 As %String(EXTERNALSQLNAME = "MURES4", EXTERNALSQLTYPE = 1, MAXLEN = 8) [ Required, SqlColumnNumber = 30, SqlFieldName = MURES4 ];

Property MUTAP As %Numeric(EXTERNALSQLNAME = "MUTAP", EXTERNALSQLTYPE = 3, MAXVAL = 999, MINVAL = -999, SCALE = 0) [ Required, SqlColumnNumber = 4, SqlFieldName = MUTAP ];

Property MUTBP As %Numeric(EXTERNALSQLNAME = "MUTBP", EXTERNALSQLTYPE = 3, MAXVAL = 999, MINVAL = -999, SCALE = 0) [ Required, SqlColumnNumber = 5, SqlFieldName = MUTBP ];

Property MUTPAUT As %String(EXTERNALSQLNAME = "MUTPAUT", EXTERNALSQLTYPE = 1, MAXLEN = 1) [ Required, SqlColumnNumber = 14, SqlFieldName = MUTPAUT ];

Property MUUSCR As %String(EXTERNALSQLNAME = "MUUSCR", EXTERNALSQLTYPE = 1, MAXLEN = 10) [ Required, SqlColumnNumber = 33, SqlFieldName = MUUSCR ];

Property MUUSMO As %String(EXTERNALSQLNAME = "MUUSMO", EXTERNALSQLTYPE = 1, MAXLEN = 10) [ Required, SqlColumnNumber = 36, SqlFieldName = MUUSMO ];

Property NADM As %Numeric(EXTERNALSQLNAME = "NADM", EXTERNALSQLTYPE = 2, MAXVAL = 9999999999, MINVAL = -9999999999, SCALE = 0) [ Required, SqlColumnNumber = 2, SqlFieldName = NADM ];

Property NOMT As %String(EXTERNALSQLNAME = "NOMT", EXTERNALSQLTYPE = 1, MAXLEN = 30) [ Required, SqlColumnNumber = 15, SqlFieldName = NOMT ];

Property PACH As %String(EXTERNALSQLNAME = "PACH", EXTERNALSQLTYPE = 1, MAXLEN = 1) [ Required, SqlColumnNumber = 21, SqlFieldName = PACH ];

Property PAYT As %String(EXTERNALSQLNAME = "PAYT", EXTERNALSQLTYPE = 1, MAXLEN = 3) [ Required, SqlColumnNumber = 18, SqlFieldName = PAYT ];

Index MainIndex On NADM [ IdKey, PrimaryKey ];

Parameter CONNECTION = "WISHBRU,NOCREATE";

Parameter EXTDBNAME = "DB2/400 SQL";

Parameter EXTERNALTABLENAME = "MEDBRGF.SPTST1";

Storage GSQLStorage
{
<ExtentSize>100000</ExtentSize>
<StreamLocation>^CHUBXL.DB.WISH.HISMUTS</StreamLocation>
<Type>%CacheSQLStorage</Type>
}

}
