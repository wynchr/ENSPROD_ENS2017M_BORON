/// Created from: http://10.29.15.250/2.0/Kmehr1/Services/production/1.0/Main.asmx?WSDL
Class CHUBXL.WS.Cosite.common.text Extends (%SerialObject, %XML.Adaptor) [ ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "http://tempuri.org";

Parameter XMLNAME = "text";

Parameter XMLSEQUENCE = 1;

Property content As %String(MAXLEN = "", XMLNAME = "content", XMLPROJECTION = "CONTENT");

Property L As %String(MAXLEN = "", XMLNAME = "L", XMLPROJECTION = "ATTRIBUTE");

Storage Default
{
<Data name="textState">
<Value name="1">
<Value>content</Value>
</Value>
<Value name="2">
<Value>L</Value>
</Value>
</Data>
<State>textState</State>
<StreamLocation>^CHUBXL.WS.Cosite.common.textS</StreamLocation>
<Type>%Library.CacheSerialState</Type>
}

}
