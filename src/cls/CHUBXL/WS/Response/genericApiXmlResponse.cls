Class CHUBXL.WS.Response.genericApiXmlResponse Extends (Ens.Response, %XML.Adaptor) [ ClassType = persistent, ProcedureBlock ]
{

Property PARAM As CHUBXL.WS.WishDFT.common.ResponseInfoType;

Property ERROR As %String(MAXLEN = 32000);

Property NOSEQ As %Numeric;

Storage Default
{
<Data name="genericApiXmlResponseDefaultData">
<Subscript>"genericApiXmlResponse"</Subscript>
<Value name="1">
<Value>PARAM</Value>
</Value>
<Value name="2">
<Value>ERROR</Value>
</Value>
<Value name="3">
<Value>NOSEQ</Value>
</Value>
</Data>
<DefaultData>genericApiXmlResponseDefaultData</DefaultData>
<Type>%Library.CacheStorage</Type>
}

}
