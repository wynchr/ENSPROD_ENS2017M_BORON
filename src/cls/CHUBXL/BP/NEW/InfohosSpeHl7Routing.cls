Class CHUBXL.BP.NEW.InfohosSpeHl7Routing Extends Ens.BusinessProcess [ ClassType = persistent, ProcedureBlock ]
{

/*
--------------------------------------------------------------------------------------------------------------------------------
DESCRIPTION
-----------
BP INHOHOS Spe HL7
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
	WISH, DIAMIC, OXYGEN
	
MESSAGES
--------
	CHUBXL.DATA.RawMessageStream

PROCESS
-------	
  	source = SPRPHM ! SPRPHS ! SINAMM ! SINAMS
						=> InfohosSpeBruPhaHl7FtpOut
						=> InfohosSpeHudPhaHl7FtpOut
		
	source = ELB
						=> DiamicWishBruFacDlmFtpOut
	
	source = ELH
						=> DiamicWishHudFacDlmFtpOut
	source = kin
						=> OxygenWishBruFacDlmFtpOut					
											
OPTIMISATION
------------


SOURCE
------
CHUBXL.BP.InfohosWishRouting

--------------------------------------------------------------------------------------------------------------------------------
*/
Method OnRequest(pRequest As CHUBXL.DATA.RawMessageStream, Output pResponse As Ens.Response) As %Status
{
	
	Set $ZTrap = "ErrorTrap"
	
	s tSC=$$$OK	
	$$$TRACE("Source : "_pRequest.source)
  	if (pRequest.source = "SPRPHM") ! (pRequest.source = "SPRPHS") ! (pRequest.source = "SINAMM") ! (pRequest.source = "SINAMS") {
		s tSC=..SendRequestAsync("InfohosSpeBruPhaHl7FtpOut",pRequest)	Quit:$$$ISERR(tSC) tSC
		s tSC=..SendRequestAsync("InfohosSpeHudPhaHl7FtpOut",pRequest)	Quit:$$$ISERR(tSC) tSC
	}
	if ($e(pRequest.source,1,3) = "ELB") s tSC=..SendRequestAsync("DiamicWishBruFacDlmFtpOut",pRequest)	Quit:$$$ISERR(tSC) tSC
	if ($e(pRequest.source,1,3) = "ELH") s tSC=..SendRequestAsync("DiamicWishHudFacDlmFtpOut",pRequest)	Quit:$$$ISERR(tSC) tSC
	if ($e(pRequest.source,1,3) = "kin") s tSC=..SendRequestAsync("OxygenWishBruFacDlmFtpOut",pRequest)	Quit:$$$ISERR(tSC) tSC
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
<Type>%Library.CacheStorage</Type>
}

}
