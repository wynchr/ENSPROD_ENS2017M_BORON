Class CHUBXL.MSG.HL7Dialyse Extends Ens.Request [ ClassType = persistent, ProcedureBlock ]
{

Property Message As %String(MAXLEN = 32000, TRUNCATE = 1);

Storage Default
{
<Data name="HL7DialyseDefaultData">
<Subscript>"HL7Dialyse"</Subscript>
<Value name="1">
<Value>Message</Value>
</Value>
</Data>
<DefaultData>HL7DialyseDefaultData</DefaultData>
<Type>%Library.CacheStorage</Type>
}

}
