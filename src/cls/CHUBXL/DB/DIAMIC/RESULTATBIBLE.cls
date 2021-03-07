Class CHUBXL.DB.DIAMIC.RESULTATBIBLE Extends %Library.Persistent [ ClassType = persistent, Not ProcedureBlock, SqlRowIdPrivate, SqlTableName = RESULTATBIBLE, StorageStrategy = GSQLStorage ]
{

Property CODBIBLE As %String(EXTERNALSQLNAME = "CODBIBLE", EXTERNALSQLTYPE = 12, MAXLEN = 32) [ Required, SqlColumnNumber = 5, SqlFieldName = CODBIBLE ];

Property CODVAR As %String(EXTERNALSQLNAME = "CODVAR", EXTERNALSQLTYPE = 12, MAXLEN = 32) [ SqlColumnNumber = 6, SqlFieldName = CODVAR ];

Property NUDDE As %Numeric(EXTERNALSQLNAME = "NUDDE", EXTERNALSQLTYPE = 3, MAXVAL = 9999999999, MINVAL = -9999999999, SCALE = 0) [ Required, SqlColumnNumber = 4, SqlFieldName = NUDDE ];

Property NURES As %Numeric(EXTERNALSQLNAME = "NURES", EXTERNALSQLTYPE = 3, MAXVAL = 9999999999, MINVAL = -9999999999, SCALE = 0) [ Required, SqlColumnNumber = 3, SqlFieldName = NURES ];

Property NURESULTATBIBLE As %Numeric(EXTERNALSQLNAME = "NURESULTATBIBLE", EXTERNALSQLTYPE = 3, MAXVAL = 9999999999, MINVAL = -9999999999, SCALE = 0) [ Required, SqlColumnNumber = 2, SqlFieldName = NURESULTATBIBLE ];

Property VALVAR As %String(EXTERNALSQLNAME = "VALVAR", EXTERNALSQLTYPE = 12, MAXLEN = 32) [ SqlColumnNumber = 7, SqlFieldName = VALVAR ];

Index MainIndex On (NURES, NUDDE) [ IdKey, PrimaryKey ];

Parameter CONNECTION = "Diamic,NOCREATE";

Parameter EXTDBNAME = "Oracle";

Parameter EXTERNALTABLENAME = "DIAMIC.RESULTATBIBLE";

Storage GSQLStorage
{
<ExtentSize>100000</ExtentSize>
<StreamLocation>^CHUBXL.DB.DIAMIC.RESULTATBIBLES</StreamLocation>
<Type>%CacheSQLStorage</Type>
}

}
