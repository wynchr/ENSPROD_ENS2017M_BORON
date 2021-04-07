Class CHUBXL.BP.NEW.OphtalmoHl7Routing Extends Ens.BusinessProcess [ ClassType = persistent, ProcedureBlock ]
{

/*
--------------------------------------------------------------------------------------------------------------------------------
DESCRIPTION
-----------
BP OPHTALMO HL7

VERSION
-------
CWY	24/07/2018	Initial Version
CWY	01/08/2018	Add comment

REQUEST
-------
	Ens.Request

SOURCE
------
	OPHTALMO

DESTINATION
-----------
	MV

MESSAGES
--------
	CHUBXL.MSG.HL7OphtalmoFile

PROCESS
-------	
	CHUBXL.MSG.HL7OphtalmoFile
		CHUBXL.DT.ResultOphtalmoToHL7FILE
		
		reStatus="F"	
			CHUBXL.DT.ResultOphtalmoToMv	=> OphtalmoMvAllDocHl7FcpOut	
		reStatus2="F" 		
			CHUBXL.DT.ResultOphtalmoToMv	=> OphtalmoMvAllDocHl7FcpOut								
											
OPTIMISATION
------------
- Why CHUBXL.DT.ResultOphtalmoToHL7FILE + CHUBXL.DT.ResultOphtalmoToMv


SOURCE
------
CHUBXL.BP.OphtalmoRouting

--------------------------------------------------------------------------------------------------------------------------------
*/
Property AddToMetric As %Boolean [ InitialExpression = 1 ];

Parameter SETTINGS = "AddToMetric";

Method OnRequest(pRequest As Ens.Request, Output pResponse As Ens.Response) As %Status
{

	Set $ZT="Trap",tSC=$$$OK
	
	$$$TRACE("Start BP OphtalmoRouting")
	s tClassName=pRequest.%ClassName(1)
	
	$$$TRACE("ClassName : "_pRequest.%ClassName(1))
	$$$TRACE("SourceConfigName : "_..%PrimaryRequestHeader.SourceConfigName)
	$$$TRACE("TargetConfigName : "_..%PrimaryRequestHeader.TargetConfigName)
	
	//------------------------------
	// Test Source
	//------------------------------
	
	if (tClassName="CHUBXL.MSG.HL7OphtalmoFile") {
		$$$TRACE("Routing Msg "_tClassName)

		// CWY Why this ???		
		s tSC = ##class(CHUBXL.DT.ResultOphtalmoToHL7FILE).Transform(pRequest.HL7,.HL7Msg)  Quit:$$$ISERR(tSC) tSC
		s pRequest.HL7=HL7Msg
		s Instance=$p($SYSTEM,":",2)
		
		// =====================>  Medical Viewer =========================
		
		s reStatus="",reStatus2=""
		s reStatus=pRequest.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(1).OBR:ResultStatus",,.tSC)
		i (pRequest.HL7.SegCount > 7 ) 	s reStatus2=pRequest.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(2).OBR:ResultStatus",,.tSC)
		
		$$$TRACE("OphtalmoRouting HL7 ResultStatus (1): "_reStatus)
		$$$TRACE("OphtalmoRouting HL7 ResultStatus (2): "_reStatus2)
		$$$TRACE("OphtalmoRouting SegCount: "_pRequest.HL7.SegCount)
		$$$TRACE("Hopital : "_pRequest.HL7.GetValueAt("MSH:ReceivingFacility.namespaceID",,.tSC))
		
		if (pRequest.HL7.GetValueAt("MSH:ReceivingFacility.namespaceID",,.tSC)="BRUGMANN") {
		   i (Instance="ENS2017M") s tSC = ..SendRequestAsync("OphtalmoBdocBruDocHl7FcpOut",pRequest)  Quit:$$$ISERR(tSC) tSC
		   $$$TRACE("Msg sent to BDoc Brugmann")
		}
		
		if (reStatus="F"){			
			$$$TRACE("OphtalmoRouting reStatus :"_reStatus)
			s tSC=##class(CHUBXL.DT.ResultOphtalmoToMv).Transform(pRequest.HL7,.MvMsg)  Quit:$$$ISERR(tSC) tSC
			d pRequest.File.Rewind()	
			s stat = MvMsg.Blob.CopyFrom(pRequest.File)
			$$$TRACE("pRequest.File : "_pRequest.File)
			s tSC($G(MvMsg)'="") =..SendRequestAsync("OphtalmoMvAllDocHl7FcpOut",MvMsg)  Quit:$$$ISERR(tSC) tSC		
			$$$TRACE("Msg sent to Medical Viewer")
		}
		
		if (reStatus2)="F" {			
			$$$TRACE("OphtalmoRouting reStatus2 :"_reStatus2)
			s tSC=##class(CHUBXL.DT.ResultOphtalmoToMv).Transform(pRequest.HL7,.MvMsg)  Quit:$$$ISERR(tSC) tSC
			d pRequest.File.Rewind()	
			s stat = MvMsg.Blob.CopyFrom(pRequest.File)
			s tSC($G(MvMsg)'="") =..SendRequestAsync("OphtalmoMvAllDocHl7FcpOut",MvMsg)  Quit:$$$ISERR(tSC) tSC		
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
<Data name="OphtalmoHl7RoutingDefaultData">
<Subscript>"OphtalmoHl7Routing"</Subscript>
<Value name="1">
<Value>AddToMetric</Value>
</Value>
</Data>
<DefaultData>OphtalmoHl7RoutingDefaultData</DefaultData>
<Type>%Library.CacheStorage</Type>
}

}
