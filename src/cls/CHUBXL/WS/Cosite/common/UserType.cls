/// Created from: http://10.29.15.250/2.0/Kmehr1/Services/production/1.0/Main.asmx?WSDL
Class CHUBXL.WS.Cosite.common.UserType Extends (%Persistent, %XML.Adaptor) [ ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "http://tempuri.org";

Parameter XMLNAME = "UserType";

Parameter XMLSEQUENCE = 1;

Property cd As CHUBXL.WS.Cosite.common.cd(XMLNAME = "cd");

Property hcparty As CHUBXL.WS.Cosite.common.hcparty(XMLNAME = "hcparty");

Property patient As CHUBXL.WS.Cosite.common.person(XMLNAME = "patient");

Storage Default
{
<Data name="UserTypeDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>cd</Value>
</Value>
<Value name="3">
<Value>hcparty</Value>
</Value>
<Value name="4">
<Value>patient</Value>
</Value>
</Data>
<DataLocation>^CHUBXL.WS.Cosite54B2.UserTypeD</DataLocation>
<DefaultData>UserTypeDefaultData</DefaultData>
<IdLocation>^CHUBXL.WS.Cosite54B2.UserTypeD</IdLocation>
<IndexLocation>^CHUBXL.WS.Cosite54B2.UserTypeI</IndexLocation>
<StreamLocation>^CHUBXL.WS.Cosite54B2.UserTypeS</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}
