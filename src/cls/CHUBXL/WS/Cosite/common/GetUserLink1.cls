/// 
Class CHUBXL.WS.Cosite.common.GetUserLink1 Extends (%Persistent, %XML.Adaptor) [ ClassType = persistent, Inheritance = right, ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "http://health.fgov.be/telematics/rsw/cosite/2.0/";

Parameter XMLNAME = "GetUserLink";

Parameter XMLSEQUENCE = 1;

Property Requete As CHUBXL.WS.Cosite.common.GetUserLinkRequest(XMLNAME = "Requete");

Property TimeoutEnSecondes As %Integer(XMLNAME = "TimeoutEnSecondes") [ Required ];

Storage Default
{
<Data name="GetUserLink1DefaultData">
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
<DataLocation>^CHUBXL.WS.Cos54B2.GetUserLink1D</DataLocation>
<DefaultData>GetUserLink1DefaultData</DefaultData>
<IdLocation>^CHUBXL.WS.Cos54B2.GetUserLink1D</IdLocation>
<IndexLocation>^CHUBXL.WS.Cos54B2.GetUserLink1I</IndexLocation>
<StreamLocation>^CHUBXL.WS.Cos54B2.GetUserLink1S</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}
