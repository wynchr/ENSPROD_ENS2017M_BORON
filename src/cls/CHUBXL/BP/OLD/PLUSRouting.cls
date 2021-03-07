Class CHUBXL.BP.OLD.PLUSRouting Extends Ens.BusinessProcess [ ClassType = persistent, ProcedureBlock ]
{

/// Automatic Metric
Property AddToMetric As %Boolean [ InitialExpression = 1 ];

Parameter SETTINGS = "AddToMetric";

Method OnRequest(pRequest As Ens.Request, Output pResponse As Ens.Response) As %Status
{

	Set $ZT="Trap",tSC=$$$OK
	
	$$$TRACE("Start BP BDocRouting")
	s tClassName=pRequest.%ClassName(1)
	
	$$$TRACE("ClassName : "_pRequest.%ClassName(1))
	$$$TRACE("SourceConfigName : "_..%PrimaryRequestHeader.SourceConfigName)
	$$$TRACE("TargetConfigName : "_..%PrimaryRequestHeader.TargetConfigName)
	
	//-- BDoc -----------------------------------------------------------------------------------------------
	if (tClassName="CHUBXL.MSG.ResultPLUS") {
		$$$TRACE("Routing Msg "_tClassName)
		s tSC = ..SendRequestAsync("PlusMvAllDocXmlFcpOut",pRequest)  Quit:$$$ISERR(tSC) tSC
		$$$TRACE("Msg sent to Medicla Viewer")
	}
	
	//-- Unknown message --------------------------------------------------------------------------------------	
	else {
		$$$LOGWARNING("Unsupported message received :"_tClassName)
	}
	
Exit
	Quit tSC
Trap
	Set $ZT="",tSC=$$$EnsSystemError Goto Exit
}

Method OnResponse(request As Ens.Request, ByRef response As Ens.Response, callrequest As Ens.Request, callresponse As Ens.Response, pCompletionKey As %String) As %Status
{
	Set response=##class(Ens.StringResponse).%New()
	Quit $$$OK
}

Storage Default
{
<Data name="PLUSRoutingDefaultData">
<Subscript>"PLUSRouting"</Subscript>
<Value name="1">
<Value>AddToMetric</Value>
</Value>
</Data>
<DefaultData>PLUSRoutingDefaultData</DefaultData>
<Type>%Library.CacheStorage</Type>
}

}
