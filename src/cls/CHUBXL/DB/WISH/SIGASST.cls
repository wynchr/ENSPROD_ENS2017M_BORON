Class CHUBXL.DB.WISH.SIGASST Extends %Library.Persistent [ ClassType = persistent, Not ProcedureBlock, SqlRowIdPrivate, SqlTableName = SIGASST, StorageStrategy = GSQLStorage ]
{

Property ADRAS As %String(EXTERNALSQLNAME = "ADRAS", EXTERNALSQLTYPE = 1, MAXLEN = 30) [ Required, SqlColumnNumber = 7, SqlFieldName = ADRAS ];

Property AFFMED As %String(EXTERNALSQLNAME = "AFFMED", EXTERNALSQLTYPE = 1, MAXLEN = 1) [ Required, SqlColumnNumber = 29, SqlFieldName = AFFMED ];

Property AMUAS As %String(EXTERNALSQLNAME = "AMUAS", EXTERNALSQLTYPE = 1, MAXLEN = 1) [ Required, SqlColumnNumber = 25, SqlFieldName = AMUAS ];

Property ASDEB As %Numeric(EXTERNALSQLNAME = "ASDEB", EXTERNALSQLTYPE = 3, MAXVAL = 99999999, MINVAL = -99999999, SCALE = 0) [ Required, SqlColumnNumber = 20, SqlFieldName = ASDEB ];

Property ASFIN As %Numeric(EXTERNALSQLNAME = "ASFIN", EXTERNALSQLTYPE = 3, MAXVAL = 99999999, MINVAL = -99999999, SCALE = 0) [ Required, SqlColumnNumber = 21, SqlFieldName = ASFIN ];

Property AZL1 As %String(EXTERNALSQLNAME = "AZL1", EXTERNALSQLTYPE = 1, MAXLEN = 1) [ Required, SqlColumnNumber = 42, SqlFieldName = AZL1 ];

Property AZL2 As %String(EXTERNALSQLNAME = "AZL2", EXTERNALSQLTYPE = 1, MAXLEN = 1) [ Required, SqlColumnNumber = 43, SqlFieldName = AZL2 ];

Property AZL3 As %String(EXTERNALSQLNAME = "AZL3", EXTERNALSQLTYPE = 1, MAXLEN = 1) [ Required, SqlColumnNumber = 44, SqlFieldName = AZL3 ];

Property AZL4 As %String(EXTERNALSQLNAME = "AZL4", EXTERNALSQLTYPE = 1, MAXLEN = 10) [ Required, SqlColumnNumber = 45, SqlFieldName = AZL4 ];

Property CDDTFR As %String(EXTERNALSQLNAME = "CDDTFR", EXTERNALSQLTYPE = 1, MAXLEN = 1) [ Required, SqlColumnNumber = 34, SqlFieldName = CDDTFR ];

Property CDFARE As %String(EXTERNALSQLNAME = "CDFARE", EXTERNALSQLTYPE = 1, MAXLEN = 1) [ Required, SqlColumnNumber = 33, SqlFieldName = CDFARE ];

Property CDFFBI As %String(EXTERNALSQLNAME = "CDFFBI", EXTERNALSQLTYPE = 1, MAXLEN = 1) [ Required, SqlColumnNumber = 30, SqlFieldName = CDFFBI ];

Property CDIMAT As %String(EXTERNALSQLNAME = "CDIMAT", EXTERNALSQLTYPE = 1, MAXLEN = 1) [ Required, SqlColumnNumber = 39, SqlFieldName = CDIMAT ];

Property CDMOSO As %Numeric(EXTERNALSQLNAME = "CDMOSO", EXTERNALSQLTYPE = 2, MAXVAL = 99, MINVAL = -99, SCALE = 0) [ Required, SqlColumnNumber = 26, SqlFieldName = CDMOSO ];

Property CDOFF As %String(EXTERNALSQLNAME = "CDOFF", EXTERNALSQLTYPE = 1, MAXLEN = 4) [ Required, SqlColumnNumber = 16, SqlFieldName = CDOFF ];

Property CDPOL As %String(EXTERNALSQLNAME = "CDPOL", EXTERNALSQLTYPE = 1, MAXLEN = 1) [ Required, SqlColumnNumber = 35, SqlFieldName = CDPOL ];

Property CPAAS As %String(EXTERNALSQLNAME = "CPAAS", EXTERNALSQLTYPE = 1, MAXLEN = 3) [ Required, SqlColumnNumber = 8, SqlFieldName = CPAAS ];

Property CPASINS As %String(EXTERNALSQLNAME = "CPASINS", EXTERNALSQLTYPE = 1, MAXLEN = 5) [ Required, SqlColumnNumber = 17, SqlFieldName = CPASINS ];

Property CPOAS As %String(EXTERNALSQLNAME = "CPOAS", EXTERNALSQLTYPE = 1, MAXLEN = 6) [ Required, SqlColumnNumber = 9, SqlFieldName = CPOAS ];

Property CRGAS As %String(EXTERNALSQLNAME = "CRGAS", EXTERNALSQLTYPE = 1, MAXLEN = 3) [ Required, SqlColumnNumber = 23, SqlFieldName = CRGAS ];

Property DACCAS As %String(EXTERNALSQLNAME = "DACCAS", EXTERNALSQLTYPE = 1, MAXLEN = 1) [ Required, SqlColumnNumber = 36, SqlFieldName = DACCAS ];

Property DEBCPT As %Numeric(EXTERNALSQLNAME = "DEBCPT", EXTERNALSQLTYPE = 3, MAXVAL = 999999999, MINVAL = -999999999, SCALE = 0) [ Required, SqlColumnNumber = 41, SqlFieldName = DEBCPT ];

Property F3PCT As %String(EXTERNALSQLNAME = "F3PCT", EXTERNALSQLTYPE = 1, MAXLEN = 1) [ Required, SqlColumnNumber = 31, SqlFieldName = F3PCT ];

Property FCATD As %String(EXTERNALSQLNAME = "FCATD", EXTERNALSQLTYPE = 1, MAXLEN = 1) [ Required, SqlColumnNumber = 32, SqlFieldName = FCATD ];

Property IMPNOM As %String(EXTERNALSQLNAME = "IMPNOM", EXTERNALSQLTYPE = 1, MAXLEN = 1) [ Required, SqlColumnNumber = 37, SqlFieldName = IMPNOM ];

Property KORG As %Numeric(EXTERNALSQLNAME = "KORG", EXTERNALSQLTYPE = 3, MAXVAL = 999, MINVAL = -999, SCALE = 0) [ Required, SqlColumnNumber = 18, SqlFieldName = KORG ];

Property KORG12AS As %Numeric(EXTERNALSQLNAME = "KORG12AS", EXTERNALSQLTYPE = 3, MAXVAL = 999, MINVAL = -999, SCALE = 0) [ Required, SqlColumnNumber = 19, SqlFieldName = KORG12AS ];

Property LANAS As %String(EXTERNALSQLNAME = "LANAS", EXTERNALSQLTYPE = 1, MAXLEN = 1) [ Required, SqlColumnNumber = 12, SqlFieldName = LANAS ];

Property LIBFAS As %String(EXTERNALSQLNAME = "LIBFAS", EXTERNALSQLTYPE = 1, MAXLEN = 45) [ Required, SqlColumnNumber = 14, SqlFieldName = LIBFAS ];

Property LIBNAS As %String(EXTERNALSQLNAME = "LIBNAS", EXTERNALSQLTYPE = 1, MAXLEN = 45) [ Required, SqlColumnNumber = 15, SqlFieldName = LIBNAS ];

Property LNKSCH As %String(EXTERNALSQLNAME = "LNKSCH", EXTERNALSQLTYPE = 1, MAXLEN = 1) [ Required, SqlColumnNumber = 24, SqlFieldName = LNKSCH ];

Property LOCAS As %String(EXTERNALSQLNAME = "LOCAS", EXTERNALSQLTYPE = 1, MAXLEN = 30) [ Required, SqlColumnNumber = 10, SqlFieldName = LOCAS ];

Property MAILAS As %String(EXTERNALSQLNAME = "MAILAS", EXTERNALSQLTYPE = 1, MAXLEN = 50) [ Required, SqlColumnNumber = 13, SqlFieldName = MAILAS ];

Property MUTAS As %Numeric(EXTERNALSQLNAME = "MUTAS", EXTERNALSQLTYPE = 2, MAXVAL = 99999, MINVAL = -99999, SCALE = 0) [ Required, SqlColumnNumber = 2, SqlFieldName = MUTAS ];

Property NO2AS As %String(EXTERNALSQLNAME = "NO2AS", EXTERNALSQLTYPE = 1, MAXLEN = 30) [ Required, SqlColumnNumber = 4, SqlFieldName = NO2AS ];

Property NO2ASN As %String(EXTERNALSQLNAME = "NO2ASN", EXTERNALSQLTYPE = 1, MAXLEN = 30) [ Required, SqlColumnNumber = 6, SqlFieldName = NO2ASN ];

Property NOMAS As %String(EXTERNALSQLNAME = "NOMAS", EXTERNALSQLTYPE = 1, MAXLEN = 30) [ Required, SqlColumnNumber = 3, SqlFieldName = NOMAS ];

Property NOMASN As %String(EXTERNALSQLNAME = "NOMASN", EXTERNALSQLTYPE = 1, MAXLEN = 30) [ Required, SqlColumnNumber = 5, SqlFieldName = NOMASN ];

Property RES1AS As %String(EXTERNALSQLNAME = "RES1AS", EXTERNALSQLTYPE = 1, MAXLEN = 1) [ Required, SqlColumnNumber = 46, SqlFieldName = RES1AS ];

Property RES2AS As %String(EXTERNALSQLNAME = "RES2AS", EXTERNALSQLTYPE = 1, MAXLEN = 2) [ Required, SqlColumnNumber = 47, SqlFieldName = RES2AS ];

Property RES3AS As %String(EXTERNALSQLNAME = "RES3AS", EXTERNALSQLTYPE = 1, MAXLEN = 8) [ Required, SqlColumnNumber = 48, SqlFieldName = RES3AS ];

Property RES4AS As %String(EXTERNALSQLNAME = "RES4AS", EXTERNALSQLTYPE = 1, MAXLEN = 12) [ Required, SqlColumnNumber = 49, SqlFieldName = RES4AS ];

Property TELAS As %String(EXTERNALSQLNAME = "TELAS", EXTERNALSQLTYPE = 1, MAXLEN = 12) [ Required, SqlColumnNumber = 11, SqlFieldName = TELAS ];

Property TM14AS As %String(EXTERNALSQLNAME = "TM14AS", EXTERNALSQLTYPE = 1, MAXLEN = 1) [ Required, SqlColumnNumber = 28, SqlFieldName = TM14AS ];

Property TSPAS As %Numeric(EXTERNALSQLNAME = "TSPAS", EXTERNALSQLTYPE = 2, MAXVAL = 9, MINVAL = -9, SCALE = 0) [ Required, SqlColumnNumber = 27, SqlFieldName = TSPAS ];

Property TXATAS As %Numeric(EXTERNALSQLNAME = "TXATAS", EXTERNALSQLTYPE = 2, MAXVAL = 999, MINVAL = -999, SCALE = 0) [ Required, SqlColumnNumber = 40, SqlFieldName = TXATAS ];

Property TXFTAS As %Numeric(EXTERNALSQLNAME = "TXFTAS", EXTERNALSQLTYPE = 2, MAXVAL = 999, MINVAL = -999, SCALE = 0) [ Required, SqlColumnNumber = 38, SqlFieldName = TXFTAS ];

Property TYPAS As %Numeric(EXTERNALSQLNAME = "TYPAS", EXTERNALSQLTYPE = 2, MAXVAL = 9, MINVAL = -9, SCALE = 0) [ Required, SqlColumnNumber = 22, SqlFieldName = TYPAS ];

Index MainIndex On MUTAS [ IdKey, PrimaryKey ];

Parameter CONNECTION = "WISHTEST,NOCREATE";

Parameter EXTDBNAME = "DB2/400 SQL";

Parameter EXTERNALTABLENAME = "MEDCPOFBT.SASUR";

Storage GSQLStorage
{
<ExtentSize>100000</ExtentSize>
<StreamLocation>^CHUBXL.DB.WISH.SIGASSTS</StreamLocation>
<Type>%CacheSQLStorage</Type>
}

}
