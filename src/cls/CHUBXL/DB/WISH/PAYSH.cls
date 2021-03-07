Class CHUBXL.DB.WISH.PAYSH Extends %Library.Persistent [ ClassType = persistent, Not ProcedureBlock, SqlRowIdPrivate, SqlTableName = PAYSH, StorageStrategy = GSQLStorage ]
{

Property PACDI As %String(EXTERNALSQLNAME = "PACDI", EXTERNALSQLTYPE = 1, MAXLEN = 3) [ Required, SqlColumnNumber = 5, SqlFieldName = PACDI ];

Property PACNAT As %String(EXTERNALSQLNAME = "PACNAT", EXTERNALSQLTYPE = 1, MAXLEN = 3) [ Required, SqlColumnNumber = 9, SqlFieldName = PACNAT ];

Property PAINS As %String(EXTERNALSQLNAME = "PAINS", EXTERNALSQLTYPE = 1, MAXLEN = 3) [ Required, SqlColumnNumber = 7, SqlFieldName = PAINS ];

Property PAISO As %String(EXTERNALSQLNAME = "PAISO", EXTERNALSQLTYPE = 1, MAXLEN = 3) [ Required, SqlColumnNumber = 6, SqlFieldName = PAISO ];

Property PAISO3 As %String(EXTERNALSQLNAME = "PAISO3", EXTERNALSQLTYPE = 1, MAXLEN = 3) [ Required, SqlColumnNumber = 8, SqlFieldName = PAISO3 ];

Property PALIB As %String(EXTERNALSQLNAME = "PALIB", EXTERNALSQLTYPE = 1, MAXLEN = 25) [ Required, SqlColumnNumber = 3, SqlFieldName = PALIB ];

Property PANAT As %String(EXTERNALSQLNAME = "PANAT", EXTERNALSQLTYPE = 1, MAXLEN = 25) [ Required, SqlColumnNumber = 4, SqlFieldName = PANAT ];

Property PAPAY As %String(EXTERNALSQLNAME = "PAPAY", EXTERNALSQLTYPE = 1, MAXLEN = 3) [ Required, SqlColumnNumber = 2, SqlFieldName = PAPAY ];

Property PARES1 As %String(EXTERNALSQLNAME = "PARES1", EXTERNALSQLTYPE = 1, MAXLEN = 1) [ Required, SqlColumnNumber = 10, SqlFieldName = PARES1 ];

Property PARES2 As %String(EXTERNALSQLNAME = "PARES2", EXTERNALSQLTYPE = 1, MAXLEN = 2) [ Required, SqlColumnNumber = 11, SqlFieldName = PARES2 ];

Property PARES3 As %String(EXTERNALSQLNAME = "PARES3", EXTERNALSQLTYPE = 1, MAXLEN = 3) [ Required, SqlColumnNumber = 12, SqlFieldName = PARES3 ];

Property PARES4 As %String(EXTERNALSQLNAME = "PARES4", EXTERNALSQLTYPE = 1, MAXLEN = 12) [ Required, SqlColumnNumber = 13, SqlFieldName = PARES4 ];

Index MainIndex On PAPAY [ IdKey, PrimaryKey ];

Parameter CONNECTION = "WISHHUD,NOCREATE";

Parameter EXTDBNAME = "DB2/400 SQL";

Parameter EXTERNALTABLENAME = "MEDHUDFB.SPAYS";

Storage GSQLStorage
{
<ExtentSize>100000</ExtentSize>
<StreamLocation>^CHUBXL.DB.WISH.PAYSHS</StreamLocation>
<Type>%CacheSQLStorage</Type>
}

}
