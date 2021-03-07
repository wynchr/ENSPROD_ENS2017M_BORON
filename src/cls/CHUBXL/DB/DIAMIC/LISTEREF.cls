Class CHUBXL.DB.DIAMIC.LISTEREF Extends %Library.Persistent [ ClassType = persistent, Not ProcedureBlock, SqlRowIdPrivate, SqlTableName = LISTEREF, StorageStrategy = GSQLStorage ]
{

Property ABRLISTEREF As %String(EXTERNALSQLNAME = "ABRLISTEREF", EXTERNALSQLTYPE = 12, MAXLEN = 15) [ Required, SqlColumnNumber = 4, SqlFieldName = ABRLISTEREF ];

Property CODLISTEREF As %String(EXTERNALSQLNAME = "CODLISTEREF", EXTERNALSQLTYPE = 12, MAXLEN = 8) [ Required, SqlColumnNumber = 3, SqlFieldName = CODLISTEREF ];

Property CODRATTACHEMENT As %String(EXTERNALSQLNAME = "CODRATTACHEMENT", EXTERNALSQLTYPE = 12, MAXLEN = 8) [ SqlColumnNumber = 10, SqlFieldName = CODRATTACHEMENT ];

Property DATCREAT As %TimeStamp(EXTERNALSQLNAME = "DATCREAT", EXTERNALSQLTYPE = 93) [ Required, SqlColumnNumber = 8, SqlFieldName = DATCREAT ];

Property DATDEBVALIDITE As %TimeStamp(EXTERNALSQLNAME = "DATDEBVALIDITE", EXTERNALSQLTYPE = 93) [ Required, SqlColumnNumber = 6, SqlFieldName = DATDEBVALIDITE ];

Property DATFINVALIDITE As %TimeStamp(EXTERNALSQLNAME = "DATFINVALIDITE", EXTERNALSQLTYPE = 93) [ Required, SqlColumnNumber = 7, SqlFieldName = DATFINVALIDITE ];

Property DATMAJ As %TimeStamp(EXTERNALSQLNAME = "DATMAJ", EXTERNALSQLTYPE = 93) [ Required, SqlColumnNumber = 9, SqlFieldName = DATMAJ ];

Property NOMLISTEREF As %String(EXTERNALSQLNAME = "NOMLISTEREF", EXTERNALSQLTYPE = 12, MAXLEN = 32) [ Required, SqlColumnNumber = 5, SqlFieldName = NOMLISTEREF ];

Property NUEXPLOITRESP As %Numeric(EXTERNALSQLNAME = "NUEXPLOITRESP", EXTERNALSQLTYPE = 3, MAXVAL = 99999, MINVAL = -99999, SCALE = 0) [ SqlColumnNumber = 12, SqlFieldName = NUEXPLOITRESP ];

Property NULISTEREF As %Numeric(EXTERNALSQLNAME = "NULISTEREF", EXTERNALSQLTYPE = 3, MAXVAL = 9999999999, MINVAL = -9999999999, SCALE = 0) [ Required, SqlColumnNumber = 11, SqlFieldName = NULISTEREF ];

Property TYPLISTE As %String(EXTERNALSQLNAME = "TYPLISTE", EXTERNALSQLTYPE = 12, MAXLEN = 3) [ Required, SqlColumnNumber = 2, SqlFieldName = TYPLISTE ];

Index MainIndex On TYPLISTE [ IdKey, PrimaryKey ];

Parameter CONNECTION = "Diamic,NOCREATE";

Parameter EXTDBNAME = "Oracle";

Parameter EXTERNALTABLENAME = "DIAMIC.LISTEREF";

Storage GSQLStorage
{
<ExtentSize>100000</ExtentSize>
<StreamLocation>^CHUBXL.DB.DIAMIC.LISTEREFS</StreamLocation>
<Type>%CacheSQLStorage</Type>
}

}
