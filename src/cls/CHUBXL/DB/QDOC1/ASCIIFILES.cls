Class CHUBXL.DB.QDOC1.ASCIIFILES Extends %Library.Persistent [ ClassType = persistent, Not ProcedureBlock, SqlRowIdPrivate, SqlTableName = ASCII_FILES, StorageStrategy = GSQLStorage ]
{

Property AFCONCLUSION As %String(EXTERNALSQLNAME = "AF_CONCLUSION", EXTERNALSQLTYPE = 12, MAXLEN = 160) [ SqlColumnNumber = 12, SqlFieldName = AF_CONCLUSION ];

Property AFDATELASTCHANGED As %TimeStamp(EXTERNALSQLNAME = "AF_DATELASTCHANGED", EXTERNALSQLTYPE = 93) [ SqlColumnNumber = 8, SqlFieldName = AF_DATELASTCHANGED ];

Property AFDATEWRITTEN As %TimeStamp(EXTERNALSQLNAME = "AF_DATEWRITTEN", EXTERNALSQLTYPE = 93) [ Required, SqlColumnNumber = 4, SqlFieldName = AF_DATEWRITTEN ];

Property AFKEY As %Numeric(EXTERNALSQLNAME = "AF_KEY", EXTERNALSQLTYPE = 3, MAXVAL = 9999999999, MINVAL = -9999999999, SCALE = 0) [ Required, SqlColumnNumber = 2, SqlFieldName = AF_KEY ];

Property AFLASTCHANGEDBY As %String(EXTERNALSQLNAME = "AF_LASTCHANGEDBY", EXTERNALSQLTYPE = 12, MAXLEN = 40) [ SqlColumnNumber = 9, SqlFieldName = AF_LASTCHANGEDBY ];

Property AFLENGTH As %Numeric(EXTERNALSQLNAME = "AF_LENGTH", EXTERNALSQLTYPE = 3, MAXVAL = 9999999999, MINVAL = -9999999999, SCALE = 0) [ Required, SqlColumnNumber = 14, SqlFieldName = AF_LENGTH ];

Property AFLOCKED As %String(EXTERNALSQLNAME = "AF_LOCKED", EXTERNALSQLTYPE = 12, MAXLEN = 1) [ Required, SqlColumnNumber = 16, SqlFieldName = AF_LOCKED ];

Property AFPKEY As %Numeric(EXTERNALSQLNAME = "AF_P_KEY", EXTERNALSQLTYPE = 3, MAXVAL = 9999999999, MINVAL = -9999999999, SCALE = 0) [ Required, SqlColumnNumber = 3, SqlFieldName = AF_P_KEY ];

Property AFREF As %String(EXTERNALSQLNAME = "AF_REF", EXTERNALSQLTYPE = 12, MAXLEN = 15) [ SqlColumnNumber = 17, SqlFieldName = AF_REF ];

Property AFREQUESTKEY As %Numeric(EXTERNALSQLNAME = "AF_REQUESTKEY", EXTERNALSQLTYPE = 3, MAXVAL = 9999999999, MINVAL = -9999999999, SCALE = 0) [ SqlColumnNumber = 11, SqlFieldName = AF_REQUESTKEY ];

Property AFSERVICE As %Numeric(EXTERNALSQLNAME = "AF_SERVICE", EXTERNALSQLTYPE = 3, MAXVAL = 9999999999, MINVAL = -9999999999, SCALE = 0) [ Required, SqlColumnNumber = 5, SqlFieldName = AF_SERVICE ];

Property AFTEMPLATE As %String(EXTERNALSQLNAME = "AF_TEMPLATE", EXTERNALSQLTYPE = 12, MAXLEN = 10) [ Required, SqlColumnNumber = 10, SqlFieldName = AF_TEMPLATE ];

Property AFTEXT As %Stream.GlobalCharacter(CLASSNAME = 2, EXTERNALSQLNAME = "AF_TEXT", EXTERNALSQLTYPE = -1) [ Required, SqlColumnNumber = 15, SqlFieldName = AF_TEXT ];

Property AFVALIDATED As %String(EXTERNALSQLNAME = "AF_VALIDATED", EXTERNALSQLTYPE = 12, MAXLEN = 1) [ Required, SqlColumnNumber = 13, SqlFieldName = AF_VALIDATED ];

Property AFWRITTENBY As %String(EXTERNALSQLNAME = "AF_WRITTENBY", EXTERNALSQLTYPE = 12, MAXLEN = 40) [ Required, SqlColumnNumber = 6, SqlFieldName = AF_WRITTENBY ];

Property AFWRITTENFOR As %Numeric(EXTERNALSQLNAME = "AF_WRITTENFOR", EXTERNALSQLTYPE = 3, MAXVAL = 9999999999, MINVAL = -9999999999, SCALE = 0) [ Required, SqlColumnNumber = 7, SqlFieldName = AF_WRITTENFOR ];

Index MainIndex On AFKEY [ IdKey, PrimaryKey ];

Parameter CONNECTION = "QDOC1,NOCREATE";

Parameter EXTDBNAME = "Oracle";

Parameter EXTERNALTABLENAME = "SYSADM.ASCII_FILES";

Storage GSQLStorage
{
<ExtentSize>100000</ExtentSize>
<StreamLocation>^CHUBXL.DB.QDOC1.ASCIIFILESS</StreamLocation>
<Type>%CacheSQLStorage</Type>
}

}
