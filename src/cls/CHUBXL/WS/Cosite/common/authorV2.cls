/// Created from: http://10.29.15.250/2.0/Kmehr1/Services/production/1.0/Main.asmx?WSDL
Class CHUBXL.WS.Cosite.common.authorV2 Extends (%Persistent, %XML.Adaptor) [ ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "http://tempuri.org";

Parameter XMLNAME = "authorV2";

Parameter XMLSEQUENCE = 1;

Property hcparty As list Of CHUBXL.WS.Cosite.common.hcparty(XMLNAME = "hcparty", XMLPROJECTION = "ELEMENT");

Property patient As list Of CHUBXL.WS.Cosite.common.person(XMLNAME = "patient", XMLPROJECTION = "ELEMENT");

Storage Default
{
<Data name="authorV2DefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>hcparty</Value>
</Value>
<Value name="3">
<Value>patient</Value>
</Value>
</Data>
<DataLocation>^CHUBXL.WS.Cosite54B2.authorV2D</DataLocation>
<DefaultData>authorV2DefaultData</DefaultData>
<IdLocation>^CHUBXL.WS.Cosite54B2.authorV2D</IdLocation>
<IndexLocation>^CHUBXL.WS.Cosite54B2.authorV2I</IndexLocation>
<StreamLocation>^CHUBXL.WS.Cosite54B2.authorV2S</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}
