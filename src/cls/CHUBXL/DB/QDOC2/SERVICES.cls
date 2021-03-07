Class CHUBXL.DB.QDOC2.SERVICES Extends %Library.Persistent [ ClassType = persistent, Not ProcedureBlock, SqlRowIdPrivate, SqlTableName = SERVICES, StorageStrategy = GSQLStorage ]
{

Property SADMIN As %String(EXTERNALSQLNAME = "S_ADMIN", EXTERNALSQLTYPE = 12, MAXLEN = 1) [ SqlColumnNumber = 11, SqlFieldName = S_ADMIN ];

Property SCHANGEDATE As %TimeStamp(EXTERNALSQLNAME = "S_CHANGEDATE", EXTERNALSQLTYPE = 93) [ SqlColumnNumber = 8, SqlFieldName = S_CHANGEDATE ];

Property SCHANGEDBY As %String(EXTERNALSQLNAME = "S_CHANGEDBY", EXTERNALSQLTYPE = 12, MAXLEN = 40) [ SqlColumnNumber = 7, SqlFieldName = S_CHANGEDBY ];

Property SCODE As %String(EXTERNALSQLNAME = "S_CODE", EXTERNALSQLTYPE = 12, MAXLEN = 25) [ Required, SqlColumnNumber = 3, SqlFieldName = S_CODE ];

Property SDATEINVALID As %TimeStamp(EXTERNALSQLNAME = "S_DATEINVALID", EXTERNALSQLTYPE = 93) [ SqlColumnNumber = 6, SqlFieldName = S_DATEINVALID ];

Property SDEFAULTBED As %Numeric(EXTERNALSQLNAME = "S_DEFAULTBED", EXTERNALSQLTYPE = 3, MAXVAL = 9999999999, MINVAL = -9999999999, SCALE = 0) [ SqlColumnNumber = 23, SqlFieldName = S_DEFAULTBED ];

Property SDEFAULTCARRIER As %String(EXTERNALSQLNAME = "S_DEFAULTCARRIER", EXTERNALSQLTYPE = 12, MAXLEN = 1) [ SqlColumnNumber = 25, SqlFieldName = S_DEFAULTCARRIER ];

Property SDIENSTCODE As %String(EXTERNALSQLNAME = "S_DIENSTCODE", EXTERNALSQLTYPE = 12, MAXLEN = 2) [ SqlColumnNumber = 5, SqlFieldName = S_DIENSTCODE ];

Property SDOMAIN As %Numeric(EXTERNALSQLNAME = "S_DOMAIN", EXTERNALSQLTYPE = 3, MAXVAL = 9999999999, MINVAL = -9999999999, SCALE = 0) [ SqlColumnNumber = 24, SqlFieldName = S_DOMAIN ];

Property SFREEFIELD1 As %String(EXTERNALSQLNAME = "S_FREEFIELD1", EXTERNALSQLTYPE = 12, MAXLEN = 50) [ SqlColumnNumber = 12, SqlFieldName = S_FREEFIELD1 ];

Property SFREEFIELD2 As %String(EXTERNALSQLNAME = "S_FREEFIELD2", EXTERNALSQLTYPE = 12, MAXLEN = 50) [ SqlColumnNumber = 13, SqlFieldName = S_FREEFIELD2 ];

Property SFREEFIELD3 As %String(EXTERNALSQLNAME = "S_FREEFIELD3", EXTERNALSQLTYPE = 12, MAXLEN = 50) [ SqlColumnNumber = 14, SqlFieldName = S_FREEFIELD3 ];

Property SGROUP As %Numeric(EXTERNALSQLNAME = "S_GROUP", EXTERNALSQLTYPE = 3, MAXVAL = 9, MINVAL = -9, SCALE = 0) [ SqlColumnNumber = 17, SqlFieldName = S_GROUP ];

Property SHOSPITAL As %Float(EXTERNALSQLNAME = "S_HOSPITAL", EXTERNALSQLTYPE = 6) [ SqlColumnNumber = 16, SqlFieldName = S_HOSPITAL ];

Property SHOSPITALKEY As %String(EXTERNALSQLNAME = "S_HOSPITALKEY", EXTERNALSQLTYPE = 12, MAXLEN = 100) [ SqlColumnNumber = 9, SqlFieldName = S_HOSPITALKEY ];

Property SKEY As %Numeric(EXTERNALSQLNAME = "S_KEY", EXTERNALSQLTYPE = 3, MAXVAL = 9999999999, MINVAL = -9999999999, SCALE = 0) [ Required, SqlColumnNumber = 2, SqlFieldName = S_KEY ];

Property SNAME As %String(EXTERNALSQLNAME = "S_NAME", EXTERNALSQLTYPE = 12, MAXLEN = 100) [ Required, SqlColumnNumber = 4, SqlFieldName = S_NAME ];

Property SNAME1 As %String(EXTERNALSQLNAME = "S_NAME1", EXTERNALSQLTYPE = 12, MAXLEN = 30) [ SqlColumnNumber = 18, SqlFieldName = S_NAME1 ];

Property SNAME2 As %String(EXTERNALSQLNAME = "S_NAME2", EXTERNALSQLTYPE = 12, MAXLEN = 30) [ SqlColumnNumber = 19, SqlFieldName = S_NAME2 ];

Property SNAME3 As %String(EXTERNALSQLNAME = "S_NAME3", EXTERNALSQLTYPE = 12, MAXLEN = 30) [ SqlColumnNumber = 20, SqlFieldName = S_NAME3 ];

Property SPARENT As %Float(EXTERNALSQLNAME = "S_PARENT", EXTERNALSQLTYPE = 6) [ SqlColumnNumber = 21, SqlFieldName = S_PARENT ];

Property SPATH As %String(EXTERNALSQLNAME = "S_PATH", EXTERNALSQLTYPE = 12, MAXLEN = 254) [ Required, SqlColumnNumber = 22, SqlFieldName = S_PATH ];

Property SSOUNDEX As %String(EXTERNALSQLNAME = "S_SOUNDEX", EXTERNALSQLTYPE = 12, MAXLEN = 100) [ SqlColumnNumber = 10, SqlFieldName = S_SOUNDEX ];

Property STYPE As %String(EXTERNALSQLNAME = "S_TYPE", EXTERNALSQLTYPE = 12, MAXLEN = 1) [ SqlColumnNumber = 15, SqlFieldName = S_TYPE ];

Index MainIndex On SKEY [ IdKey, PrimaryKey ];

Parameter CONNECTION = "QDOC2,NOCREATE";

Parameter EXTDBNAME = "Oracle";

Parameter EXTERNALTABLENAME = "SYSADM.SERVICES";

Storage GSQLStorage
{
<ExtentSize>100000</ExtentSize>
<StreamLocation>^CHUBXL.DB.QDOC2.SERVICESS</StreamLocation>
<Type>%CacheSQLStorage</Type>
}

}
