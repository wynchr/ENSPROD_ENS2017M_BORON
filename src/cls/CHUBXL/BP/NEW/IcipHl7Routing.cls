Class CHUBXL.BP.NEW.IcipHl7Routing Extends Ens.BusinessProcess [ ClassType = persistent, ProcedureBlock ]
{

/*
--------------------------------------------------------------------------------------------------------------------------------
DESCRIPTION
-----------
BP ICIP HL7 (MV)

VERSION
-------
CWY	24/07/2018	Initial Version
CWY	01/08/2018	Add comment

REQUEST
-------
	Ens.Request

SOURCE
------
	ICIP

DESTINATION
-----------
	MV
	
MESSAGES
--------
	CHUBXL.MSG.HL7ICIPFile

PROCESS
-------	
	CHUBXL.MSG.HL7ICIPFile
		CHUBXL.DT.ResultICIPToHL7FILE
		
		reStatus="F"	
			CHUBXL.DT.ResultICIPToMv	=> IcipMvHudDocHl7FcpOut	
		reStatus2="F" 		
			CHUBXL.DT.ResultICIPToMv	=> IcipMvHudDocHl7FcpOut								
											
OPTIMISATION
------------
- Why CHUBXL.DT.ResultICIPToHL7FILE + CHUBXL.DT.ResultICIPToMv

SOURCE
------
CHUBXL.BP.ICIPRouting

--------------------------------------------------------------------------------------------------------------------------------
*/
Property AddToMetric As %Boolean [ InitialExpression = 1 ];

Parameter SETTINGS = "AddToMetric";

Method OnRequest(pRequest As Ens.Request, Output pResponse As Ens.Response) As %Status
{
	Set $ZT="Trap",tSC=$$$OK
	
	$$$TRACE("Start BP ICIPRouting")
	s tClassName=pRequest.%ClassName(1)
	
	$$$TRACE("ClassName : "_pRequest.%ClassName(1))
	$$$TRACE("SourceConfigName : "_..%PrimaryRequestHeader.SourceConfigName)
	$$$TRACE("TargetConfigName : "_..%PrimaryRequestHeader.TargetConfigName)
	
	//------------------------------
	// Test Source
	//------------------------------
	
	if (tClassName="CHUBXL.MSG.HL7ICIPFile") {
		$$$TRACE("Routing Msg "_tClassName)
		
		// CWY Why this ???		
		s tSC = ##class(CHUBXL.DT.ResultICIPToHL7FILE).Transform(pRequest.HL7,.HL7Msg)  Quit:$$$ISERR(tSC) tSC
		s pRequest.HL7=HL7Msg

		// =====================>  Medical Viewer =========================
		
		s reStatus="",reStatus2=""
		s reStatus=pRequest.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(1).OBR:ResultStatus",,.tSC)
		i (pRequest.HL7.SegCount > 7 ) 	s reStatus2=pRequest.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(2).OBR:ResultStatus",,.tSC)
		
		$$$TRACE("ICIPRouting HL7 ResultStatus (1): "_reStatus)
		$$$TRACE("ICIPRouting HL7 ResultStatus (2): "_reStatus2)
		$$$TRACE("ICIPRouting SegCount: "_pRequest.HL7.SegCount)
		
		if (reStatus="F"){			
			$$$TRACE("ICIPRouting reStatus :"_reStatus)
			s tSC=##class(CHUBXL.DT.ResultICIPToMv).Transform(pRequest.HL7,.MvMsg)  Quit:$$$ISERR(tSC) tSC
			d pRequest.File.Rewind()	
			s stat = MvMsg.Blob.CopyFrom(pRequest.File)
			s tSC($G(MvMsg)'="") =..SendRequestAsync("IcipMvHudDocHl7FcpOut",MvMsg)  Quit:$$$ISERR(tSC) tSC		
			$$$TRACE("Msg sent to Medical Viewer")
		}
		
		if (reStatus2)="F" {			
			$$$TRACE("ICIPRouting reStatus2 :"_reStatus2)
			s tSC=##class(CHUBXL.DT.ResultICIPToMv).Transform(pRequest.HL7,.MvMsg)  Quit:$$$ISERR(tSC) tSC
			d pRequest.File.Rewind()	
			s stat = MvMsg.Blob.CopyFrom(pRequest.File)
			s tSC($G(MvMsg)'="") =..SendRequestAsync("IcipMvHudDocHl7FcpOut",MvMsg)  Quit:$$$ISERR(tSC) tSC		
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
<Data name="IcipHl7RoutingDefaultData">
<Subscript>"IcipHl7Routing"</Subscript>
<Value name="1">
<Value>AddToMetric</Value>
</Value>
</Data>
<DefaultData>IcipHl7RoutingDefaultData</DefaultData>
<Type>%Library.CacheStorage</Type>
}

}
