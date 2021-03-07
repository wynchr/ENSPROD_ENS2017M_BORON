Class CHUBXL.DB.QDOC1.LETADMISSION Extends %Library.Persistent [ ClassType = persistent, Not ProcedureBlock, SqlRowIdPrivate, SqlTableName = LET_ADMISSION, StorageStrategy = GSQLStorage ]
{

Property LAADMISSIONNR As %String(EXTERNALSQLNAME = "LA_ADMISSION_NR", EXTERNALSQLTYPE = 12, MAXLEN = 20) [ SqlColumnNumber = 3, SqlFieldName = LA_ADMISSION_NR ];

Property LALETTERKEY As %Float(EXTERNALSQLNAME = "LA_LETTER_KEY", EXTERNALSQLTYPE = 6) [ Required, SqlColumnNumber = 2, SqlFieldName = LA_LETTER_KEY ];

Property LAREMARK As %String(EXTERNALSQLNAME = "LA_REMARK", EXTERNALSQLTYPE = 12, MAXLEN = 70) [ SqlColumnNumber = 7, SqlFieldName = LA_REMARK ];

Property LAREQUESTNR As %String(EXTERNALSQLNAME = "LA_REQUEST_NR", EXTERNALSQLTYPE = 12, MAXLEN = 17) [ SqlColumnNumber = 6, SqlFieldName = LA_REQUEST_NR ];

Property LASERVICEKEY As %Float(EXTERNALSQLNAME = "LA_SERVICE_KEY", EXTERNALSQLTYPE = 6) [ SqlColumnNumber = 4, SqlFieldName = LA_SERVICE_KEY ];

Property LATRANSFERKEY As %Numeric(EXTERNALSQLNAME = "LA_TRANSFER_KEY", EXTERNALSQLTYPE = 3, MAXVAL = 9999999999, MINVAL = -9999999999, SCALE = 0) [ SqlColumnNumber = 5, SqlFieldName = LA_TRANSFER_KEY ];

Index MainIndex On LALETTERKEY [ IdKey, PrimaryKey ];

Parameter CONNECTION = "QDOC1,NOCREATE";

Parameter EXTDBNAME = "Oracle";

Parameter EXTERNALTABLENAME = "SYSADM.LET_ADMISSION";

Storage GSQLStorage
{
<ExtentSize>100000</ExtentSize>
<StreamLocation>^CHUBXL.DB.QDOC1.LETADMISSIONS</StreamLocation>
<Type>%CacheSQLStorage</Type>
}

}
