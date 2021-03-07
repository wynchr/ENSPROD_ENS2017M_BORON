/// Created from: http://10.29.15.250/2.0/Kmehr1/Services/production/1.0/Main.asmx?WSDL
Class CHUBXL.WS.Cosite.common.GetUserLinkResponse Extends (%Persistent, %XML.Adaptor) [ ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "http://tempuri.org";

Parameter XMLNAME = "GetUserLinkResponse";

Parameter XMLSEQUENCE = 1;

Property response As CHUBXL.WS.Cosite.common.kmehrresponseType(XMLNAME = "response");

Property acknowledge As CHUBXL.WS.Cosite.common.kmehrrequestacknowledge(XMLNAME = "acknowledge");

Property userlinks As list Of CHUBXL.WS.Cosite.common.UserLink(XMLNAME = "userlinks", XMLPROJECTION = "ELEMENT");

Storage Default
{
<Data name="GetUserLinkResponseDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>response</Value>
</Value>
<Value name="3">
<Value>acknowledge</Value>
</Value>
<Value name="4">
<Value>userlinks</Value>
</Value>
</Data>
<DataLocation>^CHUBXL.WS54B2.GetUserLink1DC2D</DataLocation>
<DefaultData>GetUserLinkResponseDefaultData</DefaultData>
<IdLocation>^CHUBXL.WS54B2.GetUserLink1DC2D</IdLocation>
<IndexLocation>^CHUBXL.WS54B2.GetUserLink1DC2I</IndexLocation>
<StreamLocation>^CHUBXL.WS54B2.GetUserLink1DC2S</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}
