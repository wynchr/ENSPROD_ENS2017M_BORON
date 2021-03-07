/// Status of the response message.
/// Created from: http://brDocStampTest:8080/timestamping/services/JournalEntryService?xsd=common-1-0.xsd
Class CHUBXL.WS.HealthConnect.common.ResponseInfoType Extends (%Persistent, %XML.Adaptor) [ ClassType = persistent, CompileAfter = , Inheritance = right, ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "urn:be:healthconnect:timestamping:ws:1_0:common";

Parameter XMLNAME = "ResponseInfoType";

Parameter XMLSEQUENCE = 1;

/// Status code of the response.
Property Code As %String(MAXLEN = "", XMLNAME = "Code") [ Required ];

/// Description of the status code.
Property Message As %String(MAXLEN = "", XMLNAME = "Message") [ Required ];

/// Unique identifier added by the client application sending the request and returned in the response message (optional element).
Property ClientMessageId As %String(MAXLEN = "", XMLNAME = "ClientMessageId");

/// Unique identifier of the message, generated and added by the Timestamping service.
Property MessageId As %String(MAXLEN = "", XMLNAME = "MessageId") [ Required ];

Storage Default
{
<Data name="ResponseInfoTypeDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Code</Value>
</Value>
<Value name="3">
<Value>Message</Value>
</Value>
<Value name="4">
<Value>ClientMessageId</Value>
</Value>
<Value name="5">
<Value>MessageId</Value>
</Value>
</Data>
<DataLocation>^CHUBXL.WSDF32.ResponseInfAF5CD</DataLocation>
<DefaultData>ResponseInfoTypeDefaultData</DefaultData>
<IdLocation>^CHUBXL.WSDF32.ResponseInfAF5CD</IdLocation>
<IndexLocation>^CHUBXL.WSDF32.ResponseInfAF5CI</IndexLocation>
<StreamLocation>^CHUBXL.WSDF32.ResponseInfAF5CS</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}
