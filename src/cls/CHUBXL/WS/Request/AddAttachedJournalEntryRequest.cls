Class CHUBXL.WS.Request.AddAttachedJournalEntryRequest Extends Ens.Request [ ClassType = persistent, ProcedureBlock ]
{

Parameter RESPONSECLASSNAME = "Response.AddAttachedJournalEntryResponse";

Property RequestInfo As CHUBXL.WS.HealthConnect.common.RequestInfoType;

Property AttachmentID As %xsd.base64Binary;

Property JournalType As %String;

Storage Default
{
<Data name="AddAttachedJournalEntryRequestDefaultData">
<Subscript>"AddAttachedJournalEntryRequest"</Subscript>
<Value name="1">
<Value>RequestInfo</Value>
</Value>
<Value name="2">
<Value>AttachmentID</Value>
</Value>
<Value name="3">
<Value>JournalType</Value>
</Value>
</Data>
<DefaultData>AddAttachedJournalEntryRequestDefaultData</DefaultData>
<Type>%Library.CacheStorage</Type>
}

}
