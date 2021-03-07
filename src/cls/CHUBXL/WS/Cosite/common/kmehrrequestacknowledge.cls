/// Created from: http://10.29.15.250/2.0/Kmehr1/Services/production/1.0/Main.asmx?WSDL
Class CHUBXL.WS.Cosite.common.kmehrrequestacknowledge Extends (%Persistent, %XML.Adaptor) [ ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "http://tempuri.org";

Parameter XMLNAME = "kmehrrequestacknowledge";

Parameter XMLSEQUENCE = 1;

Property iscomplete As %Boolean(XMLNAME = "iscomplete");

Property error As CHUBXL.WS.Cosite.common.error(XMLNAME = "error");

Storage Default
{
<Data name="kmehrrequestacknowledgeDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>iscomplete</Value>
</Value>
<Value name="3">
<Value>error</Value>
</Value>
</Data>
<DataLocation>^CHUBXL.WS54B2.kmehrrequesBCCBD</DataLocation>
<DefaultData>kmehrrequestacknowledgeDefaultData</DefaultData>
<IdLocation>^CHUBXL.WS54B2.kmehrrequesBCCBD</IdLocation>
<IndexLocation>^CHUBXL.WS54B2.kmehrrequesBCCBI</IndexLocation>
<StreamLocation>^CHUBXL.WS54B2.kmehrrequesBCCBS</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}
