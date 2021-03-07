Class CHUBXL.MSG.HL7MedecinFile Extends Ens.Request [ ClassType = persistent, ProcedureBlock ]
{

Property HL7 As EnsLib.HL7.Message;

Property File As %String;

Storage Default
{
<Data name="HL7MedecinFileDefaultData">
<Subscript>"HL7MedecinFile"</Subscript>
<Value name="1">
<Value>HL7</Value>
</Value>
<Value name="2">
<Value>File</Value>
</Value>
</Data>
<DefaultData>HL7MedecinFileDefaultData</DefaultData>
<Type>%Library.CacheStorage</Type>
}

}
