Class CHUBXL.DB.QDOC2.USERS Extends %Library.Persistent [ ClassType = persistent, Not ProcedureBlock, SqlRowIdPrivate, SqlTableName = USERS, StorageStrategy = GSQLStorage ]
{

Property UBADGEID As %String(EXTERNALSQLNAME = "U_BADGEID", EXTERNALSQLTYPE = 12, MAXLEN = 150) [ SqlColumnNumber = 8, SqlFieldName = U_BADGEID ];

Property UCHANGEDATE As %TimeStamp(EXTERNALSQLNAME = "U_CHANGEDATE", EXTERNALSQLTYPE = 93) [ SqlColumnNumber = 15, SqlFieldName = U_CHANGEDATE ];

Property UCHANGEDBY As %String(EXTERNALSQLNAME = "U_CHANGEDBY", EXTERNALSQLTYPE = 12, MAXLEN = 40) [ SqlColumnNumber = 14, SqlFieldName = U_CHANGEDBY ];

Property UDATEINVALID As %TimeStamp(EXTERNALSQLNAME = "U_DATEINVALID", EXTERNALSQLTYPE = 93) [ SqlColumnNumber = 13, SqlFieldName = U_DATEINVALID ];

Property UDOCTORKEY As %Numeric(EXTERNALSQLNAME = "U_DOCTORKEY", EXTERNALSQLTYPE = 3, MAXVAL = 9999999999, MINVAL = -9999999999, SCALE = 0) [ SqlColumnNumber = 9, SqlFieldName = U_DOCTORKEY ];

Property UFNAME As %String(EXTERNALSQLNAME = "U_FNAME", EXTERNALSQLTYPE = 12, MAXLEN = 30) [ SqlColumnNumber = 4, SqlFieldName = U_FNAME ];

Property UGROUP As %Numeric(EXTERNALSQLNAME = "U_GROUP", EXTERNALSQLTYPE = 3, MAXVAL = 9999999999, MINVAL = -9999999999, SCALE = 0) [ SqlColumnNumber = 11, SqlFieldName = U_GROUP ];

Property UINITIALS As %String(EXTERNALSQLNAME = "U_INITIALS", EXTERNALSQLTYPE = 12, MAXLEN = 10) [ SqlColumnNumber = 5, SqlFieldName = U_INITIALS ];

Property UKEY As %Numeric(EXTERNALSQLNAME = "U_KEY", EXTERNALSQLTYPE = 3, MAXVAL = 9999999999, MINVAL = -9999999999, SCALE = 0) [ Required, SqlColumnNumber = 2, SqlFieldName = U_KEY ];

Property ULANCOL As %Float(EXTERNALSQLNAME = "U_LANCOL", EXTERNALSQLTYPE = 6) [ SqlColumnNumber = 18, SqlFieldName = U_LANCOL ];

Property ULANGUAGE As %Numeric(EXTERNALSQLNAME = "U_LANGUAGE", EXTERNALSQLTYPE = 3, MAXVAL = 99999, MINVAL = -99999, SCALE = 0) [ Required, SqlColumnNumber = 12, SqlFieldName = U_LANGUAGE ];

Property ULDAPID As %String(EXTERNALSQLNAME = "U_LDAP_ID", EXTERNALSQLTYPE = 12, MAXLEN = 254) [ SqlColumnNumber = 21, SqlFieldName = U_LDAP_ID ];

Property ULOGINNAME As %String(EXTERNALSQLNAME = "U_LOGINNAME", EXTERNALSQLTYPE = 12, MAXLEN = 40) [ Required, SqlColumnNumber = 6, SqlFieldName = U_LOGINNAME ];

Property UNAME As %String(EXTERNALSQLNAME = "U_NAME", EXTERNALSQLTYPE = 12, MAXLEN = 40) [ Required, SqlColumnNumber = 3, SqlFieldName = U_NAME ];

Property UPASSWORD As %String(EXTERNALSQLNAME = "U_PASSWORD", EXTERNALSQLTYPE = 12, MAXLEN = 40) [ Required, SqlColumnNumber = 7, SqlFieldName = U_PASSWORD ];

Property UPWDEXPIRATION As %TimeStamp(EXTERNALSQLNAME = "U_PWD_EXPIRATION", EXTERNALSQLTYPE = 93) [ SqlColumnNumber = 19, SqlFieldName = U_PWD_EXPIRATION ];

Property USERVICE As %Numeric(EXTERNALSQLNAME = "U_SERVICE", EXTERNALSQLTYPE = 3, MAXVAL = 9999999999, MINVAL = -9999999999, SCALE = 0) [ SqlColumnNumber = 10, SqlFieldName = U_SERVICE ];

Property USOUNDEX As %String(EXTERNALSQLNAME = "U_SOUNDEX", EXTERNALSQLTYPE = 12, MAXLEN = 71) [ SqlColumnNumber = 17, SqlFieldName = U_SOUNDEX ];

Property USTDTXTGROUP As %Numeric(EXTERNALSQLNAME = "U_STDTXTGROUP", EXTERNALSQLTYPE = 3, MAXVAL = 9999999999, MINVAL = -9999999999, SCALE = 0) [ SqlColumnNumber = 16, SqlFieldName = U_STDTXTGROUP ];

Property UVALIDFROM As %TimeStamp(EXTERNALSQLNAME = "U_VALIDFROM", EXTERNALSQLTYPE = 93) [ SqlColumnNumber = 20, SqlFieldName = U_VALIDFROM ];

Index MainIndex On UKEY [ IdKey, PrimaryKey ];

Parameter CONNECTION = "QDOC2,NOCREATE";

Parameter EXTDBNAME = "Oracle";

Parameter EXTERNALTABLENAME = "SYSADM.USERS";

Storage GSQLStorage
{
<ExtentSize>100000</ExtentSize>
<StreamLocation>^CHUBXL.DB.QDOC2.USERSS</StreamLocation>
<Type>%CacheSQLStorage</Type>
}

}
