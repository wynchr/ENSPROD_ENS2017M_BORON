Class CHUBXL.DB.QDOC2.MVCIGESTEST Extends %Library.Persistent [ ClassType = persistent, Not ProcedureBlock, SqlRowIdPrivate, SqlTableName = MV_CIGES_TEST, StorageStrategy = GSQLStorage ]
{

Property DNAIS As %TimeStamp(EXTERNALSQLNAME = "DNAIS", EXTERNALSQLTYPE = 93) [ SqlColumnNumber = 5, SqlFieldName = DNAIS ];

Property NDOSM As %String(EXTERNALSQLNAME = "NDOSM", EXTERNALSQLTYPE = 12, MAXLEN = 11) [ SqlColumnNumber = 2, SqlFieldName = NDOSM ];

Property NOM As %String(EXTERNALSQLNAME = "NOM", EXTERNALSQLTYPE = 12, MAXLEN = 50) [ SqlColumnNumber = 3, SqlFieldName = NOM ];

Property PRENOM As %String(EXTERNALSQLNAME = "PRENOM", EXTERNALSQLTYPE = 12, MAXLEN = 50) [ SqlColumnNumber = 4, SqlFieldName = PRENOM ];

Property SERVICE As %String(EXTERNALSQLNAME = "SERVICE", EXTERNALSQLTYPE = 12, MAXLEN = 30) [ SqlColumnNumber = 7, SqlFieldName = SERVICE ];

Property SEXE As %String(EXTERNALSQLNAME = "SEXE", EXTERNALSQLTYPE = 12, MAXLEN = 1) [ SqlColumnNumber = 6, SqlFieldName = SEXE ];

Property TYPEDOS As %String(EXTERNALSQLNAME = "TYPEDOS", EXTERNALSQLTYPE = 12, MAXLEN = 50) [ SqlColumnNumber = 8, SqlFieldName = TYPEDOS ];

Index MainIndex On (NDOSM, SERVICE) [ IdKey, PrimaryKey ];

Parameter CONNECTION = "QDOC2,NOCREATE";

Parameter EXTDBNAME = "Oracle";

Parameter EXTERNALTABLENAME = "SYSADM.MV_CIGES_TEST";

Storage GSQLStorage
{
<ExtentSize>100000</ExtentSize>
<StreamLocation>^CHUBXL.DB.QDOC2.MVCIGESTESTS</StreamLocation>
<Type>%CacheSQLStorage</Type>
}

}
