Class CHUBXL.DB.WISH.PASSAGE Extends %Library.Persistent [ ClassType = persistent, Not ProcedureBlock, SqlRowIdPrivate, SqlTableName = PASSAGE, StorageStrategy = GSQLStorage ]
{

Property VIADOC As %String(EXTERNALSQLNAME = "VIADOC", EXTERNALSQLTYPE = 1, MAXLEN = 5) [ Required, SqlColumnNumber = 7, SqlFieldName = VIADOC ];

Property VIBBNSEJ As %Numeric(EXTERNALSQLNAME = "VIBBNSEJ", EXTERNALSQLTYPE = 2, MAXVAL = 9999999999, MINVAL = -9999999999, SCALE = 0) [ Required, SqlColumnNumber = 23, SqlFieldName = VIBBNSEJ ];

Property VICACT As %String(EXTERNALSQLNAME = "VICACT", EXTERNALSQLTYPE = 1, MAXLEN = 8) [ Required, SqlColumnNumber = 10, SqlFieldName = VICACT ];

Property VICHDG As %Numeric(EXTERNALSQLNAME = "VICHDG", EXTERNALSQLTYPE = 2, MAXVAL = 99, MINVAL = -99, SCALE = 0) [ Required, SqlColumnNumber = 13, SqlFieldName = VICHDG ];

Property VICLIE As %String(EXTERNALSQLNAME = "VICLIE", EXTERNALSQLTYPE = 1, MAXLEN = 4) [ Required, SqlColumnNumber = 11, SqlFieldName = VICLIE ];

Property VIDACR As %Numeric(EXTERNALSQLNAME = "VIDACR", EXTERNALSQLTYPE = 2, MAXVAL = 999999999999, MINVAL = -999999999999, SCALE = 0) [ Required, SqlColumnNumber = 33, SqlFieldName = VIDACR ];

Property VIDAMD As %Numeric(EXTERNALSQLNAME = "VIDAMD", EXTERNALSQLTYPE = 2, MAXVAL = 999999999999, MINVAL = -999999999999, SCALE = 0) [ Required, SqlColumnNumber = 34, SqlFieldName = VIDAMD ];

Property VIDEPT As %String(EXTERNALSQLNAME = "VIDEPT", EXTERNALSQLTYPE = 1, MAXLEN = 4) [ Required, SqlColumnNumber = 14, SqlFieldName = VIDEPT ];

Property VIDLT As %String(EXTERNALSQLNAME = "VIDLT", EXTERNALSQLTYPE = 1, MAXLEN = 1) [ Required, SqlColumnNumber = 26, SqlFieldName = VIDLT ];

Property VIDTEND As %Numeric(EXTERNALSQLNAME = "VIDTEND", EXTERNALSQLTYPE = 2, MAXVAL = 999999999999, MINVAL = -999999999999, SCALE = 0) [ Required, SqlColumnNumber = 5, SqlFieldName = VIDTEND ];

Property VIDTHR As %Numeric(EXTERNALSQLNAME = "VIDTHR", EXTERNALSQLTYPE = 2, MAXVAL = 999999999999, MINVAL = -999999999999, SCALE = 0) [ Required, SqlColumnNumber = 4, SqlFieldName = VIDTHR ];

Property VIEXTNR As %Numeric(EXTERNALSQLNAME = "VIEXTNR", EXTERNALSQLTYPE = 2, MAXVAL = 9999999999, MINVAL = -9999999999, SCALE = 0) [ Required, SqlColumnNumber = 24, SqlFieldName = VIEXTNR ];

Property VIMRN As %Numeric(EXTERNALSQLNAME = "VIMRN", EXTERNALSQLTYPE = 2, MAXVAL = 9999999999, MINVAL = -9999999999, SCALE = 0) [ Required, SqlColumnNumber = 12, SqlFieldName = VIMRN ];

Property VINRPR As %Numeric(EXTERNALSQLNAME = "VINRPR", EXTERNALSQLTYPE = 2, MAXVAL = 99999999, MINVAL = -99999999, SCALE = 0) [ Required, SqlColumnNumber = 8, SqlFieldName = VINRPR ];

Property VINRRF As %Numeric(EXTERNALSQLNAME = "VINRRF", EXTERNALSQLTYPE = 2, MAXVAL = 99999999, MINVAL = -99999999, SCALE = 0) [ Required, SqlColumnNumber = 9, SqlFieldName = VINRRF ];

Property VINSEJ As %Numeric(EXTERNALSQLNAME = "VINSEJ", EXTERNALSQLTYPE = 2, MAXVAL = 9999999999, MINVAL = -9999999999, SCALE = 0) [ Required, SqlColumnNumber = 2, SqlFieldName = VINSEJ ];

Property VINSID As %String(EXTERNALSQLNAME = "VINSID", EXTERNALSQLTYPE = 1, MAXLEN = 4) [ Required, SqlColumnNumber = 15, SqlFieldName = VINSID ];

Property VIORIG As %String(EXTERNALSQLNAME = "VIORIG", EXTERNALSQLTYPE = 1, MAXLEN = 1) [ Required, SqlColumnNumber = 22, SqlFieldName = VIORIG ];

Property VIPASS As %Numeric(EXTERNALSQLNAME = "VIPASS", EXTERNALSQLTYPE = 2, MAXVAL = 9999, MINVAL = -9999, SCALE = 0) [ Required, SqlColumnNumber = 3, SqlFieldName = VIPASS ];

Property VIRES1 As %String(EXTERNALSQLNAME = "VIRES1", EXTERNALSQLTYPE = 1, MAXLEN = 1) [ Required, SqlColumnNumber = 27, SqlFieldName = VIRES1 ];

Property VIRES2 As %String(EXTERNALSQLNAME = "VIRES2", EXTERNALSQLTYPE = 1, MAXLEN = 1) [ Required, SqlColumnNumber = 28, SqlFieldName = VIRES2 ];

Property VIRES3 As %String(EXTERNALSQLNAME = "VIRES3", EXTERNALSQLTYPE = 1, MAXLEN = 6) [ Required, SqlColumnNumber = 29, SqlFieldName = VIRES3 ];

Property VIRES4 As %String(EXTERNALSQLNAME = "VIRES4", EXTERNALSQLTYPE = 1, MAXLEN = 8) [ Required, SqlColumnNumber = 30, SqlFieldName = VIRES4 ];

Property VISITE As %String(EXTERNALSQLNAME = "VISITE", EXTERNALSQLTYPE = 1, MAXLEN = 2) [ Required, SqlColumnNumber = 25, SqlFieldName = VISITE ];

Property VISTATUS As %String(EXTERNALSQLNAME = "VISTATUS", EXTERNALSQLTYPE = 1, MAXLEN = 1) [ Required, SqlColumnNumber = 21, SqlFieldName = VISTATUS ];

Property VITEVT As %String(EXTERNALSQLNAME = "VITEVT", EXTERNALSQLTYPE = 1, MAXLEN = 4) [ Required, SqlColumnNumber = 6, SqlFieldName = VITEVT ];

Property VIUSCR As %String(EXTERNALSQLNAME = "VIUSCR", EXTERNALSQLTYPE = 1, MAXLEN = 10) [ Required, SqlColumnNumber = 31, SqlFieldName = VIUSCR ];

Property VIUSMD As %String(EXTERNALSQLNAME = "VIUSMD", EXTERNALSQLTYPE = 1, MAXLEN = 10) [ Required, SqlColumnNumber = 32, SqlFieldName = VIUSMD ];

Property VIZON1 As %String(EXTERNALSQLNAME = "VIZON1", EXTERNALSQLTYPE = 1, MAXLEN = 1) [ Required, SqlColumnNumber = 16, SqlFieldName = VIZON1 ];

Property VIZON2 As %String(EXTERNALSQLNAME = "VIZON2", EXTERNALSQLTYPE = 1, MAXLEN = 1) [ Required, SqlColumnNumber = 17, SqlFieldName = VIZON2 ];

Property VIZON3 As %String(EXTERNALSQLNAME = "VIZON3", EXTERNALSQLTYPE = 1, MAXLEN = 1) [ Required, SqlColumnNumber = 18, SqlFieldName = VIZON3 ];

Property VIZON4 As %String(EXTERNALSQLNAME = "VIZON4", EXTERNALSQLTYPE = 1, MAXLEN = 6) [ Required, SqlColumnNumber = 19, SqlFieldName = VIZON4 ];

Property VIZON5 As %String(EXTERNALSQLNAME = "VIZON5", EXTERNALSQLTYPE = 1, MAXLEN = 10) [ Required, SqlColumnNumber = 20, SqlFieldName = VIZON5 ];

Index MainIndex On VINSEJ [ IdKey, PrimaryKey ];

Parameter CONNECTION = "WISHBRU,NOCREATE";

Parameter EXTDBNAME = "DB2/400 SQL";

Parameter EXTERNALTABLENAME = "MEDBRGF.SAHSVI";

Storage GSQLStorage
{
<ExtentSize>100000</ExtentSize>
<StreamLocation>^CHUBXL.DB.WISH.PASSAGES</StreamLocation>
<Type>%CacheSQLStorage</Type>
}

}
