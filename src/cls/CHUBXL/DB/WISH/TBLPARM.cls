Class CHUBXL.DB.WISH.TBLPARM Extends %Library.Persistent [ ClassType = persistent, Not ProcedureBlock, SqlRowIdPrivate, SqlTableName = TBLPARM, StorageStrategy = GSQLStorage ]
{

Property DTCODE As %String(EXTERNALSQLNAME = "DTCODE", EXTERNALSQLTYPE = 1, MAXLEN = 10) [ Required, SqlColumnNumber = 3, SqlFieldName = DTCODE ];

Property DTDESC As %String(EXTERNALSQLNAME = "DTDESC", EXTERNALSQLTYPE = 1, MAXLEN = 32) [ Required, SqlColumnNumber = 5, SqlFieldName = DTDESC ];

Property DTDESN As %String(EXTERNALSQLNAME = "DTDESN", EXTERNALSQLTYPE = 1, MAXLEN = 32) [ Required, SqlColumnNumber = 6, SqlFieldName = DTDESN ];

Property DTNAME As %String(EXTERNALSQLNAME = "DTNAME", EXTERNALSQLTYPE = 1, MAXLEN = 6) [ Required, SqlColumnNumber = 2, SqlFieldName = DTNAME ];

Property DTNTCD As %String(EXTERNALSQLNAME = "DTNTCD", EXTERNALSQLTYPE = 1, MAXLEN = 10) [ Required, SqlColumnNumber = 4, SqlFieldName = DTNTCD ];

Index MainIndex On DTCODE [ IdKey, PrimaryKey ];

Parameter CONNECTION = "WISHBRU,NOCREATE";

Parameter EXTDBNAME = "DB2/400 SQL";

Parameter EXTERNALTABLENAME = "MEDBRGFB.DTLTBL";

Storage GSQLStorage
{
<ExtentSize>100000</ExtentSize>
<StreamLocation>^CHUBXL.DB.WISH.TBLPARMS</StreamLocation>
<Type>%CacheSQLStorage</Type>
}

}
