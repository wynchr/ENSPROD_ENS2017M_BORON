Class Ciges.TStamp Extends %RegisteredObject
{

Property dateModification As %TimeStamp;

Property dateCreation As %TimeStamp;

Property userCreation As Application.Profile.UserId;

Property userModification As Application.Profile.UserId;

/// Fournit le time stamp de modification en utilisant un sql embedded.
/// permet de vérifier la correspondance de la date de modification par rapport à un objet 
/// en mémoire
ClassMethod getdateModification(id As %String) As %String [ CodeMode = objectgenerator ]
{
	s tableName=$select(%compiledclass.SqlQualifiedNameQ'="":%compiledclass.SqlQualifiedNameQ,1:%class.Name)
	if (tableName'="Ciges.TStamp") {
		d %code.WriteLine(" s ts="""" ")
		d %code.WriteLine(" &sql(select dateModification into :ts from "_tableName_" where ID=:id )" )
		d %code.WriteLine(" q ts ")
	}
	q $$$OK
}

ClassMethod getTSColNbr() As %Integer [ CodeMode = objectgenerator ]
{
	
	s rs=##class(%ResultSet).%New("%Library.SQLCatalog.SQLFields")
	s tableName=$select(%class.SqlTableName'="":$P(%class.Name,".",1)_"."_%class.SqlTableName,1:%class.Name)
	d %code.WriteLine(" /// searched "_tableName)
	d rs.Execute(tableName)
	s row=0
	while rs.Next() {
		if (rs.GetData(1)="dateModification") {
			s row=rs.GetData(3)
		}
	}
	d %code.WriteLine(" Q "_row)
	d rs.Close()
	q $$$OK
}

ClassMethod getUserColNbr() As %Integer [ CodeMode = objectgenerator ]
{
	
	s rs=##class(%ResultSet).%New("%Library.SQLCatalog.SQLFields")
	s tableName=$select(%class.SqlTableName'="":$P(%class.Name,".",1)_"."_%class.SqlTableName,1:%class.Name)
	d %code.WriteLine(" /// searched "_tableName)
	d rs.Execute(tableName)
	s row=0
	while rs.Next() {
		if (rs.GetData(1)="userModification") {
			s row=rs.GetData(3)
		}
	}
	d %code.WriteLine(" Q "_row)
	d rs.Close()
	q $$$OK
}

Trigger insTstampTrigger [ Event = INSERT ]
{
	if ('$D(^Ciges.NoStamp))&&('$D(^||Ciges.NoStamp)) { // on peut éviter la génération automatique avec deux entrées de globales (system-wide ou job-only)
		s {dateModification}=$ZDATETIME($H,3,1)
		s {dateCreation}=$ZDATETIME($H,3,1)
		if ($G(%session)'="") {
			if ($G(%session.Data("USER","ID"))'="") {
				s {userModification}=%session.Data("USER","ID")
				s {userCreation}=%session.Data("USER","ID")
			}
		}
	} // :todo: remove line after load
}

Method %OnAddToSaveSet(depth As %Integer = 3, insert As %Integer = 0, callcount As %Integer = 0) As %Status [ Private ]
{
	q ..onAddToSaveSetTStamp(depth, insert , callcount)
}

Method onAddToSaveSetTStamp(depth As %Integer = 3, insert As %Integer = 0, callcount As %Integer = 0) As %Status
{
	if ('$D(^Ciges.NoStamp))&&('$D(^||Ciges.NoStamp)) { // on peut éviter la génération automatique avec deux entrées de globales (system-wide ou job-only)
		if (..%IsModified()) {
			s ..dateModification=$ZDATETIME($H,3,1)
			if (insert) {
				s ..dateCreation=$ZDATETIME($H,3,1)
			}
			if ($G(%session)'="") {
				if ($G(%session.Data("USER","ID"))'="") {
					d ..userModificationSetObjectId(%session.Data("USER","ID"))
					if (insert) {
						d ..userCreationSetObjectId(%session.Data("USER","ID"))
					}
				}
			}
		}	
	} // :todo: remove line after load
	q $$$OK
}

Trigger updTstampTrigger [ Event = UPDATE ]
{
	
	TRY{
		s cl=##class({%%CLASSNAME}).%ClassName(1)
		s row=0
		if ('$D(^Ciges.NoStamp))&&('$D(^||Ciges.NoStamp)) { // on peut éviter la génération automatique avec deux entrées de globales (system-wide ou job-only)
			s row=$ZOBJCLASSMETHOD(cl,"getTSColNbr")
			if (row'=0) {
				s %d(row)=$ZDATETIME($H,3,1)
				s $E(%e,row)=$C(1)
	
			}
			s row=0
			s row=$ZOBJCLASSMETHOD(cl,"getUserColNbr")
			if (row'=0) {
				if ($G(%session)'="") {
					if ($G(%session.Data("USER","ID"))'="") {
						s %d(row)=%session.Data("USER","ID")
						s $E(%e,row)=$C(1)
					}
				}
			}
		} // :todo: remove line after load
		q
   }
   CATCH{
	q
   }
}

Storage Default
{
<Data name="TStampDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>dateCreation</Value>
</Value>
<Value name="3">
<Value>dateModification</Value>
</Value>
<Value name="4">
<Value>userCreation</Value>
</Value>
<Value name="5">
<Value>userModification</Value>
</Value>
</Data>
<DataLocation>^Ciges.TStampD</DataLocation>
<DefaultData>TStampDefaultData</DefaultData>
<ExtentSize>100000</ExtentSize>
<IdLocation>^Ciges.TStampD</IdLocation>
<IndexLocation>^Ciges.TStampI</IndexLocation>
<StreamLocation>^Ciges.TStampS</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}
