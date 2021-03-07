/// 
Class CHUBXL.WS.Cosite.common.GetUserLink Extends (%Persistent, %XML.Adaptor) [ ClassType = persistent, Inheritance = right, ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "http://health.fgov.be/telematics/rsw/cosite/2.0/";

Parameter XMLNAME = "GetUserLink";

Parameter XMLSEQUENCE = 1;

Property Requete As CHUBXL.WS.Cosite.common.GetUserLinkRequest(XMLNAME = "Requete");

Property TimeoutEnSecondes As %Integer(XMLNAME = "TimeoutEnSecondes") [ Required ];

Storage Default
{
<Data name="GetUserLinkDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Requete</Value>
</Value>
<Value name="3">
<Value>TimeoutEnSecondes</Value>
</Value>
</Data>
<DataLocation>^CHUBXL.WS.Cosi54B2.GetUserLinkD</DataLocation>
<DefaultData>GetUserLinkDefaultData</DefaultData>
<IdLocation>^CHUBXL.WS.Cosi54B2.GetUserLinkD</IdLocation>
<IndexLocation>^CHUBXL.WS.Cosi54B2.GetUserLinkI</IndexLocation>
<StreamLocation>^CHUBXL.WS.Cosi54B2.GetUserLinkS</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}
