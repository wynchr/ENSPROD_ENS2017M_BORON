/// Created from: http://10.29.15.250/2.0/Kmehr1/Services/production/1.0/Main.asmx?WSDL
Class CHUBXL.WS.Cosite.common.address Extends (%Persistent, %XML.Adaptor) [ ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "http://tempuri.org";

Parameter XMLNAME = "address";

Parameter XMLSEQUENCE = 1;

Property cd As CHUBXL.WS.Cosite.common.cd(XMLNAME = "cd");

Property country As CHUBXL.WS.Cosite.common.cd(XMLNAME = "country", XMLPROJECTION = "WRAPPED");

Property zip As %String(MAXLEN = "", XMLNAME = "zip");

Property city As %String(MAXLEN = "", XMLNAME = "city");

Property street As %String(MAXLEN = "", XMLNAME = "street");

Property housenumber As %String(MAXLEN = "", XMLNAME = "housenumber");

Property text As CHUBXL.WS.Cosite.common.text(XMLNAME = "text");

Storage Default
{
<Data name="addressDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>cd</Value>
</Value>
<Value name="3">
<Value>country</Value>
</Value>
<Value name="4">
<Value>zip</Value>
</Value>
<Value name="5">
<Value>city</Value>
</Value>
<Value name="6">
<Value>street</Value>
</Value>
<Value name="7">
<Value>housenumber</Value>
</Value>
<Value name="8">
<Value>text</Value>
</Value>
</Data>
<DataLocation>^CHUBXL.WS.Cosite.c54B2.addressD</DataLocation>
<DefaultData>addressDefaultData</DefaultData>
<IdLocation>^CHUBXL.WS.Cosite.c54B2.addressD</IdLocation>
<IndexLocation>^CHUBXL.WS.Cosite.c54B2.addressI</IndexLocation>
<StreamLocation>^CHUBXL.WS.Cosite.c54B2.addressS</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}
