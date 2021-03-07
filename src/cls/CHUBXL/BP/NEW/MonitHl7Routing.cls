Class CHUBXL.BP.NEW.MonitHl7Routing Extends Ens.BusinessProcess [ ClassType = persistent, ProcedureBlock ]
{

/*
--------------------------------------------------------------------------------------------------------------------------------
DESCRIPTION
-----------
BP Monitoring HL7=>XML (MV)

VERSION
-------
DAM	28/01/2020	Initial Version

REQUEST
-------
	Ens.Request

SOURCE
------
	Monit
		CHUBXL.MSG.HL7MonitFile ???
	
DESTINATION
-----------
	MV
	
MESSAGES
--------
	CHUBXL.MSG.HL7MonitFile

PROCESS
-------
		reStatus "F"			
			CHUBXL.DT.ResultMonitToMv	=> MonitMvAllDocHl7FcpOut
			
		reStatus2="F" 		
			CHUBXL.DT.ResultMonitToMv	=> MonitMvAllDocHl7FcpOut


OPTIMISATION
------------
- Test Source ??

SOURCE
------
CHUBXL.BP.MonitHl7Routing

--------------------------------------------------------------------------------------------------------------------------------
*/
Property AddToMetric As %Boolean [ InitialExpression = 1 ];

Parameter SETTINGS = "AddToMetric";

Method OnRequest(pRequest As Ens.Request, Output pResponse As Ens.Response) As %Status
{

	Set $ZT="Trap",tSC=$$$OK
	
	$$$TRACE("Start BP MonitHl7Routing")
	s tClassName=pRequest.%ClassName(1)
	
	$$$TRACE("ClassName : "_pRequest.%ClassName(1))
	$$$TRACE("SourceConfigName : "_..%PrimaryRequestHeader.SourceConfigName)
	$$$TRACE("TargetConfigName : "_..%PrimaryRequestHeader.TargetConfigName)
	
	//------------------------------
	// Test Source
	//------------------------------
	
	if (tClassName="CHUBXL.MSG.HL7MonitFile") {
		$$$TRACE("Routing Msg "_tClassName)
				
		// ==========> Mediweb ===============================================================
		
		s tHop=pRequest.HL7.GetValueAt("PIDgrpgrp(1).PIDgrp.PV1grp.PV1:HospitalService",,.tSC)
		
		if (tHop="26") {
		   s tSC = ..SendRequestAsync("MonitBdocBruDocHl7FcpOut",pRequest)  Quit:$$$ISERR(tSC) tSC
		   $$$TRACE("Msg sent to Quadrat Brugmann")
		}
		Else {
		   s tSC = ..SendRequestAsync("MonitBdocHudDocHl7FcpOut",pRequest)  Quit:$$$ISERR(tSC) tSC
		   $$$TRACE("Msg sent to Quadrat Huderf")
		}
		
		// ==========> Medical Viewer ===============================================================
		
		s reStatus="",reStatus2=""
		s reStatus=pRequest.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(1).OBR:ResultStatus",,.tSC)
		i (pRequest.HL7.SegCount > 7 ) s reStatus2=pRequest.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(2).OBR:ResultStatus",,.tSC)
		
		$$$TRACE("MonitRouting HL7 ResultStatus (1): "_reStatus)
		$$$TRACE("MonitRouting HL7 ResultStatus (2): "_reStatus2)
		$$$TRACE("MonitRouting SegCount: "_pRequest.HL7.SegCount)
		
		if (reStatus="F"){			
			$$$TRACE("MonitRouting reStatus :"_reStatus)
			s tSC=##class(CHUBXL.DT.ResultMonitToMv).Transform(pRequest.HL7,.MvMsg)  Quit:$$$ISERR(tSC) tSC
			d pRequest.File.Rewind()	
			s stat = MvMsg.Blob.CopyFrom(pRequest.File)
			s tSC($G(MvMsg)'="") =..SendRequestAsync("MonitMvAllDocHl7FcpOut",MvMsg)  Quit:$$$ISERR(tSC) tSC		
			$$$TRACE("Msg sent to Medical Viewer")
		}
		
		if (reStatus2)="F" {			
			$$$TRACE("MonitRouting reStatus2 :"_reStatus2)
			s tSC=##class(CHUBXL.DT.ResultMonitToMv).Transform(pRequest.HL7,.MvMsg)  Quit:$$$ISERR(tSC) tSC
			d pRequest.File.Rewind()	
			s stat = MvMsg.Blob.CopyFrom(pRequest.File)
			s tSC($G(MvMsg)'="") =..SendRequestAsync("MonitMvAllDocHl7FcpOut",MvMsg)  Quit:$$$ISERR(tSC) tSC		
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
<Data name="MonitHl7RoutingDefaultData">
<Subscript>"MonitHl7Routing"</Subscript>
<Value name="1">
<Value>AddToMetric</Value>
</Value>
</Data>
<DefaultData>MonitHl7RoutingDefaultData</DefaultData>
<Type>%Library.CacheStorage</Type>
}

}
