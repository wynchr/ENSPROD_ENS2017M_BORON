Class CHUBXL.WS.Request.AddJournalEntryRequest Extends Ens.Request [ ClassType = persistent, ProcedureBlock ]
{

Parameter RESPONSECLASSNAME = "Response.AddJournalEntryResponse";

Property RequestInfo As CHUBXL.WS.HealthConnect.common.RequestInfoType;

Property Data As %xsd.base64Binary;

Property JournalType As %String;

Storage Default
{
<Data name="AddJournalEntryRequestDefaultData">
<Subscript>"AddJournalEntryRequest"</Subscript>
<Value name="1">
<Value>RequestInfo</Value>
</Value>
<Value name="2">
<Value>Data</Value>
</Value>
<Value name="3">
<Value>JournalType</Value>
</Value>
</Data>
<DefaultData>AddJournalEntryRequestDefaultData</DefaultData>
<Type>%Library.CacheStorage</Type>
}

}
