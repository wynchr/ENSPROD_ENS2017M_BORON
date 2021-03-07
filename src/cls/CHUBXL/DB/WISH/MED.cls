Class CHUBXL.DB.WISH.MED Extends %Library.Persistent [ ClassType = persistent, Not ProcedureBlock, SqlRowIdPrivate, SqlTableName = MED, StorageStrategy = GSQLStorage ]
{

Property ADRM As %String(EXTERNALSQLNAME = "ADRM", EXTERNALSQLTYPE = 1, MAXLEN = 30) [ Required, SqlColumnNumber = 31, SqlFieldName = ADRM ];

Property APRO As %Numeric(EXTERNALSQLNAME = "APRO", EXTERNALSQLTYPE = 2, MAXVAL = 9, MINVAL = -9, SCALE = 0) [ Required, SqlColumnNumber = 24, SqlFieldName = APRO ];

Property BLCF As %Numeric(EXTERNALSQLNAME = "BLCF", EXTERNALSQLTYPE = 2, MAXVAL = 9, MINVAL = -9, SCALE = 0) [ Required, SqlColumnNumber = 37, SqlFieldName = BLCF ];

Property BQUA As %String(EXTERNALSQLNAME = "BQUA", EXTERNALSQLTYPE = 1, MAXLEN = 6) [ Required, SqlColumnNumber = 20, SqlFieldName = BQUA ];

Property BQUA2 As %String(EXTERNALSQLNAME = "BQUA2", EXTERNALSQLTYPE = 1, MAXLEN = 80) [ Required, SqlColumnNumber = 21, SqlFieldName = BQUA2 ];

Property BQUM As %Numeric(EXTERNALSQLNAME = "BQUM", EXTERNALSQLTYPE = 3, MAXVAL = 99999999999999, MINVAL = -99999999999999, SCALE = 0) [ Required, SqlColumnNumber = 33, SqlFieldName = BQUM ];

Property BSTQ As %String(EXTERNALSQLNAME = "BSTQ", EXTERNALSQLTYPE = 1, MAXLEN = 6) [ Required, SqlColumnNumber = 22, SqlFieldName = BSTQ ];

Property BSTQ2 As %String(EXTERNALSQLNAME = "BSTQ2", EXTERNALSQLTYPE = 1, MAXLEN = 80) [ Required, SqlColumnNumber = 23, SqlFieldName = BSTQ2 ];

Property CADH As %String(EXTERNALSQLNAME = "CADH", EXTERNALSQLTYPE = 1, MAXLEN = 2) [ Required, SqlColumnNumber = 46, SqlFieldName = CADH ];

Property CADP As %String(EXTERNALSQLNAME = "CADP", EXTERNALSQLTYPE = 1, MAXLEN = 2) [ Required, SqlColumnNumber = 47, SqlFieldName = CADP ];

Property CANM As %String(EXTERNALSQLNAME = "CANM", EXTERNALSQLTYPE = 1, MAXLEN = 9) [ Required, SqlColumnNumber = 38, SqlFieldName = CANM ];

Property CDTM As %String(EXTERNALSQLNAME = "CDTM", EXTERNALSQLTYPE = 1, MAXLEN = 3) [ Required, SqlColumnNumber = 43, SqlFieldName = CDTM ];

Property CENT As %String(EXTERNALSQLNAME = "CENT", EXTERNALSQLTYPE = 1, MAXLEN = 2) [ Required, SqlColumnNumber = 44, SqlFieldName = CENT ];

Property CHDM As %Numeric(EXTERNALSQLNAME = "CHDM", EXTERNALSQLTYPE = 3, MAXVAL = 99, MINVAL = -99, SCALE = 0) [ Required, SqlColumnNumber = 3, SqlFieldName = CHDM ];

Property CMDI As %Numeric(EXTERNALSQLNAME = "CMDI", EXTERNALSQLTYPE = 2, MAXVAL = 9, MINVAL = -9, SCALE = 0) [ Required, SqlColumnNumber = 48, SqlFieldName = CMDI ];

Property CMPR As %Numeric(EXTERNALSQLNAME = "CMPR", EXTERNALSQLTYPE = 2, MAXVAL = 9, MINVAL = -9, SCALE = 0) [ Required, SqlColumnNumber = 60, SqlFieldName = CMPR ];

Property CONV As %Numeric(EXTERNALSQLNAME = "CONV", EXTERNALSQLTYPE = 2, MAXVAL = 9, MINVAL = -9, SCALE = 0) [ Required, SqlColumnNumber = 25, SqlFieldName = CONV ];

Property CPAM As %String(EXTERNALSQLNAME = "CPAM", EXTERNALSQLTYPE = 1, MAXLEN = 3) [ Required, SqlColumnNumber = 67, SqlFieldName = CPAM ];

Property CPM As %String(EXTERNALSQLNAME = "CPM", EXTERNALSQLTYPE = 1, MAXLEN = 6) [ Required, SqlColumnNumber = 32, SqlFieldName = CPM ];

Property CPYP As %Numeric(EXTERNALSQLNAME = "CPYP", EXTERNALSQLTYPE = 2, MAXVAL = 9, MINVAL = -9, SCALE = 0) [ Required, SqlColumnNumber = 41, SqlFieldName = CPYP ];

Property CYCL As %Numeric(EXTERNALSQLNAME = "CYCL", EXTERNALSQLTYPE = 2, MAXVAL = 9, MINVAL = -9, SCALE = 0) [ Required, SqlColumnNumber = 39, SqlFieldName = CYCL ];

Property DAG1 As %Numeric(EXTERNALSQLNAME = "DAG1", EXTERNALSQLTYPE = 3, MAXVAL = 99999999, MINVAL = -99999999, SCALE = 0) [ Required, SqlColumnNumber = 6, SqlFieldName = DAG1 ];

Property DAG2 As %Numeric(EXTERNALSQLNAME = "DAG2", EXTERNALSQLTYPE = 3, MAXVAL = 99999999, MINVAL = -99999999, SCALE = 0) [ Required, SqlColumnNumber = 10, SqlFieldName = DAG2 ];

Property DAG3 As %Numeric(EXTERNALSQLNAME = "DAG3", EXTERNALSQLTYPE = 3, MAXVAL = 99999999, MINVAL = -99999999, SCALE = 0) [ Required, SqlColumnNumber = 14, SqlFieldName = DAG3 ];

Property DAG4 As %Numeric(EXTERNALSQLNAME = "DAG4", EXTERNALSQLTYPE = 3, MAXVAL = 99999999, MINVAL = -99999999, SCALE = 0) [ Required, SqlColumnNumber = 18, SqlFieldName = DAG4 ];

Property DDEC As %Numeric(EXTERNALSQLNAME = "DDEC", EXTERNALSQLTYPE = 3, MAXVAL = 99999999, MINVAL = -99999999, SCALE = 0) [ Required, SqlColumnNumber = 28, SqlFieldName = DDEC ];

Property DSUS As %Numeric(EXTERNALSQLNAME = "DSUS", EXTERNALSQLTYPE = 3, MAXVAL = 99999999, MINVAL = -99999999, SCALE = 0) [ Required, SqlColumnNumber = 27, SqlFieldName = DSUS ];

Property DTHRCR As %Numeric(EXTERNALSQLNAME = "DTHRCR", EXTERNALSQLTYPE = 3, MAXVAL = 99999999999999, MINVAL = -99999999999999, SCALE = 0) [ Required, SqlColumnNumber = 78, SqlFieldName = DTHRCR ];

Property DTHRUP As %Numeric(EXTERNALSQLNAME = "DTHRUP", EXTERNALSQLTYPE = 3, MAXVAL = 99999999999999, MINVAL = -99999999999999, SCALE = 0) [ Required, SqlColumnNumber = 80, SqlFieldName = DTHRUP ];

Property EPXM As %String(EXTERNALSQLNAME = "EPXM", EXTERNALSQLTYPE = 1, MAXLEN = 25) [ Required, SqlColumnNumber = 30, SqlFieldName = EPXM ];

Property HODT As %Numeric(EXTERNALSQLNAME = "HODT", EXTERNALSQLTYPE = 2, MAXVAL = 9, MINVAL = -9, SCALE = 0) [ Required, SqlColumnNumber = 35, SqlFieldName = HODT ];

Property IAEC As %Numeric(EXTERNALSQLNAME = "IAEC", EXTERNALSQLTYPE = 2, MAXVAL = 9, MINVAL = -9, SCALE = 0) [ Required, SqlColumnNumber = 42, SqlFieldName = IAEC ];

Property LETG As %String(EXTERNALSQLNAME = "LETG", EXTERNALSQLTYPE = 1, MAXLEN = 1) [ Required, SqlColumnNumber = 69, SqlFieldName = LETG ];

Property LMED As %String(EXTERNALSQLNAME = "LMED", EXTERNALSQLTYPE = 1, MAXLEN = 1) [ Required, SqlColumnNumber = 26, SqlFieldName = LMED ];

Property MAIL As %String(EXTERNALSQLNAME = "MAIL", EXTERNALSQLTYPE = 1, MAXLEN = 50) [ Required, SqlColumnNumber = 68, SqlFieldName = MAIL ];

Property MCPT As %Numeric(EXTERNALSQLNAME = "MCPT", EXTERNALSQLTYPE = 2, MAXVAL = 9, MINVAL = -9, SCALE = 0) [ Required, SqlColumnNumber = 62, SqlFieldName = MCPT ];

Property MDBIC As %String(EXTERNALSQLNAME = "MDBIC", EXTERNALSQLTYPE = 1, MAXLEN = 11) [ Required, SqlColumnNumber = 72, SqlFieldName = MDBIC ];

Property MDIBAN As %String(EXTERNALSQLNAME = "MDIBAN", EXTERNALSQLTYPE = 1, MAXLEN = 34) [ Required, SqlColumnNumber = 71, SqlFieldName = MDIBAN ];

Property MDNISS As %String(EXTERNALSQLNAME = "MDNISS", EXTERNALSQLTYPE = 1, MAXLEN = 11) [ Required, SqlColumnNumber = 70, SqlFieldName = MDNISS ];

Property MDRES1 As %String(EXTERNALSQLNAME = "MDRES1", EXTERNALSQLTYPE = 1, MAXLEN = 1) [ Required, SqlColumnNumber = 73, SqlFieldName = MDRES1 ];

Property MDRES2 As %String(EXTERNALSQLNAME = "MDRES2", EXTERNALSQLTYPE = 1, MAXLEN = 2) [ Required, SqlColumnNumber = 74, SqlFieldName = MDRES2 ];

Property MDRES3 As %String(EXTERNALSQLNAME = "MDRES3", EXTERNALSQLTYPE = 1, MAXLEN = 3) [ Required, SqlColumnNumber = 75, SqlFieldName = MDRES3 ];

Property MDRES4 As %String(EXTERNALSQLNAME = "MDRES4", EXTERNALSQLTYPE = 1, MAXLEN = 12) [ Required, SqlColumnNumber = 76, SqlFieldName = MDRES4 ];

Property MEPH As %String(EXTERNALSQLNAME = "MEPH", EXTERNALSQLTYPE = 1, MAXLEN = 6) [ Required, SqlColumnNumber = 34, SqlFieldName = MEPH ];

Property MFAX As %String(EXTERNALSQLNAME = "MFAX", EXTERNALSQLTYPE = 1, MAXLEN = 15) [ Required, SqlColumnNumber = 52, SqlFieldName = MFAX ];

Property MFRS As %String(EXTERNALSQLNAME = "MFRS", EXTERNALSQLTYPE = 1, MAXLEN = 9) [ Required, SqlColumnNumber = 59, SqlFieldName = MFRS ];

Property MMOB As %String(EXTERNALSQLNAME = "MMOB", EXTERNALSQLTYPE = 1, MAXLEN = 15) [ Required, SqlColumnNumber = 54, SqlFieldName = MMOB ];

Property MNAI As %String(EXTERNALSQLNAME = "MNAI", EXTERNALSQLTYPE = 1, MAXLEN = 8) [ Required, SqlColumnNumber = 55, SqlFieldName = MNAI ];

Property MPOO As %String(EXTERNALSQLNAME = "MPOO", EXTERNALSQLTYPE = 1, MAXLEN = 1) [ Required, SqlColumnNumber = 58, SqlFieldName = MPOO ];

Property MSEM As %String(EXTERNALSQLNAME = "MSEM", EXTERNALSQLTYPE = 1, MAXLEN = 15) [ Required, SqlColumnNumber = 53, SqlFieldName = MSEM ];

Property MSEX As %String(EXTERNALSQLNAME = "MSEX", EXTERNALSQLTYPE = 1, MAXLEN = 1) [ Required, SqlColumnNumber = 51, SqlFieldName = MSEX ];

Property MSUS As %String(EXTERNALSQLNAME = "MSUS", EXTERNALSQLTYPE = 1, MAXLEN = 2) [ Required, SqlColumnNumber = 57, SqlFieldName = MSUS ];

Property MTIT As %String(EXTERNALSQLNAME = "MTIT", EXTERNALSQLTYPE = 1, MAXLEN = 2) [ Required, SqlColumnNumber = 56, SqlFieldName = MTIT ];

Property MZL1 As %String(EXTERNALSQLNAME = "MZL1", EXTERNALSQLTYPE = 1, MAXLEN = 1) [ Required, SqlColumnNumber = 63, SqlFieldName = MZL1 ];

Property MZL2 As %String(EXTERNALSQLNAME = "MZL2", EXTERNALSQLTYPE = 1, MAXLEN = 1) [ Required, SqlColumnNumber = 64, SqlFieldName = MZL2 ];

Property MZL3 As %String(EXTERNALSQLNAME = "MZL3", EXTERNALSQLTYPE = 1, MAXLEN = 1) [ Required, SqlColumnNumber = 65, SqlFieldName = MZL3 ];

Property MZL4 As %String(EXTERNALSQLNAME = "MZL4", EXTERNALSQLTYPE = 1, MAXLEN = 10) [ Required, SqlColumnNumber = 66, SqlFieldName = MZL4 ];

Property NOMM As %String(EXTERNALSQLNAME = "NOMM", EXTERNALSQLTYPE = 1, MAXLEN = 40) [ Required, SqlColumnNumber = 29, SqlFieldName = NOMM ];

Property NRPI As %Numeric(EXTERNALSQLNAME = "NRPI", EXTERNALSQLTYPE = 3, MAXVAL = 999999, MINVAL = -999999, SCALE = 0) [ Required, SqlColumnNumber = 50, SqlFieldName = NRPI ];

Property NRPR As %Numeric(EXTERNALSQLNAME = "NRPR", EXTERNALSQLTYPE = 3, MAXVAL = 999999, MINVAL = -999999, SCALE = 0) [ Required, SqlColumnNumber = 2, SqlFieldName = NRPR ];

Property OCPT As %Numeric(EXTERNALSQLNAME = "OCPT", EXTERNALSQLTYPE = 2, MAXVAL = 9, MINVAL = -9, SCALE = 0) [ Required, SqlColumnNumber = 49, SqlFieldName = OCPT ];

Property PRCL As %String(EXTERNALSQLNAME = "PRCL", EXTERNALSQLTYPE = 1, MAXLEN = 25) [ Required, SqlColumnNumber = 61, SqlFieldName = PRCL ];

Property QIN1 As %Numeric(EXTERNALSQLNAME = "QIN1", EXTERNALSQLTYPE = 3, MAXVAL = 999, MINVAL = -999, SCALE = 0) [ Required, SqlColumnNumber = 4, SqlFieldName = QIN1 ];

Property QIN2 As %Numeric(EXTERNALSQLNAME = "QIN2", EXTERNALSQLTYPE = 3, MAXVAL = 999, MINVAL = -999, SCALE = 0) [ Required, SqlColumnNumber = 8, SqlFieldName = QIN2 ];

Property QIN3 As %Numeric(EXTERNALSQLNAME = "QIN3", EXTERNALSQLTYPE = 3, MAXVAL = 999, MINVAL = -999, SCALE = 0) [ Required, SqlColumnNumber = 12, SqlFieldName = QIN3 ];

Property QIN4 As %Numeric(EXTERNALSQLNAME = "QIN4", EXTERNALSQLTYPE = 3, MAXVAL = 999, MINVAL = -999, SCALE = 0) [ Required, SqlColumnNumber = 16, SqlFieldName = QIN4 ];

Property QPR1 As %String(EXTERNALSQLNAME = "QPR1", EXTERNALSQLTYPE = 1, MAXLEN = 2) [ Required, SqlColumnNumber = 5, SqlFieldName = QPR1 ];

Property QPR2 As %String(EXTERNALSQLNAME = "QPR2", EXTERNALSQLTYPE = 1, MAXLEN = 2) [ Required, SqlColumnNumber = 9, SqlFieldName = QPR2 ];

Property QPR3 As %String(EXTERNALSQLNAME = "QPR3", EXTERNALSQLTYPE = 1, MAXLEN = 2) [ Required, SqlColumnNumber = 13, SqlFieldName = QPR3 ];

Property QPR4 As %String(EXTERNALSQLNAME = "QPR4", EXTERNALSQLTYPE = 1, MAXLEN = 2) [ Required, SqlColumnNumber = 17, SqlFieldName = QPR4 ];

Property RAPL As %Numeric(EXTERNALSQLNAME = "RAPL", EXTERNALSQLTYPE = 2, MAXVAL = 9, MINVAL = -9, SCALE = 0) [ Required, SqlColumnNumber = 40, SqlFieldName = RAPL ];

Property SCDA As %String(EXTERNALSQLNAME = "SCDA", EXTERNALSQLTYPE = 1, MAXLEN = 5) [ Required, SqlColumnNumber = 45, SqlFieldName = SCDA ];

Property STS1 As %Numeric(EXTERNALSQLNAME = "STS1", EXTERNALSQLTYPE = 2, MAXVAL = 9, MINVAL = -9, SCALE = 0) [ Required, SqlColumnNumber = 7, SqlFieldName = STS1 ];

Property STS2 As %Numeric(EXTERNALSQLNAME = "STS2", EXTERNALSQLTYPE = 2, MAXVAL = 9, MINVAL = -9, SCALE = 0) [ Required, SqlColumnNumber = 11, SqlFieldName = STS2 ];

Property STS3 As %Numeric(EXTERNALSQLNAME = "STS3", EXTERNALSQLTYPE = 2, MAXVAL = 9, MINVAL = -9, SCALE = 0) [ Required, SqlColumnNumber = 15, SqlFieldName = STS3 ];

Property STS4 As %Numeric(EXTERNALSQLNAME = "STS4", EXTERNALSQLTYPE = 2, MAXVAL = 9, MINVAL = -9, SCALE = 0) [ Required, SqlColumnNumber = 19, SqlFieldName = STS4 ];

Property TELM As %String(EXTERNALSQLNAME = "TELM", EXTERNALSQLTYPE = 1, MAXLEN = 12) [ Required, SqlColumnNumber = 36, SqlFieldName = TELM ];

Property USERCR As %String(EXTERNALSQLNAME = "USERCR", EXTERNALSQLTYPE = 1, MAXLEN = 10) [ Required, SqlColumnNumber = 77, SqlFieldName = USERCR ];

Property USERUP As %String(EXTERNALSQLNAME = "USERUP", EXTERNALSQLTYPE = 1, MAXLEN = 10) [ Required, SqlColumnNumber = 79, SqlFieldName = USERUP ];

Index MainIndex On NRPR [ IdKey, PrimaryKey ];

Parameter CONNECTION = "WISHBRU,NOCREATE";

Parameter EXTDBNAME = "DB2/400 SQL";

Parameter EXTERNALTABLENAME = "MEDBRGFB.SMEDEC";

Storage GSQLStorage
{
<ExtentSize>100000</ExtentSize>
<StreamLocation>^CHUBXL.DB.WISH.MEDS</StreamLocation>
<Type>%CacheSQLStorage</Type>
}

}
