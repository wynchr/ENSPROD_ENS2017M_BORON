/// Created from: http://10.29.15.250/2.0/Kmehr1/Services/production/1.0/Main.asmx?WSDL
Class CHUBXL.WS.Cosite.common.person Extends (%Persistent, %XML.Adaptor) [ ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "http://tempuri.org";

Parameter XMLNAME = "person";

Parameter XMLSEQUENCE = 1;

Property id As list Of CHUBXL.WS.Cosite.common.id(XMLNAME = "id", XMLPROJECTION = "ELEMENT");

Property firstname As %String(MAXLEN = "", XMLNAME = "firstname");

Property familyname As %String(MAXLEN = "", XMLNAME = "familyname");

Property birthdate As CHUBXL.WS.Cosite.common.birthdate(XMLNAME = "birthdate");

Property deathdate As CHUBXL.WS.Cosite.common.birthdate(XMLNAME = "deathdate");

Property sex As CHUBXL.WS.Cosite.common.cd(XMLNAME = "sex", XMLPROJECTION = "WRAPPED");

Property address As list Of CHUBXL.WS.Cosite.common.address(XMLNAME = "address", XMLPROJECTION = "ELEMENT");

Property telecom As list Of CHUBXL.WS.Cosite.common.telecom(XMLNAME = "telecom", XMLPROJECTION = "ELEMENT");

Property usuallanguage As %String(MAXLEN = "", XMLNAME = "usuallanguage");

Property insurability As list Of CHUBXL.WS.Cosite.common.insurability(XMLNAME = "insurability", XMLPROJECTION = "ELEMENT");

Property recorddatetime As %TimeStamp(XMLNAME = "recorddatetime");

Property text As array Of %String(MAXLEN = "", XMLKEYNAME = "L", XMLNAME = "text", XMLPROJECTION = "ELEMENT");

Storage Default
{
<Data name="personDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>id</Value>
</Value>
<Value name="3">
<Value>firstname</Value>
</Value>
<Value name="4">
<Value>familyname</Value>
</Value>
<Value name="5">
<Value>birthdate</Value>
</Value>
<Value name="6">
<Value>deathdate</Value>
</Value>
<Value name="7">
<Value>sex</Value>
</Value>
<Value name="8">
<Value>address</Value>
</Value>
<Value name="9">
<Value>telecom</Value>
</Value>
<Value name="10">
<Value>usuallanguage</Value>
</Value>
<Value name="11">
<Value>insurability</Value>
</Value>
<Value name="12">
<Value>recorddatetime</Value>
</Value>
</Data>
<Data name="text">
<Attribute>text</Attribute>
<Structure>subnode</Structure>
<Subscript>"text"</Subscript>
</Data>
<DataLocation>^CHUBXL.WS.Cosite.co54B2.personD</DataLocation>
<DefaultData>personDefaultData</DefaultData>
<IdLocation>^CHUBXL.WS.Cosite.co54B2.personD</IdLocation>
<IndexLocation>^CHUBXL.WS.Cosite.co54B2.personI</IndexLocation>
<StreamLocation>^CHUBXL.WS.Cosite.co54B2.personS</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}
