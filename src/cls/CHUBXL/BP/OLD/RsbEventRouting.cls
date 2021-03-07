Class CHUBXL.BP.OLD.RsbEventRouting Extends Ens.BusinessProcess [ ClassType = persistent, ProcedureBlock ]
{

/*
--------------------------------------------------------------------------------------------------------------------------------
DESCRIPTION
-----------
Routing des messages RSBEVENT

VERSION
-------
CWY	18/06/2018	Initial Version
CWY	01/08/2018	Add comment

REQUEST
-------
	CHUBXL.DATA.RawMessageStream

SOURCE
------
	RsbEventAllDocXmlFcpIn

DESTINATION
-----------
	RsbBdocBruDocXmlFcpOut
	RsbBdocHudDocXmlFcpOut

MESSAGES
--------
	CHUBXL.DATA.RawMessageStream

PROCESS
-------	
		RsbEventAllDocXmlFcpIn
				=> RsbBdocBruDocXmlFcpOut
				=> RsbBdocHudDocXmlFcpOut
        
OPTIMISATION
------------
- CHUBXL.DATA.RawMessageStream

SOURCE
------
CHUBXL.BP.RefmedRouting

--------------------------------------------------------------------------------------------------------------------------------
*/
Property AddToMetric As %Boolean [ InitialExpression = 1 ];

Parameter SETTINGS = "AddToMetric";

Method OnRequest(pRequest As CHUBXL.DATA.RawMessageStream, Output pResponse As Ens.Response) As %Status
{
	
	Set $ZTrap = "ErrorTrap",tSC=$$$OK	

	s tClassName = pRequest.%ClassName(1)
	s tSourceConfigName = ..%PrimaryRequestHeader.SourceConfigName
	s tTargetConfigName = ..%PrimaryRequestHeader.TargetConfigName
	
	//------------------------------
	// Test Source
	//------------------------------
	
	$$$TRACE("Source : "_tSourceConfigName)
  	if (tSourceConfigName = "RsbEventAllDocXmlFcpIn") {
		s tSC=..SendRequestAsync("RsbBdocBruDocXmlFcpOut",pRequest)	Quit:$$$ISERR(tSC) tSC
		s tSC=..SendRequestAsync("RsbBdocHudDocXmlFcpOut",pRequest)	Quit:$$$ISERR(tSC) tSC
	}
	q:('tSC)			
					
Exit	
	Quit tSC

ErrorTrap
 
 	Set $ZTrap = ""
 	Write $ZError,!
 	$$$TRACE("Error BP - RsbEventRouting : "_$ZError)
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
<Data name="RsbEventRoutingDefaultData">
<Subscript>"RsbEventRouting"</Subscript>
<Value name="1">
<Value>AddToMetric</Value>
</Value>
</Data>
<DefaultData>RsbEventRoutingDefaultData</DefaultData>
<Type>%Library.CacheStorage</Type>
}

}
