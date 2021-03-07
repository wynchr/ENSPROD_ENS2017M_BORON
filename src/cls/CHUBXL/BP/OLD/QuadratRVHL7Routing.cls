Class CHUBXL.BP.OLD.QuadratRVHL7Routing Extends Ens.BusinessProcess [ ClassType = persistent, ProcedureBlock ]
{

/// Automatic Metric
Property AddToMetric As %Boolean [ InitialExpression = 1 ];

Parameter SETTINGS = "AddToMetric";

Method OnRequest(pRequest As CHUBXL.DATA.RawMessageStream, Output pResponse As Ens.Response) As %Status
{
	
	Set $ZTrap = "ErrorTrap", tSC=$$$OK	

	$$$TRACE("Start BP QuadratRVHL7Routing")

	s tClassName = pRequest.%ClassName(1)
	s tSourceConfigName = ..%PrimaryRequestHeader.SourceConfigName
	s tTargetConfigName = ..%PrimaryRequestHeader.TargetConfigName
	
	;$$$TRACE("ClassName : "_tClassName)
	;$$$TRACE("SourceConfigName : "_tSourceConfigName)
	;$$$TRACE("TargetConfigName : "_tTargetConfigName)

	If (tSourceConfigName = "AgfaHudRdvHl7TcpIn") ! (tSourceConfigName = "AgfaBruRdvHl7TcpIn") ! (tSourceConfigName = "AgfaBruRdvHl7TcpInNew") {
		d pRequest.payLoad.Rewind()
		s tmp=pRequest.payLoad.Read(3500000)
		s tmp=$tr(tmp,$c(13),$c(10))
		s HL7Msg = ##class(EnsLib.HL7.Message).ImportFromString(tmp,.tSC)
		s HL7Msg.DocType=HL7Msg.TypeVersion_":"_HL7Msg.Name
		s msgtype=HL7Msg.GetValueAt("MSH:MessageType.messagetype",,.tSC)
		;$$$TRACE("HL7 MessageType BP : "_msgtype)
		;$$$TRACE("Name : "_HL7Msg.Name)
		;$$$TRACE("Version : "_HL7Msg.TypeVersion)
		;$$$TRACE("HL7Msg : "_HL7Msg.RawContent)
		s Status=HL7Msg.FindSegmentValues("SCH:25")
		s TypeRV=HL7Msg.FindSegmentValues("AIL:3.9")
		;$$$TRACE("Statut rendez-vous : ***"_Status_"***")
		i tSourceConfigName = "AgfaHudRdvHl7TcpIn" $$$TRACE("Type rendez-vous : ***"_TypeRV_"*****************************")
		i tSourceConfigName = "AgfaHudRdvHl7TcpIn" s tSC = ..SendRequestAsync("AgfaBdocHudRdvHl7TcpOut",HL7Msg)  Quit:$$$ISERR(tSC) tSC
		i tSourceConfigName = "AgfaHudRdvHl7TcpIn" s tSC = ..SendRequestAsync("AgfaBdocHudRdvHl7FcpFwd",HL7Msg)  Quit:$$$ISERR(tSC) tSC
		i tSourceConfigName = "AgfaBruRdvHl7TcpIn" s tSC = ..SendRequestAsync("AgfaWishBruRdvHl7FcpOut",HL7Msg)  Quit:$$$ISERR(tSC) tSC
		i tSourceConfigName = "QuadratMultiIn" s tSC = ..SendRequestAsync("AgfaWishBruRdvHl7FcpOut",HL7Msg)  Quit:$$$ISERR(tSC) tSC
		i tSourceConfigName = "AgfaHudRdvHl7TcpIn" s:(Status'="COMPLETE")&(TypeRV'["RADIOLOGIE HUDERF") tSC = ..SendRequestAsync("AgfaWishHudRdvHl7FcpOut",HL7Msg)  Quit:$$$ISERR(tSC) tSC
		i tSourceConfigName = "AgfaBruRdvHl7TcpIn" s tSC = ..SendRequestAsync("AgfaBdocBruRdvHl7TcpFwd",HL7Msg)  Quit:$$$ISERR(tSC) tSC
		i tSourceConfigName = "AgfaBruRdvHl7TcpIn" s tSC = ..SendRequestAsync("AgfaBdocBruRdvHl7TcpOut",HL7Msg)  Quit:$$$ISERR(tSC) tSC
	}
	Else {
		$$$LOGWARNING("Unsupported message received :"_tSourceConfigName)
	}
					
Exit	
	Quit tSC

ErrorTrap
 
 	Set $ZTrap = ""
 	Write $ZError,!
 	$$$TRACE("Error BP - QuadratRVToDPI : "_$ZError)
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
<Data name="QuadratRVHL7RoutingDefaultData">
<Subscript>"QuadratRVHL7Routing"</Subscript>
<Value name="1">
<Value>AddToMetric</Value>
</Value>
</Data>
<DefaultData>QuadratRVHL7RoutingDefaultData</DefaultData>
<Type>%Library.CacheStorage</Type>
}

}
