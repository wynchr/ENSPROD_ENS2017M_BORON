Class CHUBXL.WS.Cosite.common.request Extends (%Persistent, %XML.Adaptor) [ ClassType = persistent, Inheritance = right, ProcedureBlock ]
{

Parameter NAMESPACE = "http://tempuri.org";

Parameter ELEMENTQUALIFIED = 1;

Parameter XMLNAME = "request";

Parameter XMLSEQUENCE = 3;

Property author As CHUBXL.WS.Cosite.common.author;

Property date As %String(MAXLEN = "", XMLNAME = "date");

Property time As %String(MAXLEN = "", XMLNAME = "time");

Property maxrows As %String(MAXLEN = "", XMLNAME = "maxrows");

ClassMethod saveMessage(pMessage As %Stream, pObj As CHUBXL.WS.Cosite.common.request) As %Status
{
	
	s pObj=..%New(),CrLf=$c(13)_$c(10)
	
	s pObj.date="kl"
	
	s pObj.TimeoutEnSecondes=30
	q $$$OK
}

Storage Default
{
<Data name="requestDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>author</Value>
</Value>
<Value name="3">
<Value>date</Value>
</Value>
<Value name="4">
<Value>time</Value>
</Value>
<Value name="5">
<Value>maxrows</Value>
</Value>
</Data>
<DataLocation>^CHUBXL.WS.Cosite.c54B2.requestD</DataLocation>
<DefaultData>requestDefaultData</DefaultData>
<IdLocation>^CHUBXL.WS.Cosite.c54B2.requestD</IdLocation>
<IndexLocation>^CHUBXL.WS.Cosite.c54B2.requestI</IndexLocation>
<StreamLocation>^CHUBXL.WS.Cosite.c54B2.requestS</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}
