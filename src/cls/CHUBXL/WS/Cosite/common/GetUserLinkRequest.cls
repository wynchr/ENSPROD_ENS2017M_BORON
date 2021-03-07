/// Created from: http://10.29.15.250/2.0/Kmehr1/Services/production/1.0/Main.asmx?WSDL
Class CHUBXL.WS.Cosite.common.GetUserLinkRequest Extends (%Persistent, %XML.Adaptor) [ ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "http://tempuri.org";

Parameter XMLNAME = "GetUserLinkRequest";

Parameter XMLSEQUENCE = 1;

Property request As CHUBXL.WS.Cosite.common.kmehrrequest(XMLNAME = "request");

Property userlink As CHUBXL.WS.Cosite.common.UserLink(XMLNAME = "userlink");

Storage Default
{
<Data name="GetUserLinkRequestDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>request</Value>
</Value>
<Value name="3">
<Value>userlink</Value>
</Value>
</Data>
<DataLocation>^CHUBXL.WS54B2.GetUserLink9E59D</DataLocation>
<DefaultData>GetUserLinkRequestDefaultData</DefaultData>
<IdLocation>^CHUBXL.WS54B2.GetUserLink9E59D</IdLocation>
<IndexLocation>^CHUBXL.WS54B2.GetUserLink9E59I</IndexLocation>
<StreamLocation>^CHUBXL.WS54B2.GetUserLink9E59S</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}
