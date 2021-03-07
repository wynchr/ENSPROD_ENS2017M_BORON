/// Created from: http://10.29.15.250/2.0/Kmehr1/Services/production/1.0/Main.asmx?WSDL
Class CHUBXL.WS.Cosite.common.error Extends (%Persistent, %XML.Adaptor) [ ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "http://tempuri.org";

Parameter XMLNAME = "error";

Parameter XMLSEQUENCE = 1;

Property cd As list Of CHUBXL.WS.Cosite.common.cd(XMLNAME = "cd", XMLPROJECTION = "ELEMENT");

Property description As CHUBXL.WS.Cosite.common.text(XMLNAME = "description");

Property url As %String(MAXLEN = "", XMLNAME = "url");

Storage Default
{
<Data name="errorDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>cd</Value>
</Value>
<Value name="3">
<Value>description</Value>
</Value>
<Value name="4">
<Value>url</Value>
</Value>
</Data>
<DataLocation>^CHUBXL.WS.Cosite.common.errorD</DataLocation>
<DefaultData>errorDefaultData</DefaultData>
<IdLocation>^CHUBXL.WS.Cosite.common.errorD</IdLocation>
<IndexLocation>^CHUBXL.WS.Cosite.common.errorI</IndexLocation>
<StreamLocation>^CHUBXL.WS.Cosite.common.errorS</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}
