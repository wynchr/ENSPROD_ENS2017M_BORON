Class CHUBXL.DB.GLIMS.ENCOUNTER Extends %Library.Persistent [ ClassType = persistent, Not ProcedureBlock, SqlRowIdPrivate, SqlTableName = ENCOUNTER ]
{

Parameter CONNECTION = "GLIMS,NOCREATE";

Parameter EXTDBNAME = "Oracle";

Parameter EXTERNALTABLENAME = "ORAGLIMS.ENCOUNTER";

Property ENCTAUTOMATIC As %Float(EXTERNALSQLNAME = "ENCT_AUTOMATIC", EXTERNALSQLTYPE = 6) [ Required, SqlColumnNumber = 18, SqlFieldName = ENCT_AUTOMATIC ];

Property ENCTCREATIONTIME As %Numeric(EXTERNALSQLNAME = "ENCT_CREATIONTIME", EXTERNALSQLTYPE = 3, MAXVAL = 99999999999999999.999999, MINVAL = -99999999999999999.999999, SCALE = 6) [ SqlColumnNumber = 15, SqlFieldName = ENCT_CREATIONTIME ];

Property ENCTCREATIONUSER As %Float(EXTERNALSQLNAME = "ENCT_CREATIONUSER", EXTERNALSQLTYPE = 6) [ SqlColumnNumber = 13, SqlFieldName = ENCT_CREATIONUSER ];

Property ENCTDIAGNOSIS As %String(EXTERNALSQLNAME = "ENCT_DIAGNOSIS", EXTERNALSQLTYPE = 12, MAXLEN = 3999) [ SqlColumnNumber = 17, SqlFieldName = ENCT_DIAGNOSIS ];

Property ENCTENDTIME As %Numeric(EXTERNALSQLNAME = "ENCT_ENDTIME", EXTERNALSQLTYPE = 3, MAXVAL = 99999999999999999.999999, MINVAL = -99999999999999999.999999, SCALE = 6) [ SqlColumnNumber = 11, SqlFieldName = ENCT_ENDTIME ];

Property ENCTEXTERNALID As %String(EXTERNALSQLNAME = "ENCT_EXTERNALID", EXTERNALSQLTYPE = 12, MAXLEN = 20) [ SqlColumnNumber = 6, SqlFieldName = ENCT_EXTERNALID ];

Property ENCTEXTERNALINFO As %String(EXTERNALSQLNAME = "ENCT_EXTERNALINFO", EXTERNALSQLTYPE = 12, MAXLEN = 240) [ SqlColumnNumber = 8, SqlFieldName = ENCT_EXTERNALINFO ];

Property ENCTID As %Float(EXTERNALSQLNAME = "ENCT_ID", EXTERNALSQLTYPE = 6) [ Required, SqlColumnNumber = 2, SqlFieldName = ENCT_ID ];

Property ENCTINSTITUTION As %Float(EXTERNALSQLNAME = "ENCT_INSTITUTION", EXTERNALSQLTYPE = 6) [ Required, SqlColumnNumber = 4, SqlFieldName = ENCT_INSTITUTION ];

Property ENCTLASTUPDATETIME As %Numeric(EXTERNALSQLNAME = "ENCT_LASTUPDATETIME", EXTERNALSQLTYPE = 3, MAXVAL = 99999999999999999.999999, MINVAL = -99999999999999999.999999, SCALE = 6) [ SqlColumnNumber = 16, SqlFieldName = ENCT_LASTUPDATETIME ];

Property ENCTLASTUPDATEUSER As %Float(EXTERNALSQLNAME = "ENCT_LASTUPDATEUSER", EXTERNALSQLTYPE = 6) [ SqlColumnNumber = 14, SqlFieldName = ENCT_LASTUPDATEUSER ];

Property ENCTPERSON As %Float(EXTERNALSQLNAME = "ENCT_PERSON", EXTERNALSQLTYPE = 6) [ Required, SqlColumnNumber = 3, SqlFieldName = ENCT_PERSON ];

Property ENCTPHYSICIAN As %Float(EXTERNALSQLNAME = "ENCT_PHYSICIAN", EXTERNALSQLTYPE = 6) [ SqlColumnNumber = 9, SqlFieldName = ENCT_PHYSICIAN ];

Property ENCTSTARTTIME As %Numeric(EXTERNALSQLNAME = "ENCT_STARTTIME", EXTERNALSQLTYPE = 3, MAXVAL = 99999999999999999.999999, MINVAL = -99999999999999999.999999, SCALE = 6) [ SqlColumnNumber = 10, SqlFieldName = ENCT_STARTTIME ];

Property ENCTTYPE As %Float(EXTERNALSQLNAME = "ENCT_TYPE", EXTERNALSQLTYPE = 6) [ Required, SqlColumnNumber = 7, SqlFieldName = ENCT_TYPE ];

Property ENCTVERSION As %Float(EXTERNALSQLNAME = "ENCT_VERSION", EXTERNALSQLTYPE = 6) [ SqlColumnNumber = 12, SqlFieldName = ENCT_VERSION ];

Property UENCTEXTERNALID As %String(EXTERNALSQLNAME = "U##ENCT_EXTERNALID", EXTERNALSQLTYPE = 12, MAXLEN = 20) [ SqlColumnNumber = 5, SqlFieldName = U##ENCT_EXTERNALID ];

Index MainIndex On ENCTID [ IdKey, PrimaryKey ];

Storage Default
{
<Data name="ENCOUNTERDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>ENCTAUTOMATIC</Value>
</Value>
<Value name="3">
<Value>ENCTCREATIONTIME</Value>
</Value>
<Value name="4">
<Value>ENCTCREATIONUSER</Value>
</Value>
<Value name="5">
<Value>ENCTDIAGNOSIS</Value>
</Value>
<Value name="6">
<Value>ENCTENDTIME</Value>
</Value>
<Value name="7">
<Value>ENCTEXTERNALID</Value>
</Value>
<Value name="8">
<Value>ENCTEXTERNALINFO</Value>
</Value>
<Value name="9">
<Value>ENCTINSTITUTION</Value>
</Value>
<Value name="10">
<Value>ENCTLASTUPDATETIME</Value>
</Value>
<Value name="11">
<Value>ENCTLASTUPDATEUSER</Value>
</Value>
<Value name="12">
<Value>ENCTPERSON</Value>
</Value>
<Value name="13">
<Value>ENCTPHYSICIAN</Value>
</Value>
<Value name="14">
<Value>ENCTSTARTTIME</Value>
</Value>
<Value name="15">
<Value>ENCTTYPE</Value>
</Value>
<Value name="16">
<Value>ENCTVERSION</Value>
</Value>
<Value name="17">
<Value>UENCTEXTERNALID</Value>
</Value>
</Data>
<DataLocation>^CHUBXL.DB.GLIMS.ENCOUNTERD</DataLocation>
<DefaultData>ENCOUNTERDefaultData</DefaultData>
<IdLocation>^CHUBXL.DB.GLIMS.ENCOUNTERD</IdLocation>
<IndexLocation>^CHUBXL.DB.GLIMS.ENCOUNTERI</IndexLocation>
<StreamLocation>^CHUBXL.DB.GLIMS.ENCOUNTERS</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}
