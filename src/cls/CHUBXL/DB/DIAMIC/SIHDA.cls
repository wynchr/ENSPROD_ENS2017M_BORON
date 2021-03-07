Class CHUBXL.DB.DIAMIC.SIHDA Extends %Library.Persistent [ ClassType = persistent, Not ProcedureBlock, SqlRowIdPrivate, SqlTableName = SIHDA, StorageStrategy = GSQLStorage ]
{

Property DATENTREE As %TimeStamp(EXTERNALSQLNAME = "DATENTREE") [ ReadOnly, SqlColumnNumber = 6, SqlFieldName = DATENTREE ];

Property DATSORTIE As %TimeStamp(EXTERNALSQLNAME = "DATSORTIE") [ ReadOnly, SqlColumnNumber = 7, SqlFieldName = DATSORTIE ];

Property MODADMISSION As %String(EXTERNALSQLNAME = "MODADMISSION", MAXLEN = 8) [ ReadOnly, SqlColumnNumber = 9, SqlFieldName = MODADMISSION ];

Property NDA As %String(EXTERNALSQLNAME = "NDA", MAXLEN = 17) [ ReadOnly, Required, SqlColumnNumber = 2, SqlFieldName = NDA ];

Property NIP As %String(EXTERNALSQLNAME = "NIP", MAXLEN = 15) [ ReadOnly, SqlColumnNumber = 3, SqlFieldName = NIP ];

Property NUPATSIH As %Numeric(EXTERNALSQLNAME = "NUPATSIH", MAXVAL = 9999999999, MINVAL = -9999999999, SCALE = 0) [ ReadOnly, Required, SqlColumnNumber = 4, SqlFieldName = NUPATSIH ];

Property NUSIH As %Numeric(EXTERNALSQLNAME = "NUSIH", MAXVAL = 999, MINVAL = -999, SCALE = 0) [ ReadOnly, SqlColumnNumber = 8, SqlFieldName = NUSIH ];

Property UF As %String(EXTERNALSQLNAME = "UF", MAXLEN = 15) [ ReadOnly, SqlColumnNumber = 5, SqlFieldName = UF ];

Index MainIndex On NDA [ IdKey, PrimaryKey ];

Parameter CONNECTION = "DIAMIC,NOCREATE";

Parameter EXTERNALTABLENAME = "DIAMIC.SIHDA";

Storage GSQLStorage
{
<ExtentSize>100000</ExtentSize>
<StreamLocation>^CHUBXL.DB.DIAMIC.SIHDAS</StreamLocation>
<Type>%CacheSQLStorage</Type>
}

}
