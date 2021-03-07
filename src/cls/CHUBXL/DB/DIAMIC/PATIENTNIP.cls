Class CHUBXL.DB.DIAMIC.PATIENTNIP Extends %Library.Persistent [ ClassType = persistent, Not ProcedureBlock, SqlRowIdPrivate, SqlTableName = PATIENTNIP, StorageStrategy = GSQLStorage ]
{

Property NIP As %String(EXTERNALSQLNAME = "NIP", EXTERNALSQLTYPE = 12, MAXLEN = 15) [ SqlColumnNumber = 4, SqlFieldName = NIP ];

Property NUPAT As %Numeric(EXTERNALSQLNAME = "NUPAT", EXTERNALSQLTYPE = 3, MAXVAL = 9999999999, MINVAL = -9999999999, SCALE = 0) [ SqlColumnNumber = 2, SqlFieldName = NUPAT ];

Property NUSIH As %Numeric(EXTERNALSQLNAME = "NUSIH", EXTERNALSQLTYPE = 3, MAXVAL = 999, MINVAL = -999, SCALE = 0) [ SqlColumnNumber = 3, SqlFieldName = NUSIH ];

Index MainIndex On NUPAT [ IdKey, PrimaryKey ];

Parameter CONNECTION = "Diamic,NOCREATE";

Parameter EXTDBNAME = "Oracle";

Parameter EXTERNALTABLENAME = "DIAMIC.PATIENTNIP";

Storage GSQLStorage
{
<ExtentSize>100000</ExtentSize>
<StreamLocation>^CHUBXL.DB.DIAMIC.PATIENTNIPS</StreamLocation>
<Type>%CacheSQLStorage</Type>
}

}
