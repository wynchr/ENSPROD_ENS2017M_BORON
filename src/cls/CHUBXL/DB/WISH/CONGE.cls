Class CHUBXL.DB.WISH.CONGE Extends %Library.Persistent [ ClassType = persistent, Not ProcedureBlock, SqlRowIdPrivate, SqlTableName = CONGE, StorageStrategy = GSQLStorage ]
{

Property JCCASE As %Numeric(EXTERNALSQLNAME = "JCCASE", EXTERNALSQLTYPE = 2, MAXVAL = 9999999999, MINVAL = -9999999999, SCALE = 0) [ Required, SqlColumnNumber = 3, SqlFieldName = JCCASE ];

Property JCFROM As %Numeric(EXTERNALSQLNAME = "JCFROM", EXTERNALSQLTYPE = 2, MAXVAL = 999999999999, MINVAL = -999999999999, SCALE = 0) [ Required, SqlColumnNumber = 4, SqlFieldName = JCFROM ];

Property JCGFFM As %Numeric(EXTERNALSQLNAME = "JCGFFM", EXTERNALSQLTYPE = 2, MAXVAL = 9, MINVAL = -9, SCALE = 0) [ Required, SqlColumnNumber = 11, SqlFieldName = JCGFFM ];

Property JCSPCA As %String(EXTERNALSQLNAME = "JCSPCA", EXTERNALSQLTYPE = 1, MAXLEN = 5) [ Required, SqlColumnNumber = 6, SqlFieldName = JCSPCA ];

Property JCTO As %Numeric(EXTERNALSQLNAME = "JCTO", EXTERNALSQLTYPE = 2, MAXVAL = 999999999999, MINVAL = -999999999999, SCALE = 0) [ Required, SqlColumnNumber = 5, SqlFieldName = JCTO ];

Property JRCO As %Numeric(EXTERNALSQLNAME = "JRCO", EXTERNALSQLTYPE = 3, MAXVAL = 99, MINVAL = -99, SCALE = 0) [ Required, SqlColumnNumber = 10, SqlFieldName = JRCO ];

Property LIEU As %String(EXTERNALSQLNAME = "LIEU", EXTERNALSQLTYPE = 1, MAXLEN = 15) [ Required, SqlColumnNumber = 7, SqlFieldName = LIEU ];

Property NADM As %Numeric(EXTERNALSQLNAME = "NADM", EXTERNALSQLTYPE = 2, MAXVAL = 9999999999, MINVAL = -9999999999, SCALE = 0) [ Required, SqlColumnNumber = 2, SqlFieldName = NADM ];

Property NBJR As %Numeric(EXTERNALSQLNAME = "NBJR", EXTERNALSQLTYPE = 3, MAXVAL = 99, MINVAL = -99, SCALE = 0) [ Required, SqlColumnNumber = 9, SqlFieldName = NBJR ];

Property TABS As %Numeric(EXTERNALSQLNAME = "TABS", EXTERNALSQLTYPE = 3, MAXVAL = 9, MINVAL = -9, SCALE = 0) [ Required, SqlColumnNumber = 8, SqlFieldName = TABS ];

Index MainIndex On JCCASE [ IdKey, PrimaryKey ];

Parameter CONNECTION = "WISHBRU,NOCREATE";

Parameter EXTDBNAME = "DB2/400 SQL";

Parameter EXTERNALTABLENAME = "MEDBRGF.MVTJC";

Storage GSQLStorage
{
<ExtentSize>100000</ExtentSize>
<StreamLocation>^CHUBXL.DB.WISH.CONGES</StreamLocation>
<Type>%CacheSQLStorage</Type>
}

}
