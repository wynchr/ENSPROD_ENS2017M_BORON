Class CHUBXL.DB.WISH.MERBEBE Extends %Library.Persistent [ ClassType = persistent, Not ProcedureBlock, SqlRowIdPrivate, SqlTableName = MERBEBE, StorageStrategy = GSQLStorage ]
{

Property CNABG1 As %Numeric(EXTERNALSQLNAME = "CNABG1", EXTERNALSQLTYPE = 2, MAXVAL = 99, MINVAL = -99, SCALE = 0) [ Required, SqlColumnNumber = 22, SqlFieldName = CNABG1 ];

Property CNABG2 As %Numeric(EXTERNALSQLNAME = "CNABG2", EXTERNALSQLTYPE = 2, MAXVAL = 99, MINVAL = -99, SCALE = 0) [ Required, SqlColumnNumber = 23, SqlFieldName = CNABG2 ];

Property CNACIN As %String(EXTERNALSQLNAME = "CNACIN", EXTERNALSQLTYPE = 1, MAXLEN = 1) [ Required, SqlColumnNumber = 15, SqlFieldName = CNACIN ];

Property CNADOC As %String(EXTERNALSQLNAME = "CNADOC", EXTERNALSQLTYPE = 1, MAXLEN = 5) [ Required, SqlColumnNumber = 16, SqlFieldName = CNADOC ];

Property CNANPE As %String(EXTERNALSQLNAME = "CNANPE", EXTERNALSQLTYPE = 1, MAXLEN = 1) [ Required, SqlColumnNumber = 14, SqlFieldName = CNANPE ];

Property CNBDDT As %Numeric(EXTERNALSQLNAME = "CNBDDT", EXTERNALSQLTYPE = 2, MAXVAL = 999999999999, MINVAL = -999999999999, SCALE = 0) [ Required, SqlColumnNumber = 9, SqlFieldName = CNBDDT ];

Property CNBED As %String(EXTERNALSQLNAME = "CNBED", EXTERNALSQLTYPE = 1, MAXLEN = 3) [ Required, SqlColumnNumber = 19, SqlFieldName = CNBED ];

Property CNCASE As %Numeric(EXTERNALSQLNAME = "CNCASE", EXTERNALSQLTYPE = 2, MAXVAL = 9999999999, MINVAL = -9999999999, SCALE = 0) [ Required, SqlColumnNumber = 2, SqlFieldName = CNCASE ];

Property CNCESA As %String(EXTERNALSQLNAME = "CNCESA", EXTERNALSQLTYPE = 1, MAXLEN = 1) [ Required, SqlColumnNumber = 13, SqlFieldName = CNCESA ];

Property CNDVRY As %String(EXTERNALSQLNAME = "CNDVRY", EXTERNALSQLTYPE = 1, MAXLEN = 1) [ Required, SqlColumnNumber = 8, SqlFieldName = CNDVRY ];

Property CNFANM As %String(EXTERNALSQLNAME = "CNFANM", EXTERNALSQLTYPE = 1, MAXLEN = 38) [ Required, SqlColumnNumber = 5, SqlFieldName = CNFANM ];

Property CNHEIG As %Numeric(EXTERNALSQLNAME = "CNHEIG", EXTERNALSQLTYPE = 2, MAXVAL = 99999, MINVAL = -99999, SCALE = 0) [ Required, SqlColumnNumber = 11, SqlFieldName = CNHEIG ];

Property CNLOPR As %Numeric(EXTERNALSQLNAME = "CNLOPR", EXTERNALSQLTYPE = 2, MAXVAL = 99, MINVAL = -99, SCALE = 0) [ Required, SqlColumnNumber = 6, SqlFieldName = CNLOPR ];

Property CNLPRD As %Numeric(EXTERNALSQLNAME = "CNLPRD", EXTERNALSQLTYPE = 2, MAXVAL = 9, MINVAL = -9, SCALE = 0) [ Required, SqlColumnNumber = 7, SqlFieldName = CNLPRD ];

Property CNNSID As %String(EXTERNALSQLNAME = "CNNSID", EXTERNALSQLTYPE = 1, MAXLEN = 4) [ Required, SqlColumnNumber = 17, SqlFieldName = CNNSID ];

Property CNORD As %Numeric(EXTERNALSQLNAME = "CNORD", EXTERNALSQLTYPE = 2, MAXVAL = 9, MINVAL = -9, SCALE = 0) [ Required, SqlColumnNumber = 20, SqlFieldName = CNORD ];

Property CNPCAS As %Numeric(EXTERNALSQLNAME = "CNPCAS", EXTERNALSQLTYPE = 2, MAXVAL = 9999999999, MINVAL = -9999999999, SCALE = 0) [ Required, SqlColumnNumber = 4, SqlFieldName = CNPCAS ];

Property CNPMRN As %Numeric(EXTERNALSQLNAME = "CNPMRN", EXTERNALSQLTYPE = 2, MAXVAL = 9999999999, MINVAL = -9999999999, SCALE = 0) [ Required, SqlColumnNumber = 3, SqlFieldName = CNPMRN ];

Property CNPRCR As %Numeric(EXTERNALSQLNAME = "CNPRCR", EXTERNALSQLTYPE = 2, MAXVAL = 99.99, MINVAL = -99.99, SCALE = 2) [ Required, SqlColumnNumber = 12, SqlFieldName = CNPRCR ];

Property CNROOM As %String(EXTERNALSQLNAME = "CNROOM", EXTERNALSQLTYPE = 1, MAXLEN = 4) [ Required, SqlColumnNumber = 18, SqlFieldName = CNROOM ];

Property CNTYPR As %String(EXTERNALSQLNAME = "CNTYPR", EXTERNALSQLTYPE = 1, MAXLEN = 1) [ Required, SqlColumnNumber = 21, SqlFieldName = CNTYPR ];

Property CNWEIG As %Numeric(EXTERNALSQLNAME = "CNWEIG", EXTERNALSQLTYPE = 2, MAXVAL = 99999, MINVAL = -99999, SCALE = 0) [ Required, SqlColumnNumber = 10, SqlFieldName = CNWEIG ];

Index MainIndex On CNCASE [ IdKey, PrimaryKey ];

Parameter CONNECTION = "WISHBRU,NOCREATE";

Parameter EXTDBNAME = "DB2/400 SQL";

Parameter EXTERNALTABLENAME = "MEDBRGF.CNEWBN";

Storage GSQLStorage
{
<ExtentSize>100000</ExtentSize>
<StreamLocation>^CHUBXL.DB.WISH.MERBEBES</StreamLocation>
<Type>%CacheSQLStorage</Type>
}

}
