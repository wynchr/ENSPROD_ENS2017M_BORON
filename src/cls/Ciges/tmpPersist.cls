Class Ciges.tmpPersist Extends %Persistent
{

Property emb As Ciges.tmpSerial;

Storage Default
{
<Data name="tmpPersistDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>emb</Value>
</Value>
</Data>
<DataLocation>^Ciges.tmpPersistD</DataLocation>
<DefaultData>tmpPersistDefaultData</DefaultData>
<ExtentSize>100000</ExtentSize>
<IdLocation>^Ciges.tmpPersistD</IdLocation>
<IndexLocation>^Ciges.tmpPersistI</IndexLocation>
<StreamLocation>^Ciges.tmpPersistS</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}
