Class CHUBXL.DB.DIAMIC.EXAMENCODIFTNM Extends %Library.Persistent [ ClassType = persistent, Not ProcedureBlock, SqlRowIdPrivate, SqlTableName = EXAMENCODIFTNM, StorageStrategy = GSQLStorage ]
{

Property CODAXEM As %String(EXTERNALSQLNAME = "CODAXEM", EXTERNALSQLTYPE = 12, MAXLEN = 12) [ SqlColumnNumber = 8, SqlFieldName = CODAXEM ];

Property CODAXEN As %String(EXTERNALSQLNAME = "CODAXEN", EXTERNALSQLTYPE = 12, MAXLEN = 12) [ SqlColumnNumber = 7, SqlFieldName = CODAXEN ];

Property CODAXET As %String(EXTERNALSQLNAME = "CODAXET", EXTERNALSQLTYPE = 12, MAXLEN = 12) [ SqlColumnNumber = 6, SqlFieldName = CODAXET ];

Property CODCOMPLET As %String(EXTERNALSQLNAME = "CODCOMPLET", EXTERNALSQLTYPE = 12, MAXLEN = 32) [ SqlColumnNumber = 9, SqlFieldName = CODCOMPLET ];

Property CODVERSIONTNM As %String(EXTERNALSQLNAME = "CODVERSIONTNM", EXTERNALSQLTYPE = 12, MAXLEN = 8) [ SqlColumnNumber = 10, SqlFieldName = CODVERSIONTNM ];

Property DATCODAGE As %TimeStamp(EXTERNALSQLNAME = "DATCODAGE", EXTERNALSQLTYPE = 93) [ SqlColumnNumber = 11, SqlFieldName = DATCODAGE ];

Property NUCODIFTNM As %Numeric(EXTERNALSQLNAME = "NUCODIFTNM", EXTERNALSQLTYPE = 3, MAXVAL = 9999999999, MINVAL = -9999999999, SCALE = 0) [ Required, SqlColumnNumber = 2, SqlFieldName = NUCODIFTNM ];

Property NUDDE As %Numeric(EXTERNALSQLNAME = "NUDDE", EXTERNALSQLTYPE = 3, MAXVAL = 9999999999, MINVAL = -9999999999, SCALE = 0) [ Required, SqlColumnNumber = 4, SqlFieldName = NUDDE ];

Property NUEXAM As %Numeric(EXTERNALSQLNAME = "NUEXAM", EXTERNALSQLTYPE = 3, MAXVAL = 9999999999, MINVAL = -9999999999, SCALE = 0) [ Required, SqlColumnNumber = 3, SqlFieldName = NUEXAM ];

Property NUPAT As %Numeric(EXTERNALSQLNAME = "NUPAT", EXTERNALSQLTYPE = 3, MAXVAL = 9999999999, MINVAL = -9999999999, SCALE = 0) [ Required, SqlColumnNumber = 5, SqlFieldName = NUPAT ];

Index MainIndex On (NUCODIFTNM, NUDDE) [ IdKey, PrimaryKey ];

Parameter CONNECTION = "Diamic,NOCREATE";

Parameter EXTDBNAME = "Oracle";

Parameter EXTERNALTABLENAME = "DIAMIC.EXAMENCODIFTNM";

Storage GSQLStorage
{
<ExtentSize>100000</ExtentSize>
<StreamLocation>^CHUBXL.DB.DIAMIC.EXAMENCODIFTNMS</StreamLocation>
<Type>%CacheSQLStorage</Type>
}

}
