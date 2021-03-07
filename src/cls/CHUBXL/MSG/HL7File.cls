Class CHUBXL.MSG.HL7File Extends Ens.Request [ ClassType = persistent, ProcedureBlock ]
{

Property HL7 As EnsLib.HL7.Message;

Property File As %GlobalCharacterStream;

Storage Default
{
<Data name="HL7FileDefaultData">
<Subscript>"HL7File"</Subscript>
<Value name="1">
<Value>HL7</Value>
</Value>
<Value name="2">
<Value>File</Value>
</Value>
</Data>
<DefaultData>HL7FileDefaultData</DefaultData>
<Type>%Library.CacheStorage</Type>
}

}
