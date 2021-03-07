/// Created from: http://10.29.15.250/2.0/Kmehr1/Services/production/1.0/Main.asmx?WSDL
Class CHUBXL.WS.Cosite.common.UserLink Extends (%Persistent, %XML.Adaptor) [ ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "http://tempuri.org";

Parameter XMLNAME = "UserLink";

Parameter XMLSEQUENCE = 1;

Property user1 As CHUBXL.WS.Cosite.common.UserType(XMLNAME = "user1");

Property user2 As CHUBXL.WS.Cosite.common.UserType(XMLNAME = "user2");

Property type As CHUBXL.WS.Cosite.common.cd(XMLNAME = "type");

Property begindate As CHUBXL.WS.Cosite.common.begindate(XMLNAME = "begindate");

Property enddate As CHUBXL.WS.Cosite.common.enddate(XMLNAME = "enddate");

Property author As CHUBXL.WS.Cosite.common.authorV2(XMLNAME = "author");

Property comment As %String(MAXLEN = "", XMLNAME = "comment");

Storage Default
{
<Data name="UserLinkDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>user1</Value>
</Value>
<Value name="3">
<Value>user2</Value>
</Value>
<Value name="4">
<Value>type</Value>
</Value>
<Value name="5">
<Value>begindate</Value>
</Value>
<Value name="6">
<Value>enddate</Value>
</Value>
<Value name="7">
<Value>author</Value>
</Value>
<Value name="8">
<Value>comment</Value>
</Value>
</Data>
<DataLocation>^CHUBXL.WS.Cosite54B2.UserLinkD</DataLocation>
<DefaultData>UserLinkDefaultData</DefaultData>
<IdLocation>^CHUBXL.WS.Cosite54B2.UserLinkD</IdLocation>
<IndexLocation>^CHUBXL.WS.Cosite54B2.UserLinkI</IndexLocation>
<StreamLocation>^CHUBXL.WS.Cosite54B2.UserLinkS</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}
