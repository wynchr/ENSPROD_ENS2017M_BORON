Class CHUBXL.DB.WISH.PERSOT Extends %Library.Persistent [ ClassType = persistent, Not ProcedureBlock, SqlRowIdPrivate, SqlTableName = PERSOT, StorageStrategy = GSQLStorage ]
{

Property CENMHU As %String(EXTERNALSQLNAME = "CENMHU", EXTERNALSQLTYPE = 1, MAXLEN = 1) [ Required, SqlColumnNumber = 15, SqlFieldName = CENMHU ];

Property DEPTHU As %String(EXTERNALSQLNAME = "DEPTHU", EXTERNALSQLTYPE = 1, MAXLEN = 4) [ Required, SqlColumnNumber = 12, SqlFieldName = DEPTHU ];

Property DVAL As %Numeric(EXTERNALSQLNAME = "DVAL", EXTERNALSQLTYPE = 3, MAXVAL = 99999999, MINVAL = -99999999, SCALE = 0) [ Required, SqlColumnNumber = 17, SqlFieldName = DVAL ];

Property HUCAT As %String(EXTERNALSQLNAME = "HUCAT", EXTERNALSQLTYPE = 1, MAXLEN = 4) [ Required, SqlColumnNumber = 10, SqlFieldName = HUCAT ];

Property HUCENM As %String(EXTERNALSQLNAME = "HUCENM", EXTERNALSQLTYPE = 1, MAXLEN = 1) [ Required, SqlColumnNumber = 11, SqlFieldName = HUCENM ];

Property HUDEPT As %String(EXTERNALSQLNAME = "HUDEPT", EXTERNALSQLTYPE = 1, MAXLEN = 4) [ Required, SqlColumnNumber = 4, SqlFieldName = HUDEPT ];

Property HUEMID As %Numeric(EXTERNALSQLNAME = "HUEMID", EXTERNALSQLTYPE = 2, MAXVAL = 99999999, MINVAL = -99999999, SCALE = 0) [ Required, SqlColumnNumber = 7, SqlFieldName = HUEMID ];

Property HUETIG As %Numeric(EXTERNALSQLNAME = "HUETIG", EXTERNALSQLTYPE = 2, MAXVAL = 99, MINVAL = -99, SCALE = 0) [ Required, SqlColumnNumber = 19, SqlFieldName = HUETIG ];

Property HUETIP As %Numeric(EXTERNALSQLNAME = "HUETIP", EXTERNALSQLTYPE = 2, MAXVAL = 99, MINVAL = -99, SCALE = 0) [ Required, SqlColumnNumber = 18, SqlFieldName = HUETIP ];

Property HUID As %String(EXTERNALSQLNAME = "HUID", EXTERNALSQLTYPE = 1, MAXLEN = 10) [ Required, SqlColumnNumber = 2, SqlFieldName = HUID ];

Property HUIPDG As %String(EXTERNALSQLNAME = "HUIPDG", EXTERNALSQLTYPE = 1, MAXLEN = 1) [ Required, SqlColumnNumber = 21, SqlFieldName = HUIPDG ];

Property HUNAME As %String(EXTERNALSQLNAME = "HUNAME", EXTERNALSQLTYPE = 1, MAXLEN = 38) [ Required, SqlColumnNumber = 3, SqlFieldName = HUNAME ];

Property HUPATT As %String(EXTERNALSQLNAME = "HUPATT", EXTERNALSQLTYPE = 1, MAXLEN = 1) [ Required, SqlColumnNumber = 9, SqlFieldName = HUPATT ];

Property HUPROG As %String(EXTERNALSQLNAME = "HUPROG", EXTERNALSQLTYPE = 1, MAXLEN = 8) [ Required, SqlColumnNumber = 8, SqlFieldName = HUPROG ];

Property HUSECU As %Numeric(EXTERNALSQLNAME = "HUSECU", EXTERNALSQLTYPE = 2, MAXVAL = 99, MINVAL = -99, SCALE = 0) [ Required, SqlColumnNumber = 6, SqlFieldName = HUSECU ];

Property HUSITE As %String(EXTERNALSQLNAME = "HUSITE", EXTERNALSQLTYPE = 1, MAXLEN = 4) [ Required, SqlColumnNumber = 16, SqlFieldName = HUSITE ];

Property HUTITL As %String(EXTERNALSQLNAME = "HUTITL", EXTERNALSQLTYPE = 1, MAXLEN = 3) [ Required, SqlColumnNumber = 5, SqlFieldName = HUTITL ];

Property HUUSER As %String(EXTERNALSQLNAME = "HUUSER", EXTERNALSQLTYPE = 1, MAXLEN = 10) [ Required, SqlColumnNumber = 20, SqlFieldName = HUUSER ];

Property PATTHU As %String(EXTERNALSQLNAME = "PATTHU", EXTERNALSQLTYPE = 1, MAXLEN = 1) [ Required, SqlColumnNumber = 14, SqlFieldName = PATTHU ];

Property TITLHU As %String(EXTERNALSQLNAME = "TITLHU", EXTERNALSQLTYPE = 1, MAXLEN = 3) [ Required, SqlColumnNumber = 13, SqlFieldName = TITLHU ];

Index MainIndex On HUID [ IdKey, PrimaryKey ];

Parameter CONNECTION = "WISHTEST,NOCREATE";

Parameter EXTDBNAME = "DB2/400 SQL";

Parameter EXTERNALTABLENAME = "MEDCPOFBT.HUPROF";

Storage GSQLStorage
{
<ExtentSize>100000</ExtentSize>
<StreamLocation>^CHUBXL.DB.WISH.PERSOTS</StreamLocation>
<Type>%CacheSQLStorage</Type>
}

}
