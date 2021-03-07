Class CHUBXL.DB.WISH.MVTH Extends %Library.Persistent [ ClassType = persistent, Not ProcedureBlock, SqlRowIdPrivate, SqlTableName = MVTH, StorageStrategy = GSQLStorage ]
{

Property CLACTY As %String(EXTERNALSQLNAME = "CLACTY", EXTERNALSQLTYPE = 1, MAXLEN = 1) [ Required, SqlColumnNumber = 9, SqlFieldName = CLACTY ];

Property CLACUT As %String(EXTERNALSQLNAME = "CLACUT", EXTERNALSQLTYPE = 1, MAXLEN = 3) [ Required, SqlColumnNumber = 11, SqlFieldName = CLACUT ];

Property CLBDGR As %String(EXTERNALSQLNAME = "CLBDGR", EXTERNALSQLTYPE = 1, MAXLEN = 2) [ Required, SqlColumnNumber = 12, SqlFieldName = CLBDGR ];

Property CLBED As %String(EXTERNALSQLNAME = "CLBED", EXTERNALSQLTYPE = 1, MAXLEN = 3) [ Required, SqlColumnNumber = 7, SqlFieldName = CLBED ];

Property CLCASE As %Numeric(EXTERNALSQLNAME = "CLCASE", EXTERNALSQLTYPE = 2, MAXVAL = 9999999999, MINVAL = -9999999999, SCALE = 0) [ Required, SqlColumnNumber = 2, SqlFieldName = CLCASE ];

Property CLCCAT As %Numeric(EXTERNALSQLNAME = "CLCCAT", EXTERNALSQLTYPE = 2, MAXVAL = 9, MINVAL = -9, SCALE = 0) [ Required, SqlColumnNumber = 17, SqlFieldName = CLCCAT ];

Property CLCINT As %Numeric(EXTERNALSQLNAME = "CLCINT", EXTERNALSQLTYPE = 2, MAXVAL = 9, MINVAL = -9, SCALE = 0) [ Required, SqlColumnNumber = 16, SqlFieldName = CLCINT ];

Property CLCLIE As %String(EXTERNALSQLNAME = "CLCLIE", EXTERNALSQLTYPE = 1, MAXLEN = 4) [ Required, SqlColumnNumber = 20, SqlFieldName = CLCLIE ];

Property CLCMTR As %String(EXTERNALSQLNAME = "CLCMTR", EXTERNALSQLTYPE = 1, MAXLEN = 2) [ Required, SqlColumnNumber = 26, SqlFieldName = CLCMTR ];

Property CLDEPT As %String(EXTERNALSQLNAME = "CLDEPT", EXTERNALSQLTYPE = 1, MAXLEN = 4) [ Required, SqlColumnNumber = 8, SqlFieldName = CLDEPT ];

Property CLFROM As %Numeric(EXTERNALSQLNAME = "CLFROM", EXTERNALSQLTYPE = 2, MAXVAL = 999999999999, MINVAL = -999999999999, SCALE = 0) [ Required, SqlColumnNumber = 4, SqlFieldName = CLFROM ];

Property CLHDO2 As %String(EXTERNALSQLNAME = "CLHDO2", EXTERNALSQLTYPE = 1, MAXLEN = 5) [ Required, SqlColumnNumber = 18, SqlFieldName = CLHDO2 ];

Property CLID As %String(EXTERNALSQLNAME = "CLID", EXTERNALSQLTYPE = 1, MAXLEN = 5) [ Required, SqlColumnNumber = 19, SqlFieldName = CLID ];

Property CLNSID As %String(EXTERNALSQLNAME = "CLNSID", EXTERNALSQLTYPE = 1, MAXLEN = 4) [ Required, SqlColumnNumber = 5, SqlFieldName = CLNSID ];

Property CLPCON As %String(EXTERNALSQLNAME = "CLPCON", EXTERNALSQLTYPE = 1, MAXLEN = 5) [ Required, SqlColumnNumber = 10, SqlFieldName = CLPCON ];

Property CLRES1 As %String(EXTERNALSQLNAME = "CLRES1", EXTERNALSQLTYPE = 1, MAXLEN = 1) [ Required, SqlColumnNumber = 27, SqlFieldName = CLRES1 ];

Property CLRES2 As %String(EXTERNALSQLNAME = "CLRES2", EXTERNALSQLTYPE = 1, MAXLEN = 2) [ Required, SqlColumnNumber = 28, SqlFieldName = CLRES2 ];

Property CLRES3 As %String(EXTERNALSQLNAME = "CLRES3", EXTERNALSQLTYPE = 1, MAXLEN = 3) [ Required, SqlColumnNumber = 29, SqlFieldName = CLRES3 ];

Property CLRES4 As %String(EXTERNALSQLNAME = "CLRES4", EXTERNALSQLTYPE = 1, MAXLEN = 12) [ Required, SqlColumnNumber = 30, SqlFieldName = CLRES4 ];

Property CLROOM As %String(EXTERNALSQLNAME = "CLROOM", EXTERNALSQLTYPE = 1, MAXLEN = 4) [ Required, SqlColumnNumber = 6, SqlFieldName = CLROOM ];

Property CLRSCD As %String(EXTERNALSQLNAME = "CLRSCD", EXTERNALSQLTYPE = 1, MAXLEN = 1) [ Required, SqlColumnNumber = 3, SqlFieldName = CLRSCD ];

Property CLSITE As %String(EXTERNALSQLNAME = "CLSITE", EXTERNALSQLTYPE = 1, MAXLEN = 2) [ Required, SqlColumnNumber = 21, SqlFieldName = CLSITE ];

Property CLSVTC As %String(EXTERNALSQLNAME = "CLSVTC", EXTERNALSQLTYPE = 1, MAXLEN = 6) [ Required, SqlColumnNumber = 22, SqlFieldName = CLSVTC ];

Property CLTARA As %Numeric(EXTERNALSQLNAME = "CLTARA", EXTERNALSQLTYPE = 2, MAXVAL = 9, MINVAL = -9, SCALE = 0) [ Required, SqlColumnNumber = 15, SqlFieldName = CLTARA ];

Property CLTARC As %Numeric(EXTERNALSQLNAME = "CLTARC", EXTERNALSQLTYPE = 2, MAXVAL = 9, MINVAL = -9, SCALE = 0) [ Required, SqlColumnNumber = 14, SqlFieldName = CLTARC ];

Property CLTARS As %Numeric(EXTERNALSQLNAME = "CLTARS", EXTERNALSQLTYPE = 2, MAXVAL = 9, MINVAL = -9, SCALE = 0) [ Required, SqlColumnNumber = 13, SqlFieldName = CLTARS ];

Property CLTIMA As %Numeric(EXTERNALSQLNAME = "CLTIMA", EXTERNALSQLTYPE = 3, MAXVAL = 99999999999999, MINVAL = -99999999999999, SCALE = 0) [ Required, SqlColumnNumber = 32, SqlFieldName = CLTIMA ];

Property CLTIMU As %Numeric(EXTERNALSQLNAME = "CLTIMU", EXTERNALSQLTYPE = 3, MAXVAL = 99999999999999, MINVAL = -99999999999999, SCALE = 0) [ Required, SqlColumnNumber = 34, SqlFieldName = CLTIMU ];

Property CLTIMV As %Numeric(EXTERNALSQLNAME = "CLTIMV", EXTERNALSQLTYPE = 3, MAXVAL = 99999999999999, MINVAL = -99999999999999, SCALE = 0) [ Required, SqlColumnNumber = 25, SqlFieldName = CLTIMV ];

Property CLUSRA As %String(EXTERNALSQLNAME = "CLUSRA", EXTERNALSQLTYPE = 1, MAXLEN = 10) [ Required, SqlColumnNumber = 31, SqlFieldName = CLUSRA ];

Property CLUSRU As %String(EXTERNALSQLNAME = "CLUSRU", EXTERNALSQLTYPE = 1, MAXLEN = 10) [ Required, SqlColumnNumber = 33, SqlFieldName = CLUSRU ];

Property CLUSRV As %String(EXTERNALSQLNAME = "CLUSRV", EXTERNALSQLTYPE = 1, MAXLEN = 10) [ Required, SqlColumnNumber = 24, SqlFieldName = CLUSRV ];

Property CLVALI As %String(EXTERNALSQLNAME = "CLVALI", EXTERNALSQLTYPE = 1, MAXLEN = 1) [ Required, SqlColumnNumber = 23, SqlFieldName = CLVALI ];

Index MainIndex On CLCASE [ IdKey, PrimaryKey ];

Parameter CONNECTION = "WISHHUD,NOCREATE";

Parameter EXTDBNAME = "DB2/400 SQL";

Parameter EXTERNALTABLENAME = "MEDHUDF.CLOCAT";

Storage GSQLStorage
{
<ExtentSize>100000</ExtentSize>
<StreamLocation>^CHUBXL.DB.WISH.MVTHS</StreamLocation>
<Type>%CacheSQLStorage</Type>
}

}
