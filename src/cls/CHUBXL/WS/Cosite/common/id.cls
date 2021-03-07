/// Created from: http://10.29.15.250/2.0/Kmehr1/Services/production/1.0/Main.asmx?WSDL
Class CHUBXL.WS.Cosite.common.id Extends (%SerialObject, %XML.Adaptor) [ ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "http://tempuri.org";

Parameter XMLNAME = "id";

Parameter XMLSEQUENCE = 1;

Property content As %String(MAXLEN = "", XMLNAME = "content", XMLPROJECTION = "CONTENT");

Property S As %String(MAXLEN = "", XMLNAME = "S", XMLPROJECTION = "ATTRIBUTE");

Property SV As %String(MAXLEN = "", XMLNAME = "SV", XMLPROJECTION = "ATTRIBUTE");

Property SL As %String(MAXLEN = "", XMLNAME = "SL", XMLPROJECTION = "ATTRIBUTE");

Storage Default
{
<Data name="idState">
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
</Data>
<State>idState</State>
<StreamLocation>^CHUBXL.WS.Cosite.common.idS</StreamLocation>
<Type>%Library.CacheSerialState</Type>
}

}
