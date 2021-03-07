Class CHUBXL.BP.OLD.MOSOSRouting Extends Ens.BusinessProcess [ ClassType = persistent, ProcedureBlock ]
{

/// Automatic Metric
Property AddToMetric As %Boolean [ InitialExpression = 1 ];

Parameter SETTINGS = "AddToMetric";

Method OnRequest(pRequest As Ens.Request, Output pResponse As Ens.Response) As %Status
{

	Set $ZT="Trap",tSC=$$$OK
	
	$$$TRACE("Start BP MOSOSRouting")
	s tClassName=pRequest.%ClassName(1)
	
	$$$TRACE("ClassName : "_pRequest.%ClassName(1))
	$$$TRACE("SourceConfigName : "_..%PrimaryRequestHeader.SourceConfigName)
	$$$TRACE("TargetConfigName : "_..%PrimaryRequestHeader.TargetConfigName)
	
	//-- MOSOS -----------------------------------------------------------------------------------------------
	if (tClassName="CHUBXL.MSG.HL7MOSOSFile") {
		$$$TRACE("Routing Msg "_tClassName)
				
		;=> Quadrat Mediweb
		s tSC = ##class(CHUBXL.DT.ResultMOSOSToHL7FILE).Transform(pRequest.HL7,.HL7Msg)  Quit:$$$ISERR(tSC) tSC
		s pRequest.HL7=HL7Msg
		
		s tHop=pRequest.HL7.GetValueAt("PIDgrpgrp(1).PIDgrp.PV1grp.PV1:HospitalService",,.tSC)
		
		if (tHop="26") {
			;s tSC = ..SendRequestAsync("MOSOSQuadratBRUFileOut",pRequest)  Quit:$$$ISERR(tSC) tSC
			;$$$TRACE("Msg sent to Quadrat Brugmann")
		}
		Else {
			;s tSC = ..SendRequestAsync("MOSOSQuadratHUDFileOut",pRequest)  Quit:$$$ISERR(tSC) tSC
			;$$$TRACE("Msg sent to Quadrat Huderf")
		}
		
		;=> Allgeier Medical Viewer
		
		s reStatus="",reStatus2=""
		s reStatus=pRequest.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(1).OBR:ResultStatus",,.tSC)
		i (pRequest.HL7.SegCount > 7 ) 	s reStatus2=pRequest.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(2).OBR:ResultStatus",,.tSC)
		
		$$$TRACE("MOSOSRouting HL7 ResultStatus (1): "_reStatus)
		$$$TRACE("MOSOSRouting HL7 ResultStatus (2): "_reStatus2)
		$$$TRACE("MOSOSRouting SegCount: "_pRequest.HL7.SegCount)
		
		if (reStatus="F"){			
			$$$TRACE("MOSOSRouting reStatus :"_reStatus)
			s tSC=##class(CHUBXL.DT.ResultMOSOSToMv).Transform(pRequest.HL7,.MvMsg)  Quit:$$$ISERR(tSC) tSC
			d pRequest.File.Rewind()	
			s stat = MvMsg.Blob.CopyFrom(pRequest.File)
			s tSC($G(MvMsg)'="") =..SendRequestAsync("MososMvBruDocHl7FcpOut",MvMsg)  Quit:$$$ISERR(tSC) tSC		
			$$$TRACE("Msg sent to Medical Viewer")
		}
		
		if (reStatus2)="F" {			
			$$$TRACE("MOSOSRouting reStatus2 :"_reStatus2)
			s tSC=##class(CHUBXL.DT.ResultMOSOSToMv).Transform(pRequest.HL7,.MvMsg)  Quit:$$$ISERR(tSC) tSC
			d pRequest.File.Rewind()	
			s stat = MvMsg.Blob.CopyFrom(pRequest.File)
			s tSC($G(MvMsg)'="") =..SendRequestAsync("MososMvBruDocHl7FcpOut",MvMsg)  Quit:$$$ISERR(tSC) tSC		
			$$$TRACE("Msg sent to Medical Viewer")
		}
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
	;$$$TRACE("Dummy Asynchronous request returned")
	Set response=##class(Ens.StringResponse).%New()
	Quit $$$OK
}

Storage Default
{
<Data name="MOSOSRoutingDefaultData">
<Subscript>"MOSOSRouting"</Subscript>
<Value name="1">
<Value>AddToMetric</Value>
</Value>
</Data>
<DefaultData>MOSOSRoutingDefaultData</DefaultData>
<Type>%Library.CacheStorage</Type>
}

}
