Class CHUBXL.BP.NEW.DentAdminDocHl7Routing Extends Ens.BusinessProcess [ ClassType = persistent, ProcedureBlock ]
{

/*
--------------------------------------------------------------------------------------------------------------------------------
DESCRIPTION
-----------
BP DentAdmin HL7

VERSION
-------
CWY	24/07/2018	Initial Version
CWY	31/07/2018	Add comment
DAM	09/08/2019	DentAdmin

REQUEST
-------
	Ens.Request

SOURCE
------
	DentAdmin
		CHUBXL.MSG.HL7DentAdminFile 

DESTINATION
-----------
	BDOC,MV	

MESSAGES
--------
	CHUBXL.MSG.HL7DentAdminFile

PROCESS
-------	
	BRUGMANN
		CHUBXL.DT.ResultDentAdminToHL7FILE	=> DentAdminBdocBruDocHl7FcpOut
		
		MV :
		
		reStatus="F"
			CHUBXL.DT.ResultDentAdminToMv	=> DentAdminMvAllDocHl7FcpOut

OPTIMISATION
------------
- Why test hop only for Bdoc ???

SOURCE
------
CHUBXL.BP.EcareRouting

--------------------------------------------------------------------------------------------------------------------------------
*/
/// Automatic Metric
Property AddToMetric As %Boolean [ InitialExpression = 1 ];

Parameter SETTINGS = "AddToMetric";

Method OnRequest(pRequest As Ens.Request, Output pResponse As Ens.Response) As %Status
{

	Set $ZT="Trap",tSC=$$$OK
	
	$$$TRACE("Start BP DentAdminRouting")
	s tClassName=pRequest.%ClassName(1)
	
	$$$TRACE("ClassName : "_pRequest.%ClassName(1))
	$$$TRACE("SourceConfigName : "_..%PrimaryRequestHeader.SourceConfigName)
	$$$TRACE("TargetConfigName : "_..%PrimaryRequestHeader.TargetConfigName)
	s Instance=$p($SYSTEM,":",2)
	
	//------------------------------
	// Test Source
	//------------------------------
	
	if (tClassName="CHUBXL.MSG.HL7DentAdminFile") {
		$$$TRACE("Routing Msg "_tClassName)
				
		// =====> BDOC ==================
		s tSC = ##class(CHUBXL.DT.ResultDentAdminToHL7FILE).Transform(pRequest.HL7,.HL7Msg)  Quit:$$$ISERR(tSC) tSC
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
		$$$TRACE("***** N° hop : "_tHop_" ++++ "_pRequest.HL7.GetValueAt("PIDgrpgrp(1).PIDgrp.PV1grp.PV1:HospitalService",,.tSC))
		
		if (tHop="26") {
			if (ndosm'="") & (ndosm'=nadm) {
			   i (Instance="ENS2017TEST") ! (Instance="ENS2017M") s tSC = ..SendRequestAsync("DentAdminBdocBruDocHl7FcpOut",pRequest)  Quit:$$$ISERR(tSC) tSC
			   $$$TRACE("Msg sent to BDoc Brugmann")
			}
		}
		
		// =====> Medical Viewer ==================
		
		s reStatus="",reStatus2=""
		s reStatus=pRequest.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(1).OBR:ResultStatus",,.tSC)
		i (pRequest.HL7.SegCount > 7 ) 	s reStatus2=pRequest.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(2).OBR:ResultStatus",,.tSC)
		
		$$$TRACE("DentAdminRouting HL7 ResultStatus (1): "_reStatus)
		$$$TRACE("DentAdminRouting SegCount: "_pRequest.HL7.SegCount)
		
		if (reStatus="F"){			
			$$$TRACE("DentAdminRouting reStatus :"_reStatus)
			s tSC=##class(CHUBXL.DT.ResultDentAdminToMv).Transform(pRequest.HL7,.MvMsg)  Quit:$$$ISERR(tSC) tSC
			s stat = MvMsg.Blob.CopyFrom(pRequest.File)
			s tSC($G(MvMsg)'="") =..SendRequestAsync("DentAdminMvAllDocHl7FcpOut",MvMsg)  Quit:$$$ISERR(tSC) tSC		
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
<Data name="DentAdminDocHl7RoutingDefaultData">
<Subscript>"DentAdminDocHl7Routing"</Subscript>
<Value name="1">
<Value>AddToMetric</Value>
</Value>
</Data>
<DefaultData>DentAdminDocHl7RoutingDefaultData</DefaultData>
<Type>%Library.CacheStorage</Type>
}

}
