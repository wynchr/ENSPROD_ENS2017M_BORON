Class CHUBXL.BP.NEW.OxygenHl7Routing Extends Ens.BusinessProcess [ ClassType = persistent, ProcedureBlock ]
{

/*
--------------------------------------------------------------------------------------------------------------------------------
DESCRIPTION
-----------
BP OXYGEN HL7

VERSION
-------
CWY	24/07/2018	Initial Version
CWY	01/08/2018	Add comment

REQUEST
-------
	Ens.Request

SOURCE
------
	OXYGEN

DESTINATION
-----------
	BDOC, MV

MESSAGES
--------
	CHUBXL.MSG.HL7KineFile

PROCESS
-------	
		// =====================>  BDOC =========================
		
		BRUGMANN
				=> OxygenBdocBruDocHl7FcpOut
		HUDERF
				=> OxygenBdocHudDocHl7FcpOut
		
		// =====================>  Medical Viewer =========================
		
		reStatus="F"		
				CHUBXL.DT.ResultKineToMv
						=> OxygenMvAllDocHl7FcpOut
		reStatus2="F" 
				CHUBXL.DT.ResultKineToMv
						=> OxygenMvAllDocHl7FcpOut							
											
OPTIMISATION
------------


SOURCE
------
CHUBXL.BP.KineRouting

--------------------------------------------------------------------------------------------------------------------------------
*/
Property AddToMetric As %Boolean [ InitialExpression = 1 ];

Parameter SETTINGS = "AddToMetric";

Method OnRequest(pRequest As Ens.Request, Output pResponse As Ens.Response) As %Status
{

	Set $ZT="Trap",tSC=$$$OK
	
	$$$TRACE("Start BP KineRouting")
	s tClassName=pRequest.%ClassName(1)
	
	$$$TRACE("ClassName : "_pRequest.%ClassName(1))
	$$$TRACE("SourceConfigName : "_..%PrimaryRequestHeader.SourceConfigName)
	$$$TRACE("TargetConfigName : "_..%PrimaryRequestHeader.TargetConfigName)
	
	//------------------------------
	// Test Source
	//------------------------------
	
	if (tClassName="CHUBXL.MSG.HL7KineFile") {
		$$$TRACE("Routing Msg "_tClassName)
		
		s tHop=##class(CHUBXL.DT.Utils).getNHop(pRequest.HL7.GetValueAt("PIDgrpgrp(1).PIDgrp.PID:PatientIDExternalID.ID",,.tSC))

		// =====================>  BDOC =========================
		
		if (tHop="26") {
			s tSC = ..SendRequestAsync("OxygenBdocBruDocHl7FcpOut",pRequest)  Quit:$$$ISERR(tSC) tSC
			$$$TRACE("Msg sent to DPI Brugmann")
		}
		Else {
			s tSC = ..SendRequestAsync("OxygenBdocHudDocHl7FcpOut",pRequest)  Quit:$$$ISERR(tSC) tSC
			$$$TRACE("Msg sent to DPI Huderf")
		}
		
		// =====================> MV =========================
		
		s reStatus="",reStatus2=""
		s reStatus=pRequest.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(1).OBR:ResultStatus",,.tSC)
		i (pRequest.HL7.SegCount > 7 ) 	s reStatus2=pRequest.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(2).OBR:ResultStatus",,.tSC)
		
		$$$TRACE("KineRouting HL7 ResultStatus (1): "_reStatus)
		$$$TRACE("KineRouting HL7 ResultStatus (2): "_reStatus2)
		$$$TRACE("KineRouting SegCount: "_pRequest.HL7.SegCount)
		
		if (reStatus="F"){			
			$$$TRACE("KineRouting reStatus :"_reStatus)
			s tSC=##class(CHUBXL.DT.ResultKineToMv).Transform(pRequest.HL7,.MvMsg)  Quit:$$$ISERR(tSC) tSC
			d pRequest.File.Rewind()	
			s stat = MvMsg.Blob.CopyFrom(pRequest.File)
			$$$TRACE("Stat : "_stat)
			s tSC($G(MvMsg)'="") =..SendRequestAsync("OxygenMvAllDocHl7FcpOut",MvMsg)  Quit:$$$ISERR(tSC) tSC		
			$$$TRACE("Msg sent to Medical Viewer")
		}
		
		if (reStatus2)="F" {			
			$$$TRACE("KineRouting reStatus2 :"_reStatus2)
			s tSC=##class(CHUBXL.DT.ResultKineToMv).Transform(pRequest.HL7,.MvMsg)  Quit:$$$ISERR(tSC) tSC
			d pRequest.File.Rewind()	
			s stat = MvMsg.Blob.CopyFrom(pRequest.File)
			$$$TRACE("Stat : "_stat)
			s tSC($G(MvMsg)'="") =..SendRequestAsync("OxygenMvAllDocHl7FcpOut",MvMsg)  Quit:$$$ISERR(tSC) tSC		
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
<Data name="OxygenHl7RoutingDefaultData">
<Subscript>"OxygenHl7Routing"</Subscript>
<Value name="1">
<Value>AddToMetric</Value>
</Value>
</Data>
<DefaultData>OxygenHl7RoutingDefaultData</DefaultData>
<Type>%Library.CacheStorage</Type>
}

}
