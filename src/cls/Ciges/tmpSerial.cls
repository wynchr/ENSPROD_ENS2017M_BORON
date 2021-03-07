Class Ciges.tmpSerial Extends (%SerialObject, %XML.Adaptor) [ Inheritance = right ]
{

Property str As %String;

Property obj As %GlobalCharacterStream;

Storage Default
{
<Data name="tmpSerialState">
<Value name="1">
<Value>str</Value>
</Value>
<Value name="2">
<Value>obj</Value>
</Value>
</Data>
<State>tmpSerialState</State>
<StreamLocation>^Ciges.tmpSerialS</StreamLocation>
<Type>%Library.CacheSerialState</Type>
}

}
