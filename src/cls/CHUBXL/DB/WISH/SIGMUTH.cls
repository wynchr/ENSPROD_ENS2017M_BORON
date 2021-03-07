Class CHUBXL.DB.WISH.SIGMUTH Extends %Library.Persistent [ ClassType = persistent, Not ProcedureBlock, SqlRowIdPrivate, SqlTableName = SIGMUTH, StorageStrategy = GSQLStorage ]
{

Property ADRMU As %String(EXTERNALSQLNAME = "ADRMU", EXTERNALSQLTYPE = 1, MAXLEN = 30) [ Required, SqlColumnNumber = 5, SqlFieldName = ADRMU ];

Property ASSCOM As %Numeric(EXTERNALSQLNAME = "ASSCOM", EXTERNALSQLTYPE = 2, MAXVAL = 9, MINVAL = -9, SCALE = 0) [ Required, SqlColumnNumber = 20, SqlFieldName = ASSCOM ];

Property CPOMU As %String(EXTERNALSQLNAME = "CPOMU", EXTERNALSQLTYPE = 1, MAXLEN = 6) [ Required, SqlColumnNumber = 6, SqlFieldName = CPOMU ];

Property LANMU As %String(EXTERNALSQLNAME = "LANMU", EXTERNALSQLTYPE = 1, MAXLEN = 1) [ Required, SqlColumnNumber = 9, SqlFieldName = LANMU ];

Property LOCMU As %String(EXTERNALSQLNAME = "LOCMU", EXTERNALSQLTYPE = 1, MAXLEN = 30) [ Required, SqlColumnNumber = 7, SqlFieldName = LOCMU ];

Property MAILMU As %String(EXTERNALSQLNAME = "MAILMU", EXTERNALSQLTYPE = 1, MAXLEN = 50) [ Required, SqlColumnNumber = 22, SqlFieldName = MAILMU ];

Property MFFMED As %String(EXTERNALSQLNAME = "MFFMED", EXTERNALSQLTYPE = 1, MAXLEN = 1) [ Required, SqlColumnNumber = 21, SqlFieldName = MFFMED ];

Property MUDEB As %Numeric(EXTERNALSQLNAME = "MUDEB", EXTERNALSQLTYPE = 3, MAXVAL = 99999999, MINVAL = -99999999, SCALE = 0) [ Required, SqlColumnNumber = 16, SqlFieldName = MUDEB ];

Property MUFIN As %Numeric(EXTERNALSQLNAME = "MUFIN", EXTERNALSQLTYPE = 3, MAXVAL = 99999999, MINVAL = -99999999, SCALE = 0) [ Required, SqlColumnNumber = 17, SqlFieldName = MUFIN ];

Property MURCP As %String(EXTERNALSQLNAME = "MURCP", EXTERNALSQLTYPE = 1, MAXLEN = 1) [ Required, SqlColumnNumber = 18, SqlFieldName = MURCP ];

Property MURES1 As %String(EXTERNALSQLNAME = "MURES1", EXTERNALSQLTYPE = 1, MAXLEN = 1) [ Required, SqlColumnNumber = 24, SqlFieldName = MURES1 ];

Property MURES2 As %String(EXTERNALSQLNAME = "MURES2", EXTERNALSQLTYPE = 1, MAXLEN = 2) [ Required, SqlColumnNumber = 25, SqlFieldName = MURES2 ];

Property MURES3 As %String(EXTERNALSQLNAME = "MURES3", EXTERNALSQLTYPE = 1, MAXLEN = 6) [ Required, SqlColumnNumber = 26, SqlFieldName = MURES3 ];

Property MURES4 As %String(EXTERNALSQLNAME = "MURES4", EXTERNALSQLTYPE = 1, MAXLEN = 8) [ Required, SqlColumnNumber = 27, SqlFieldName = MURES4 ];

Property MURES5 As %String(EXTERNALSQLNAME = "MURES5", EXTERNALSQLTYPE = 1, MAXLEN = 25) [ Required, SqlColumnNumber = 28, SqlFieldName = MURES5 ];

Property MURES6 As %Numeric(EXTERNALSQLNAME = "MURES6", EXTERNALSQLTYPE = 2, MAXVAL = 9, MINVAL = -9, SCALE = 0) [ Required, SqlColumnNumber = 29, SqlFieldName = MURES6 ];

Property MURES7 As %Numeric(EXTERNALSQLNAME = "MURES7", EXTERNALSQLTYPE = 2, MAXVAL = 999, MINVAL = -999, SCALE = 0) [ Required, SqlColumnNumber = 30, SqlFieldName = MURES7 ];

Property MURES8 As %Numeric(EXTERNALSQLNAME = "MURES8", EXTERNALSQLTYPE = 2, MAXVAL = 99999999, MINVAL = -99999999, SCALE = 0) [ Required, SqlColumnNumber = 31, SqlFieldName = MURES8 ];

Property MURES9 As %Numeric(EXTERNALSQLNAME = "MURES9", EXTERNALSQLTYPE = 2, MAXVAL = 9999999999, MINVAL = -9999999999, SCALE = 0) [ Required, SqlColumnNumber = 32, SqlFieldName = MURES9 ];

Property MUTDST As %Numeric(EXTERNALSQLNAME = "MUTDST", EXTERNALSQLTYPE = 2, MAXVAL = 999, MINVAL = -999, SCALE = 0) [ Required, SqlColumnNumber = 23, SqlFieldName = MUTDST ];

Property MUTMU As %Numeric(EXTERNALSQLNAME = "MUTMU", EXTERNALSQLTYPE = 3, MAXVAL = 999, MINVAL = -999, SCALE = 0) [ Required, SqlColumnNumber = 2, SqlFieldName = MUTMU ];

Property NOMMU As %String(EXTERNALSQLNAME = "NOMMU", EXTERNALSQLTYPE = 1, MAXLEN = 30) [ Required, SqlColumnNumber = 3, SqlFieldName = NOMMU ];

Property NOMMUN As %String(EXTERNALSQLNAME = "NOMMUN", EXTERNALSQLTYPE = 1, MAXLEN = 30) [ Required, SqlColumnNumber = 4, SqlFieldName = NOMMUN ];

Property STAMU As %Numeric(EXTERNALSQLNAME = "STAMU", EXTERNALSQLTYPE = 3, MAXVAL = 99, MINVAL = -99, SCALE = 0) [ Required, SqlColumnNumber = 11, SqlFieldName = STAMU ];

Property TELMU As %String(EXTERNALSQLNAME = "TELMU", EXTERNALSQLTYPE = 1, MAXLEN = 12) [ Required, SqlColumnNumber = 8, SqlFieldName = TELMU ];

Property TFVAL As %String(EXTERNALSQLNAME = "TFVAL", EXTERNALSQLTYPE = 1, MAXLEN = 1) [ Required, SqlColumnNumber = 19, SqlFieldName = TFVAL ];

Property TYPMU As %Numeric(EXTERNALSQLNAME = "TYPMU", EXTERNALSQLTYPE = 3, MAXVAL = 9, MINVAL = -9, SCALE = 0) [ Required, SqlColumnNumber = 10, SqlFieldName = TYPMU ];

Property UZL1 As %String(EXTERNALSQLNAME = "UZL1", EXTERNALSQLTYPE = 1, MAXLEN = 1) [ Required, SqlColumnNumber = 12, SqlFieldName = UZL1 ];

Property UZL2 As %String(EXTERNALSQLNAME = "UZL2", EXTERNALSQLTYPE = 1, MAXLEN = 1) [ Required, SqlColumnNumber = 13, SqlFieldName = UZL2 ];

Property UZL3 As %String(EXTERNALSQLNAME = "UZL3", EXTERNALSQLTYPE = 1, MAXLEN = 1) [ Required, SqlColumnNumber = 14, SqlFieldName = UZL3 ];

Property UZL4 As %String(EXTERNALSQLNAME = "UZL4", EXTERNALSQLTYPE = 1, MAXLEN = 10) [ Required, SqlColumnNumber = 15, SqlFieldName = UZL4 ];

Index MainIndex On MUTMU [ IdKey, PrimaryKey ];

Parameter CONNECTION = "WISHHUD,NOCREATE";

Parameter EXTDBNAME = "DB2/400 SQL";

Parameter EXTERNALTABLENAME = "MEDHUDFB.SMUTU";

Storage GSQLStorage
{
<ExtentSize>100000</ExtentSize>
<StreamLocation>^CHUBXL.DB.WISH.SIGMUTHS</StreamLocation>
<Type>%CacheSQLStorage</Type>
}

}
