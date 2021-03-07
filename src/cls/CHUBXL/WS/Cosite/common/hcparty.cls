/// Created from: http://10.29.15.250/2.0/Kmehr1/Services/production/1.0/Main.asmx?WSDL
Class CHUBXL.WS.Cosite.common.hcparty Extends (%Persistent, %XML.Adaptor) [ ClassType = persistent, Inheritance = right, ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "http://tempuri.org";

Parameter XMLNAME = "hcparty";

Parameter XMLSEQUENCE = 1;

Property id As list Of CHUBXL.WS.Cosite.common.id(XMLNAME = "id", XMLPROJECTION = "ELEMENT");

Property cd As list Of CHUBXL.WS.Cosite.common.cd(XMLNAME = "cd", XMLPROJECTION = "ELEMENT");

Property firstname As %String(MAXLEN = "", XMLNAME = "firstname");

Property familyname As %String(MAXLEN = "", XMLNAME = "familyname");

Property name As %String(MAXLEN = "", XMLNAME = "name");

Property address As list Of CHUBXL.WS.Cosite.common.address(XMLNAME = "address", XMLPROJECTION = "ELEMENT");

Property telecom As list Of CHUBXL.WS.Cosite.common.telecom(XMLNAME = "telecom", XMLPROJECTION = "ELEMENT");

Property recorddatetime As %TimeStamp(XMLNAME = "recorddatetime");

Storage Default
{
<Data name="hcpartyDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>id</Value>
</Value>
<Value name="3">
<Value>cd</Value>
</Value>
<Value name="4">
<Value>firstname</Value>
</Value>
<Value name="5">
<Value>familyname</Value>
</Value>
<Value name="6">
<Value>name</Value>
</Value>
<Value name="7">
<Value>address</Value>
</Value>
<Value name="8">
<Value>telecom</Value>
</Value>
<Value name="9">
<Value>recorddatetime</Value>
</Value>
</Data>
<DataLocation>^CHUBXL.WS.Cosite.c54B2.hcpartyD</DataLocation>
<DefaultData>hcpartyDefaultData</DefaultData>
<IdLocation>^CHUBXL.WS.Cosite.c54B2.hcpartyD</IdLocation>
<IndexLocation>^CHUBXL.WS.Cosite.c54B2.hcpartyI</IndexLocation>
<StreamLocation>^CHUBXL.WS.Cosite.c54B2.hcpartyS</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}
