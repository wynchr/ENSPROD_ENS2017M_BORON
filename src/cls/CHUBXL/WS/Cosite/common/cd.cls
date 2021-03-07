/// Created from: http://10.29.15.250/2.0/Kmehr1/Services/production/1.0/Main.asmx?WSDL
Class CHUBXL.WS.Cosite.common.cd Extends (%SerialObject, %XML.Adaptor) [ ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "http://tempuri.org";

Parameter XMLNAME = "cd";

Parameter XMLSEQUENCE = 1;

Property content As %String(MAXLEN = "", XMLNAME = "content", XMLPROJECTION = "CONTENT");

Property S As %String(MAXLEN = "", XMLNAME = "S", XMLPROJECTION = "ATTRIBUTE");

Property SV As %String(MAXLEN = "", XMLNAME = "SV", XMLPROJECTION = "ATTRIBUTE");

Property SL As %String(MAXLEN = "", XMLNAME = "SL", XMLPROJECTION = "ATTRIBUTE");

Property DN As %String(MAXLEN = "", XMLNAME = "DN", XMLPROJECTION = "ATTRIBUTE");

Property L As %String(MAXLEN = "", XMLNAME = "L", XMLPROJECTION = "ATTRIBUTE");

Storage Default
{
<Data name="cdState">
<Value name="1">
<Value>content</Value>
</Value>
<Value name="2">
<Value>S</Value>
</Value>
<Value name="3">
<Value>SV</Value>
</Value>
<Value name="4">
<Value>SL</Value>
</Value>
<Value name="5">
<Value>DN</Value>
</Value>
<Value name="6">
<Value>L</Value>
</Value>
</Data>
<State>cdState</State>
<StreamLocation>^CHUBXL.WS.Cosite.common.cdS</StreamLocation>
<Type>%Library.CacheSerialState</Type>
}

}
