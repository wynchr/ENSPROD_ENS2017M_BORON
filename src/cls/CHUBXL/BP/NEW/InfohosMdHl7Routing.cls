Class CHUBXL.BP.NEW.InfohosMdHl7Routing Extends Ens.BusinessProcess [ ClassType = persistent ]
{

/*
--------------------------------------------------------------------------------------------------------------------------------
DESCRIPTION
-----------
BP INHOHOS Md HL7
VERSION
-------
CWY	24/07/2018	Initial Version
CWY	01/08/2018	Add comment
DAM	24/08/2018	Send to PREP Ensemble

REQUEST
-------
	CHUBXL.DATA.RawMessageStream

SOURCE
------
	INFOHOS

DESTINATION
-----------
	BDOC

MESSAGES
--------
	CHUBXL.DATA.RawMessageStream

PROCESS
-------	
	InfohosBdocHudPhaHl7TcpOut
	InfohosBdocBruPhaHl7TcpOut
	InfohosBdocBruPhaHl7TcpFwd
	InfohosBdocHudPhaHl7TcpFwd
	InfohosBdocBruPhaNotHl7TcpOut
	InfohosBdocHudPhaNotHl7TcpOut
	InfohosBdocBruPhaHl7TcpFwdFor
	InfohosBdocHudPhaHl7TcpFwdFor						
											
OPTIMISATION
------------
- Test Source of message

SOURCE
------
CHUBXL.BP.InfohosBdocMedicRouting

--------------------------------------------------------------------------------------------------------------------------------
*/
Method OnRequest(pRequest As CHUBXL.DATA.RawMessageStream, Output pResponse As Ens.Response) As %Status
{
	Set $ZT="Trap",tSC=$$$OK
	s tClassName = pRequest.%ClassName(1)
	s tSourceConfigName = ..%PrimaryRequestHeader.SourceConfigName
	s tTargetConfigName = ..%PrimaryRequestHeader.TargetConfigName
	$$$TRACE("tSourceConfigName : "_tSourceConfigName)
	
	s Instance=$p($SYSTEM,":",2)
	i (Instance="ENS2017M") ! (tSourceConfigName="InfohosAllStomedHl7FcpIn") s HL7Msg = ##class(EnsLib.HL7.Message).ImportFromLibraryStream(pRequest.payLoad,.tSC)
	i (Instance'="ENS2017M") & (tSourceConfigName'="InfohosAllStomedHl7FcpIn") s HL7Msg = ##class(EnsLib.HL7.Message).ImportFromString(pRequest.RawContent,.tSC)
	s HL7Msg.DocType=HL7Msg.TypeVersion_":"_HL7Msg.Name
	s tSC1=HL7Msg.SetValueAt("ISO-8859-1","MSH:CharacterSet(1)") $$$TRACE("tSC : "_tSC1_" : "_HL7Msg.GetValueAt("MSH:CharacterSet(1)",,.tSC))
	i (Instance="ENS2017M") & (tSourceConfigName'="InfohosMdBetaAllPhaHl7FcpIn") Set tSC = ..SendRequestAsync("InfohosBdocHudPhaHl7TcpOut",HL7Msg)
	i (Instance="ENS2017M") & (tSourceConfigName'="InfohosMdBetaAllPhaHl7FcpIn") Set tSC = ..SendRequestAsync("InfohosBdocBruPhaHl7TcpOut",HL7Msg)
	i (tSourceConfigName'="InfohosMdBetaAllPhaHl7FcpIn") Set tSC = ..SendRequestAsync("InfohosBdocBruPhaHl7TcpFwd",HL7Msg),tSC = ..SendRequestAsync("InfohosBdocHudPhaHl7TcpFwd",HL7Msg)
	i (tSourceConfigName="InfohosMdBetaAllPhaHl7FcpIn") ! (tSourceConfigName="InfohosMdHudPhaHl7TcpIn") Set tSC = ..SendRequestAsync("InfohosBdocHudPhaHl7TcpFwd",HL7Msg)
	i (Instance="ENS2017M") & (tSourceConfigName'="InfohosMdBetaAllPhaHl7FcpIn") Set tSC = ..SendRequestAsync("InfohosBdocBruPhaNotHl7TcpOut",HL7Msg)
	i (Instance="ENS2017M") & (tSourceConfigName'="InfohosMdBetaAllPhaHl7FcpIn") ;Set tSC = ..SendRequestAsync("InfohosBdocHudPhaNotHl7TcpOut",HL7Msg)
	i (Instance'="ENS2017M") & (tSourceConfigName'="InfohosMdBetaAllPhaHl7FcpIn") Set tSC = ..SendRequestAsync("InfohosBdocBruPhaHl7TcpFwdFor",HL7Msg)
	i (Instance'="ENS2017M") & (tSourceConfigName="InfohosMdBetaAllPhaHl7FcpIn") Set tSC = ..SendRequestAsync("InfohosBdocHudPhaHl7TcpFwdFor",HL7Msg)
	Quit:$$$ISERR(tSC) tSC
	
Exit
	Quit tSC
Trap
 	Write $ZError,!
 	$$$TRACE("Error BP - Appointment : "_$ZError)
	Set $ZT="",tSC=$$$EnsSystemError Goto Exit
}

/// Handle a 'Response'
Method OnResponse(request As %Library.Persistent, ByRef response As %Library.Persistent, callrequest As %Library.Persistent, callresponse As %Library.Persistent, pCompletionKey As %String) As %Status
{
	Quit $$$OK
}

Storage Default
{
<Type>%Library.CacheStorage</Type>
}

}
