Class CHUBXL.DB.WISH.URGH Extends %Library.Persistent [ ClassType = persistent, Not ProcedureBlock, SqlRowIdPrivate, SqlTableName = URGH, StorageStrategy = GSQLStorage ]
{

Property SAHSURTIME As %Numeric(EXTERNALSQLNAME = "SAHSURTIME", EXTERNALSQLTYPE = 3, MAXVAL = 99999999999999, MINVAL = -99999999999999, SCALE = 0) [ Required, SqlColumnNumber = 24, SqlFieldName = SAHSURTIME ];

Property SAHSURUSER As %String(EXTERNALSQLNAME = "SAHSURUSER", EXTERNALSQLTYPE = 1, MAXLEN = 10) [ Required, SqlColumnNumber = 25, SqlFieldName = SAHSURUSER ];

Property URAARD As %String(EXTERNALSQLNAME = "URAARD", EXTERNALSQLTYPE = 1, MAXLEN = 2) [ Required, SqlColumnNumber = 3, SqlFieldName = URAARD ];

Property URAFD As %String(EXTERNALSQLNAME = "URAFD", EXTERNALSQLTYPE = 1, MAXLEN = 4) [ Required, SqlColumnNumber = 6, SqlFieldName = URAFD ];

Property URAMBU As %String(EXTERNALSQLNAME = "URAMBU", EXTERNALSQLTYPE = 1, MAXLEN = 6) [ Required, SqlColumnNumber = 19, SqlFieldName = URAMBU ];

Property URCASE As %Numeric(EXTERNALSQLNAME = "URCASE", EXTERNALSQLTYPE = 3, MAXVAL = 9999999999, MINVAL = -9999999999, SCALE = 0) [ Required, SqlColumnNumber = 2, SqlFieldName = URCASE ];

Property URDEST As %String(EXTERNALSQLNAME = "URDEST", EXTERNALSQLTYPE = 1, MAXLEN = 1) [ Required, SqlColumnNumber = 14, SqlFieldName = URDEST ];

Property URFPIT As %String(EXTERNALSQLNAME = "URFPIT", EXTERNALSQLTYPE = 1, MAXLEN = 10) [ Required, SqlColumnNumber = 23, SqlFieldName = URFPIT ];

Property URFSMU As %String(EXTERNALSQLNAME = "URFSMU", EXTERNALSQLTYPE = 1, MAXLEN = 10) [ Required, SqlColumnNumber = 18, SqlFieldName = URFSMU ];

Property URHART As %Numeric(EXTERNALSQLNAME = "URHART", EXTERNALSQLTYPE = 3, MAXVAL = 99999999, MINVAL = -99999999, SCALE = 0) [ Required, SqlColumnNumber = 9, SqlFieldName = URHART ];

Property URMOTE As %String(EXTERNALSQLNAME = "URMOTE", EXTERNALSQLTYPE = 1, MAXLEN = 1) [ Required, SqlColumnNumber = 16, SqlFieldName = URMOTE ];

Property URPIT As %String(EXTERNALSQLNAME = "URPIT", EXTERNALSQLTYPE = 1, MAXLEN = 6) [ Required, SqlColumnNumber = 22, SqlFieldName = URPIT ];

Property URPLA1 As %String(EXTERNALSQLNAME = "URPLA1", EXTERNALSQLTYPE = 1, MAXLEN = 2) [ Required, SqlColumnNumber = 12, SqlFieldName = URPLA1 ];

Property URPLA2 As %String(EXTERNALSQLNAME = "URPLA2", EXTERNALSQLTYPE = 1, MAXLEN = 2) [ Required, SqlColumnNumber = 13, SqlFieldName = URPLA2 ];

Property URREDE As %String(EXTERNALSQLNAME = "URREDE", EXTERNALSQLTYPE = 1, MAXLEN = 50) [ Required, SqlColumnNumber = 4, SqlFieldName = URREDE ];

Property URROAC As %String(EXTERNALSQLNAME = "URROAC", EXTERNALSQLTYPE = 1, MAXLEN = 1) [ Required, SqlColumnNumber = 20, SqlFieldName = URROAC ];

Property URSART As %String(EXTERNALSQLNAME = "URSART", EXTERNALSQLTYPE = 1, MAXLEN = 8) [ Required, SqlColumnNumber = 10, SqlFieldName = URSART ];

Property URSMUR As %String(EXTERNALSQLNAME = "URSMUR", EXTERNALSQLTYPE = 1, MAXLEN = 6) [ Required, SqlColumnNumber = 17, SqlFieldName = URSMUR ];

Property URSUIV As %String(EXTERNALSQLNAME = "URSUIV", EXTERNALSQLTYPE = 1, MAXLEN = 1) [ Required, SqlColumnNumber = 21, SqlFieldName = URSUIV ];

Property URVERV As %String(EXTERNALSQLNAME = "URVERV", EXTERNALSQLTYPE = 1, MAXLEN = 6) [ Required, SqlColumnNumber = 5, SqlFieldName = URVERV ];

Property URVERW As %String(EXTERNALSQLNAME = "URVERW", EXTERNALSQLTYPE = 1, MAXLEN = 1) [ Required, SqlColumnNumber = 8, SqlFieldName = URVERW ];

Property URZIEO As %Numeric(EXTERNALSQLNAME = "URZIEO", EXTERNALSQLTYPE = 3, MAXVAL = 99999999999, MINVAL = -99999999999, SCALE = 0) [ Required, SqlColumnNumber = 15, SqlFieldName = URZIEO ];

Property URZIEV As %Numeric(EXTERNALSQLNAME = "URZIEV", EXTERNALSQLTYPE = 3, MAXVAL = 99999999999, MINVAL = -99999999999, SCALE = 0) [ Required, SqlColumnNumber = 7, SqlFieldName = URZIEV ];

Property URZIEW As %Numeric(EXTERNALSQLNAME = "URZIEW", EXTERNALSQLTYPE = 3, MAXVAL = 99999999999, MINVAL = -99999999999, SCALE = 0) [ Required, SqlColumnNumber = 11, SqlFieldName = URZIEW ];

Index MainIndex On URCASE [ IdKey, PrimaryKey ];

Parameter CONNECTION = "WISHHUD,NOCREATE";

Parameter EXTDBNAME = "DB2/400 SQL";

Parameter EXTERNALTABLENAME = "MEDHUDF.SAHSUR";

Storage GSQLStorage
{
<ExtentSize>100000</ExtentSize>
<StreamLocation>^CHUBXL.DB.WISH.URGHS</StreamLocation>
<Type>%CacheSQLStorage</Type>
}

}
