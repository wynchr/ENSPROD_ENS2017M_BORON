/// Created from: http://10.29.15.250/2.0/Kmehr1/Services/production/1.0/Main.asmx?WSDL
Class CHUBXL.WS.Cosite.common.telecom Extends (%Persistent, %XML.Adaptor) [ ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "http://tempuri.org";

Parameter XMLNAME = "telecom";

Parameter XMLSEQUENCE = 1;

Property cd As list Of CHUBXL.WS.Cosite.common.cd(XMLNAME = "cd", XMLPROJECTION = "ELEMENT");

Property telecomnumber As %String(MAXLEN = "", XMLNAME = "telecomnumber");

Storage Default
{
<Data name="telecomDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>cd</Value>
</Value>
<Value name="3">
<Value>telecomnumber</Value>
</Value>
</Data>
<DataLocation>^CHUBXL.WS.Cosite.c54B2.telecomD</DataLocation>
<DefaultData>telecomDefaultData</DefaultData>
<IdLocation>^CHUBXL.WS.Cosite.c54B2.telecomD</IdLocation>
<IndexLocation>^CHUBXL.WS.Cosite.c54B2.telecomI</IndexLocation>
<StreamLocation>^CHUBXL.WS.Cosite.c54B2.telecomS</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}
