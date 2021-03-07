Class CHUBXL.BP.OLD.InfohosRouting Extends Ens.BusinessProcess [ ClassType = persistent, ProcedureBlock ]
{

/// Automatic Metric
Property AddToMetric As %Boolean [ InitialExpression = 1 ];

Parameter SETTINGS = "AddToMetric";

Method OnRequest(pRequest As CHUBXL.DATA.RawMessageStream, Output pResponse As Ens.Response) As %Status
{
	
	Set $ZTrap = "ErrorTrap"

	s tClassName = pRequest.%ClassName(1)
	s tSourceConfigName = ..%PrimaryRequestHeader.SourceConfigName
	s tTargetConfigName = ..%PrimaryRequestHeader.TargetConfigName
	
	s tSC=$$$OK	
	$$$TRACE("Source : "_tSourceConfigName)
  	if (tSourceConfigName = "InfohosArtAllPhaXmlFcpIn") {
		s tSC=..SendRequestAsync("InfohosArtAllPhaXmlFcpOut",pRequest)	Quit:$$$ISERR(tSC) tSC
	}
	q:('tSC)			
					
Exit	
	Quit tSC

ErrorTrap
 
 	Set $ZTrap = ""
 	Write $ZError,!
 	$$$TRACE("Error BP - GlimsMB : "_$ZError)
	Set tSC=$$$EnsSystemError Goto Exit
}

Method OnResponse(request As Ens.Request, ByRef response As Ens.Response, callrequest As Ens.Request, callresponse As Ens.Response, pCompletionKey As %String) As %Status
{
	$$$TRACE("Dummy Asynchronous request returned")
	Set response=callresponse
	Quit $$$OK
}

Storage Default
{
<Data name="InfohosRoutingDefaultData">
<Subscript>"InfohosRouting"</Subscript>
<Value name="1">
<Value>AddToMetric</Value>
</Value>
</Data>
<DefaultData>InfohosRoutingDefaultData</DefaultData>
<Type>%Library.CacheStorage</Type>
}

}
