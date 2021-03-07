Class CHUBXL.BP.OLD.InfohosBdocMedicRouting Extends Ens.BusinessProcess [ ClassType = persistent ]
{

Method OnRequest(pRequest As CHUBXL.DATA.RawMessageStream, Output pResponse As Ens.Response) As %Status
{
	Set $ZT="Trap",tSC=$$$OK
	s HL7Msg = ##class(EnsLib.HL7.Message).ImportFromLibraryStream(pRequest.payLoad,.tSC)
	Set tSC = ..SendRequestAsync("InfohosBdocHudPhaHl7TcpOut",HL7Msg)
	Set tSC = ..SendRequestAsync("InfohosBdocBruPhaHl7TcpOut",HL7Msg)
	Set tSC = ..SendRequestAsync("InfohosBdocBruPhaHl7TcpOutPre",HL7Msg)
	Set tSC = ..SendRequestAsync("InfohosBdocHudPhaHl7TcpOutPre",HL7Msg)
	Set tSC = ..SendRequestAsync("InfohosBdocBruPhaNotHl7TcpOut",HL7Msg)
	Set tSC = ..SendRequestAsync("InfohosBdocHudPhaNotHl7TcpOut",HL7Msg)
	Set tSC = ..SendRequestAsync("InfohosBdocBruPhaForHl7TcpOut",HL7Msg)
	Set tSC = ..SendRequestAsync("InfohosBdocHudForPhaHl7TcpOut",HL7Msg)
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

}
