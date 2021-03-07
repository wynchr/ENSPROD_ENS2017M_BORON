Class CHUBXL.DB.QDOC2.REPORTBODYDESC Extends %Library.Persistent [ ClassType = persistent, Not ProcedureBlock, SqlRowIdPrivate, SqlTableName = REPORT_BODY_DESC, StorageStrategy = GSQLStorage ]
{

Property RBDARCHIVED As %TimeStamp(EXTERNALSQLNAME = "RBD_ARCHIVED", EXTERNALSQLTYPE = 93) [ SqlColumnNumber = 5, SqlFieldName = RBD_ARCHIVED ];

Property RBDEXTID As %String(EXTERNALSQLNAME = "RBD_EXT_ID", EXTERNALSQLTYPE = 12, MAXLEN = 250) [ SqlColumnNumber = 7, SqlFieldName = RBD_EXT_ID ];

Property RBDEXTTYPE As %String(EXTERNALSQLNAME = "RBD_EXT_TYPE", EXTERNALSQLTYPE = 12, MAXLEN = 10) [ SqlColumnNumber = 6, SqlFieldName = RBD_EXT_TYPE ];

Property RBDFORMAT As %String(EXTERNALSQLNAME = "RBD_FORMAT", EXTERNALSQLTYPE = 12, MAXLEN = 10) [ Required, SqlColumnNumber = 4, SqlFieldName = RBD_FORMAT ];

Property RBDKEY As %Numeric(EXTERNALSQLNAME = "RBD_KEY", EXTERNALSQLTYPE = 3, MAXVAL = 9999999999, MINVAL = -9999999999, SCALE = 0) [ Required, SqlColumnNumber = 2, SqlFieldName = RBD_KEY ];

Property RBDLENGTH As %Numeric(EXTERNALSQLNAME = "RBD_LENGTH", EXTERNALSQLTYPE = 3, MAXVAL = 9999999999, MINVAL = -9999999999, SCALE = 0) [ Required, SqlColumnNumber = 3, SqlFieldName = RBD_LENGTH ];

Index MainIndex On RBDKEY [ IdKey, PrimaryKey ];

Parameter CONNECTION = "QDOC2,NOCREATE";

Parameter EXTDBNAME = "Oracle";

Parameter EXTERNALTABLENAME = "SYSADM.REPORT_BODY_DESC";

Storage GSQLStorage
{
<ExtentSize>100000</ExtentSize>
<StreamLocation>^CHUBXL.DB.QDOC2.REPORTBODYDESCS</StreamLocation>
<Type>%CacheSQLStorage</Type>
}

}
