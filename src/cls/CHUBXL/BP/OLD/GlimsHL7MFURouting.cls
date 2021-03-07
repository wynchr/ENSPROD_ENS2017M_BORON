Class CHUBXL.BP.OLD.GlimsHL7MFURouting Extends Ens.BusinessProcess [ ClassType = persistent, ProcedureBlock ]
{

/// Automatic Metric
Property AddToMetric As %Boolean [ InitialExpression = 1 ];

Parameter SETTINGS = "AddToMetric";

Method OnRequest(pRequest As CHUBXL.DATA.RawMessageStream, Output pResponse As Ens.Response) As %Status
{
	
	Set $ZTrap = "ErrorTrap", tSC=$$$OK	

	$$$TRACE("Start BP GlimsHL7MFURouting")

	s tClassName = pRequest.%ClassName(1)
	s tSourceConfigName = ..%PrimaryRequestHeader.SourceConfigName
	s tTargetConfigName = ..%PrimaryRequestHeader.TargetConfigName
	
	$$$TRACE("ClassName : "_tClassName)
	$$$TRACE("SourceConfigName : "_tSourceConfigName)
	$$$TRACE("TargetConfigName : "_tTargetConfigName)

	If (tSourceConfigName = "GlimsAllMFHl7FcpIn" ) {
		$$$TRACE("HL7Msg : "_pRequest.payLoad)
		$$$TRACE("Msg sent to Mediweb HIS")
	}
	Elseif (tSourceConfigName = "GlimsAllMFHl7TcpIn" ) {
		$$$TRACE("HL7Msg : "_pRequest.payLoad)
		s tSC = ..SendRequestAsync("GlimsGlimsBruMFUHl7FcpOut",pRequest)  Quit:$$$ISERR(tSC) tSC
		$$$TRACE("Msg sent to Mediweb Brugmann")
	}
	Else {
		$$$LOGWARNING("Unsupported message received :"_tSourceConfigName)
	}
					
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
<Data name="GlimsHL7MFURoutingDefaultData">
<Subscript>"GlimsHL7MFURouting"</Subscript>
<Value name="1">
<Value>AddToMetric</Value>
</Value>
</Data>
<DefaultData>GlimsHL7MFURoutingDefaultData</DefaultData>
<Type>%Library.CacheStorage</Type>
}

}
