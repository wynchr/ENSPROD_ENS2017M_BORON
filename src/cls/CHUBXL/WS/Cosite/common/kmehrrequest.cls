/// Created from: http://10.29.15.250/2.0/Kmehr1/Services/production/1.0/Main.asmx?WSDL
Class CHUBXL.WS.Cosite.common.kmehrrequest Extends (%Persistent, %XML.Adaptor) [ ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "http://tempuri.org";

Parameter XMLNAME = "kmehrrequest";

Parameter XMLSEQUENCE = 1;

Property id As CHUBXL.WS.Cosite.common.id(XMLNAME = "id");

Property author As list Of CHUBXL.WS.Cosite.common.hcparty(XMLITEMNAME = "hcparty", XMLNAME = "author", XMLPROJECTION = "COLLECTION");

Property patient As CHUBXL.WS.Cosite.common.person(XMLNAME = "patient");

Property date As %String(XMLNAME = "date") [ SqlFieldName = _date ];

Property time As %String(XMLNAME = "time") [ SqlFieldName = _time ];

Property maxrows As %Numeric(XMLNAME = "maxrows");

Storage Default
{
<Data name="kmehrrequestDefaultData">
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
<Value>patient</Value>
</Value>
<Value name="5">
<Value>date</Value>
</Value>
<Value name="6">
<Value>time</Value>
</Value>
<Value name="7">
<Value>maxrows</Value>
</Value>
</Data>
<DataLocation>^CHUBXL.WS.Cos54B2.kmehrrequestD</DataLocation>
<DefaultData>kmehrrequestDefaultData</DefaultData>
<IdLocation>^CHUBXL.WS.Cos54B2.kmehrrequestD</IdLocation>
<IndexLocation>^CHUBXL.WS.Cos54B2.kmehrrequestI</IndexLocation>
<StreamLocation>^CHUBXL.WS.Cos54B2.kmehrrequestS</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}
