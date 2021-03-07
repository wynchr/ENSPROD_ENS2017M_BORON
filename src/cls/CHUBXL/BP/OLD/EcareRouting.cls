Class CHUBXL.BP.OLD.EcareRouting Extends Ens.BusinessProcess [ ClassType = persistent, ProcedureBlock ]
{

/// Automatic Metric
Property AddToMetric As %Boolean [ InitialExpression = 1 ];

Parameter SETTINGS = "AddToMetric";

Method OnRequest(pRequest As Ens.Request, Output pResponse As Ens.Response) As %Status
{

	Set $ZT="Trap",tSC=$$$OK
	
	$$$TRACE("Start BP EcareRouting")
	s tClassName=pRequest.%ClassName(1)
	
	$$$TRACE("ClassName : "_pRequest.%ClassName(1))
	$$$TRACE("SourceConfigName : "_..%PrimaryRequestHeader.SourceConfigName)
	$$$TRACE("TargetConfigName : "_..%PrimaryRequestHeader.TargetConfigName)
	
	//-- Ecare -----------------------------------------------------------------------------------------------
	if (tClassName="CHUBXL.MSG.HL7EcareFile") {
		$$$TRACE("Routing Msg "_tClassName)
				
		;=> Quadrat Mediweb
		s tSC = ##class(CHUBXL.DT.ResultEcareToHL7FILE).Transform(pRequest.HL7,.HL7Msg)  Quit:$$$ISERR(tSC) tSC
		s pRequest.HL7=HL7Msg
		
		s tHop=pRequest.HL7.GetValueAt("PIDgrpgrp(1).PIDgrp.PV1grp.PV1:HospitalService",,.tSC)
		i tHop="" s tHop=26
		s OBXStatus=pRequest.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:ObservationResultStatus",,.tSC)
		s ndosm=pRequest.HL7.GetValueAt("PIDgrpgrp(1).PIDgrp.PID:PatientIDInternalID(1).ID",,.tSC)
		$$$TRACE("***** OBX Status %%% : "_tSC)
		s nadm=pRequest.HL7.GetValueAt("PIDgrpgrp(1).PIDgrp.PV1grp.PV1:VisitNumber",,.tSC)

		$$$TRACE("***** OBX Status : "_OBXStatus_"*"_pRequest.HL7.FindSegmentValues("PID:3"))
		$$$TRACE("***** N° dossier : "_ndosm_" ++++ "_pRequest.HL7.GetValueAt("PIDgrpgrp(1).PIDgrp.PID:PatientID.ID",,.tSC))
		$$$TRACE("***** N° adminis : "_nadm_" ++++ "_pRequest.HL7.GetValueAt("PIDgrpgrp(1).PIDgrp.PID:PatientIdentifierList().ID",,.tSC))
		
		if (tHop="26") {
			if (ndosm'="") & (ndosm'=nadm) {
			   s tSC = ..SendRequestAsync("EcareAgfaBruDocHl7FcpOut",pRequest)  Quit:$$$ISERR(tSC) tSC
			   s tSC = ..SendRequestAsync("EcareBdocBruDocHl7FcpOut",pRequest)  Quit:$$$ISERR(tSC) tSC
			   $$$TRACE("Msg sent to BDoc Brugmann")
			}
		}
		Else {
			;s tSC = ..SendRequestAsync("EcareagfaHudDocHl7FcpOut",pRequest)  Quit:$$$ISERR(tSC) tSC
			;$$$TRACE("Msg sent to BDoc Huderf")
		}
		
		;=> Allgeier Medical Viewer
		
		s reStatus="",reStatus2=""
		s reStatus=pRequest.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(1).OBR:ResultStatus",,.tSC)
		i (pRequest.HL7.SegCount > 7 ) 	s reStatus2=pRequest.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(2).OBR:ResultStatus",,.tSC)
		
		$$$TRACE("EcareRouting HL7 ResultStatus (1): "_reStatus)
		$$$TRACE("EcareRouting HL7 ResultStatus (2): "_reStatus2)
		$$$TRACE("EcareRouting SegCount: "_pRequest.HL7.SegCount)
		
		if (reStatus="F"){			
			$$$TRACE("EcareRouting reStatus :"_reStatus)
			s tSC=##class(CHUBXL.DT.ResultEcareToMv).Transform(pRequest.HL7,.MvMsg)  Quit:$$$ISERR(tSC) tSC
			//d pRequest.File.Rewind()	
			s stat = MvMsg.Blob.CopyFrom(pRequest.File)
			s tSC($G(MvMsg)'="") =..SendRequestAsync("EcareMvAllDocHl7FcpOut",MvMsg)  Quit:$$$ISERR(tSC) tSC		
			$$$TRACE("Msg sent to Medical Viewer")
		}
		
		if (reStatus2)="F" {			
			$$$TRACE("EcareRouting reStatus2 :"_reStatus2)
			s tSC=##class(CHUBXL.DT.ResultEcareToMv).Transform(pRequest.HL7,.MvMsg)  Quit:$$$ISERR(tSC) tSC
			//d pRequest.File.Rewind()	
			s stat = MvMsg.Blob.CopyFrom(pRequest.File)
			s tSC($G(MvMsg)'="") =..SendRequestAsync("EcareMvAllDocHl7FcpOut",MvMsg)  Quit:$$$ISERR(tSC) tSC		
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
<Data name="EcareRoutingDefaultData">
<Subscript>"EcareRouting"</Subscript>
<Value name="1">
<Value>AddToMetric</Value>
</Value>
</Data>
<DefaultData>EcareRoutingDefaultData</DefaultData>
<Type>%Library.CacheStorage</Type>
}

}
