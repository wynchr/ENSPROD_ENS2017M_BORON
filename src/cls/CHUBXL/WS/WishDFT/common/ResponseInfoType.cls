/// Status of the response message.
Class CHUBXL.WS.WishDFT.common.ResponseInfoType Extends (%Persistent, %XML.Adaptor) [ ClassType = persistent, CompileAfter = , Inheritance = right, ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "http://services.webservice.cpo.be.ibm.com";

Parameter XMLNAME = "genericApiXmlReturn";

Parameter XMLSEQUENCE = 1;

/// PARAM.
Property PARAM As CHUBXL.WS.WishDFT.common.ResponseInfoType(XMLNAME = "PARAM");

Storage Default
{
<Data name="ResponseInfoTypeDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>PARAM</Value>
</Value>
</Data>
<DataLocation>^CHUBXL.WS7A02.ResponseInfAF5CD</DataLocation>
<DefaultData>ResponseInfoTypeDefaultData</DefaultData>
<IdLocation>^CHUBXL.WS7A02.ResponseInfAF5CD</IdLocation>
<IndexLocation>^CHUBXL.WS7A02.ResponseInfAF5CI</IndexLocation>
<StreamLocation>^CHUBXL.WS7A02.ResponseInfAF5CS</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}
