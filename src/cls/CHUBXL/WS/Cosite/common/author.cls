Class CHUBXL.WS.Cosite.common.author Extends (%Persistent, %XML.Adaptor) [ ClassType = persistent, Inheritance = right, ProcedureBlock ]
{

Parameter NAMESPACE = "http://tempuri.org";

Parameter ELEMENTQUALIFIED = 1;

Parameter XMLNAME = "author";

Parameter XMLSEQUENCE = 4;

Property hcparty As CHUBXL.WS.Cosite.common.hcparty;

Property hcparty1 As CHUBXL.WS.Cosite.common.hcparty;

Storage Default
{
<Data name="authorDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>hcparty</Value>
</Value>
<Value name="3">
<Value>hcparty1</Value>
</Value>
</Data>
<DataLocation>^CHUBXL.WS.Cosite.co54B2.authorD</DataLocation>
<DefaultData>authorDefaultData</DefaultData>
<IdLocation>^CHUBXL.WS.Cosite.co54B2.authorD</IdLocation>
<IndexLocation>^CHUBXL.WS.Cosite.co54B2.authorI</IndexLocation>
<StreamLocation>^CHUBXL.WS.Cosite.co54B2.authorS</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}
