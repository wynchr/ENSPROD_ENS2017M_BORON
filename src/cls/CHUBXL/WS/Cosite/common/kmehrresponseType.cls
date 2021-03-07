/// Created from: http://10.29.15.250/2.0/Kmehr1/Services/production/1.0/Main.asmx?WSDL
Class CHUBXL.WS.Cosite.common.kmehrresponseType Extends (%Persistent, %XML.Adaptor) [ ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "http://tempuri.org";

Parameter XMLNAME = "kmehrresponseType";

Parameter XMLSEQUENCE = 1;

Property id As CHUBXL.WS.Cosite.common.id(XMLNAME = "id");

Property author As list Of CHUBXL.WS.Cosite.common.hcparty(XMLITEMNAME = "hcparty", XMLNAME = "author", XMLPROJECTION = "COLLECTION");

Property date As %Date(XMLNAME = "date") [ SqlFieldName = _date ];

Property time As %Time(XMLNAME = "time") [ SqlFieldName = _time ];

Property request As CHUBXL.WS.Cosite.common.kmehrrequest(XMLNAME = "request");

Storage Default
{
<Data name="kmehrresponseTypeDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>id</Value>
</Value>
<Value name="3">
<Value>author</Value>
</Value>
<Value name="4">
<Value>date</Value>
</Value>
<Value name="5">
<Value>time</Value>
</Value>
<Value name="6">
<Value>request</Value>
</Value>
</Data>
<DataLocation>^CHUBXL.WS54B2.kmehrrespon54ADD</DataLocation>
<DefaultData>kmehrresponseTypeDefaultData</DefaultData>
<IdLocation>^CHUBXL.WS54B2.kmehrrespon54ADD</IdLocation>
<IndexLocation>^CHUBXL.WS54B2.kmehrrespon54ADI</IndexLocation>
<StreamLocation>^CHUBXL.WS54B2.kmehrrespon54ADS</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}
