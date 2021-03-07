Class CHUBXL.BP.NEW.InnovianDocHl7Routing Extends Ens.BusinessProcess [ ClassType = persistent, ProcedureBlock ]
{

/*
--------------------------------------------------------------------------------------------------------------------------------
DESCRIPTION
-----------
BP Innovian HL7=>XML (MV)

VERSION
-------
DAM	28/01/2020	Initial Version

REQUEST
-------
	Ens.Request

SOURCE
------
	CHUBXL.MSG.HL7InnovianFile ???
	
DESTINATION
-----------
	MV
	
MESSAGES
--------
	CHUBXL.MSG.HL7InnovianFile

PROCESS
-------
		reStatus "F"			
			CHUBXL.DT.ResultInnovianToMv	=> InnovianMvAllDocHl7FcpOut
			
		reStatus2="F" 		
			CHUBXL.DT.ResultInnovianToMv	=> InnovianMvAllDocHl7FcpOut


OPTIMISATION
------------
- Test Source ??

SOURCE
------
CHUBXL.BP.InnovianHl7Routing

--------------------------------------------------------------------------------------------------------------------------------
*/
Property AddToMetric As %Boolean [ InitialExpression = 1 ];

Parameter SETTINGS = "AddToMetric";

Method OnRequest(pRequest As Ens.Request, Output pResponse As Ens.Response) As %Status
{

	Set $ZT="Trap",tSC=$$$OK
	
	$$$TRACE("Start BP InnovianHudDocRouting")
	s tClassName=pRequest.%ClassName(1)
	
	$$$TRACE("ClassName : "_pRequest.%ClassName(1))
	$$$TRACE("SourceConfigName : "_..%PrimaryRequestHeader.SourceConfigName)
	$$$TRACE("TargetConfigName : "_..%PrimaryRequestHeader.TargetConfigName)
	
	//------------------------------
	// Test Source
	//------------------------------
	
	if (tClassName="CHUBXL.MSG.HL7InnovianFile") {
		$$$TRACE("Routing Msg "_tClassName)
				
		// ==========> Mediweb ===============================================================
		
		s tHop=##class(CHUBXL.DT.Utils).getNHop(pRequest.HL7.GetValueAt("PIDgrpgrp(1).PIDgrp.PID:PatientIdentifierList(1).ID",,.tSC))
		s NewMsgHL7=##class(EnsLib.HL7.Message).%New(),NewMsgHL7.DocType="2.4:ORU_R01"
		s NewMsgHL7=pRequest.HL7
		s NoPrest=pRequest.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:EquipmentInstanceIdentifier(1)",,.tSC)
		s Oper=pRequest.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:ObservationMethod(1)",,.tSC)
		s DtePrest=pRequest.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(1).OBR:ObservationDateTime.timeofanevent",,.tSC)
		s DteVal=pRequest.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(1).OBR:ObservationDateTime",,.tSC)
		$$$TRACE("Message   : "_pRequest.HL7.RawContent)
		$$$TRACE("NoDos     : "_pRequest.HL7.GetValueAt("PIDgrpgrp(1).PIDgrp.PID:PatientIdentifierList(1).ID",,.tSC))
		$$$TRACE("Version   : "_NewMsgHL7.DocType)
		$$$TRACE("Version   : "_pRequest.HL7.DocType)
		$$$TRACE("Date pre. : "_DtePrest)
		$$$TRACE("Médecin   : "_NoPrest)
		$$$TRACE("Operation : "_Oper)
		$$$TRACE("Hopital : "_tHop)
		s NoMed=NewMsgHL7.GetValueAt("PIDgrpgrp().ORCgrp().OBR:PrincipalResultInterpreter",,.tSC)
		
		if (tHop="27") {
		   s tSC = ..SendRequestAsync("InnovianBdocHudDocHl7FcpOut",pRequest)  Quit:$$$ISERR(tSC) tSC
		   $$$TRACE("Msg sent to Bdoc HUDERF")
		}
		
		// ==========> Medical Viewer ===============================================================
		
		s reStatus="",reStatus2=""
		s reStatus=pRequest.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(1).OBR:ResultStatus",,.tSC)
		s DocDate=pRequest.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:DateTimeoftheObservation",,.tSC)
		s Template=pRequest.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:ObservationMethod(1)",,.tSC)
		i (pRequest.HL7.SegCount > 7 ) s reStatus2=pRequest.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(2).OBR:ResultStatus",,.tSC)
		
		$$$TRACE("MonitRouting HL7 ResultStatus (1) : "_reStatus)
		$$$TRACE("MonitRouting HL7 ResultStatus (2) : "_reStatus2)
		$$$TRACE("MonitRouting SegCount  : "_pRequest.HL7.SegCount)
		$$$TRACE("DocDate             	 : "_DocDate)
		$$$TRACE("Template 				 : "_Template)
		
		if (reStatus="F"){			
			$$$TRACE("MonitRouting reStatus :"_reStatus)
			s tSC=##class(CHUBXL.DT.ResultInnovianToMv).Transform(pRequest.HL7,.MvMsg)  Quit:$$$ISERR(tSC) tSC
			d pRequest.File.Rewind()	
			s stat = MvMsg.Blob.CopyFrom(pRequest.File)
			s tSC($G(MvMsg)'="") =..SendRequestAsync("InnovianMvAllDocHl7FcpOut",MvMsg)  Quit:$$$ISERR(tSC) tSC		
			$$$TRACE("Msg sent to Medical Viewer")
		}
		
		if (reStatus2)="F" {			
			$$$TRACE("MonitRouting reStatus2 :"_reStatus2)
			s tSC=##class(CHUBXL.DT.ResultInnovianToMv).Transform(pRequest.HL7,.MvMsg)  Quit:$$$ISERR(tSC) tSC
			d pRequest.File.Rewind()	
			s stat = MvMsg.Blob.CopyFrom(pRequest.File)
			s tSC($G(MvMsg)'="") =..SendRequestAsync("InnovianMvAllDocHl7FcpOut",MvMsg)  Quit:$$$ISERR(tSC) tSC		
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
<Data name="InnovianDocHl7RoutingDefaultData">
<Subscript>"InnovianDocHl7Routing"</Subscript>
<Value name="1">
<Value>AddToMetric</Value>
</Value>
</Data>
<DefaultData>InnovianDocHl7RoutingDefaultData</DefaultData>
<Type>%Library.CacheStorage</Type>
}

}
