/// General request parameters.
/// Created from: http://brDocStampTest:8080/timestamping/services/JournalEntryService?xsd=common-1-0.xsd
Class CHUBXL.WS.HealthConnect.common.RequestInfoType Extends (%Persistent, %XML.Adaptor) [ ClassType = persistent, CompileAfter = CHUBXL.WS.HealthConnect.common.LanguageType, Inheritance = right, ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "urn:be:healthconnect:timestamping:ws:1_0:common";

Parameter XMLNAME = "RequestInfoType";

Parameter XMLSEQUENCE = 1;

/// Unique identifier added by the client application sending the request (optional element).
Property ClientMessageId As %String(MAXLEN = "", XMLNAME = "ClientMessageId");

/// Security token, identifing the application initiating the request (required element).
Property ApplicationToken As %String(MAXLEN = "", XMLNAME = "ApplicationToken") [ Required ];

/// Unique identifier of the end user initiating the request (optional element). Currently not used but added for compatibility reasons.
Property UserId As %String(MAXLEN = "", XMLNAME = "UserId");

/// Language. Currently not used but added for compatibility reasons.
Property Language As CHUBXL.WS.HealthConnect.common.LanguageType(XMLNAME = "Language") [ Required, SqlFieldName = _Language ];

Storage Default
{
<Data name="RequestInfoTypeDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>ClientMessageId</Value>
</Value>
<Value name="3">
<Value>ApplicationToken</Value>
</Value>
<Value name="4">
<Value>UserId</Value>
</Value>
<Value name="5">
<Value>Language</Value>
</Value>
</Data>
<DataLocation>^CHUBXL.WSDF32.RequestInfo20BFD</DataLocation>
<DefaultData>RequestInfoTypeDefaultData</DefaultData>
<IdLocation>^CHUBXL.WSDF32.RequestInfo20BFD</IdLocation>
<IndexLocation>^CHUBXL.WSDF32.RequestInfo20BFI</IndexLocation>
<StreamLocation>^CHUBXL.WSDF32.RequestInfo20BFS</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}
