Class CHUBXL.BP.NEW.InfohosArtXmlRouting Extends Ens.BusinessProcess [ ClassType = persistent, ProcedureBlock ]
{

/*
--------------------------------------------------------------------------------------------------------------------------------
DESCRIPTION
-----------
BP INHOHOS Art XML
VERSION
-------
CWY	24/07/2018	Initial Version
CWY	01/08/2018	Add comment

REQUEST
-------
	CHUBXL.DATA.RawMessageStream

SOURCE
------
	INFOHOS

DESTINATION
-----------
	\\BRDEVTASK01\FTPincoming$\infofile\articles
		
MESSAGES
--------
	CHUBXL.DATA.RawMessageStream

PROCESS
-------	
  	InfohosArtAllPhaXmlFcpIn	=> InfohosArtAllPhaXmlFcpOut								
											
OPTIMISATION
------------
- Destination ???

SOURCE
------
CHUBXL.BP.InfohosRouting

--------------------------------------------------------------------------------------------------------------------------------
*/
/// Automatic Metric
Property AddToMetric As %Boolean [ InitialExpression = 1 ];

Parameter SETTINGS = "AddToMetric";

Method OnRequest(pRequest As CHUBXL.DATA.RawMessageStream, Output pResponse As Ens.Response) As %Status
{
	Set $ZTrap = "ErrorTrap",tSC=$$$OK	

	s tClassName = pRequest.%ClassName(1)
	s tSourceConfigName = ..%PrimaryRequestHeader.SourceConfigName
	s tTargetConfigName = ..%PrimaryRequestHeader.TargetConfigName
	
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
<Data name="InfohosArtXmlRoutingDefaultData">
<Subscript>"InfohosArtXmlRouting"</Subscript>
<Value name="1">
<Value>AddToMetric</Value>
</Value>
</Data>
<DefaultData>InfohosArtXmlRoutingDefaultData</DefaultData>
<Type>%Library.CacheStorage</Type>
}

}
