/// Sauvegarde des erreurs CSP
Class Ciges.CspErrorLog Extends (%Persistent, Ciges.TStamp)
{

Property data As %GlobalCharacterStream;

Index dCreation On dateCreation;

Method log(key As %String = "", value As %String = "")
{
 if ((key'="")&&(value'="")){
  s length=$LENGTH(key)
  s jLength=30
  s:length>=jLength jLength=60
  d ..data.WriteLine(key_$JUSTIFY("",jLength-length)_" : "_value)	 
 }
 else{
  d:key="" ..data.WriteLine(value)
  d:value="" ..data.WriteLine(key)
 }
}

ClassMethod exportToFile(id As %String, filename As %String)
{
 s file=##class(%FileCharacterStream).%New()	
 s file.Filename=filename
 
 s log=..%OpenId(id)
 q:'$ISOBJECT(log)
 
 d file.CopyFrom(log.data)
 d file.SaveStream()
}

ClassMethod purge() As %Status
{
 s rs=##class(%ResultSet).%New("Ciges.CspErrorLog:getByDCreation")
 d rs.Execute($SYSTEM.SQL.DATEADD("dd",-1,$ZD($H,3)_" 23:59:59"))
 while rs.Next() {
  d ##class(Ciges.CspErrorLog).%DeleteId(rs.Data("ID"))
 }
 d rs.Close()
}

Query getByDCreation(datePurge As %TimeStamp) As %SQLQuery(CONTAINID = 1)
{
SELECT ID FROM Ciges.CspErrorLog WHERE dateCreation <= :datePurge
}

Query getByDate(dStart As %TimeStamp, dEnd As %TimeStamp) As %SQLQuery(CONTAINID = 1)
{
SELECT * FROM Ciges.CspErrorLog WHERE dateCreation BETWEEN :dStart AND :dEnd
}

Storage Default
{
<Data name="CspErrorLogDefaultData">
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
<Value>html</Value>
</Value>
<Value name="5">
<Value>userCreation</Value>
</Value>
<Value name="6">
<Value>userModification</Value>
</Value>
<Value name="7">
<Value>data</Value>
</Value>
</Data>
<DataLocation>^Ciges.CspErrorLogD</DataLocation>
<DefaultData>CspErrorLogDefaultData</DefaultData>
<ExtentSize>100000</ExtentSize>
<IdLocation>^Ciges.CspErrorLogD</IdLocation>
<IndexLocation>^Ciges.CspErrorLogI</IndexLocation>
<StreamLocation>^Ciges.CspErrorLogS</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}
