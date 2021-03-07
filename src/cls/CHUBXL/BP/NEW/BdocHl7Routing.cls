Class CHUBXL.BP.NEW.BdocHl7Routing Extends Ens.BusinessProcess [ ClassType = persistent, ProcedureBlock ]
{

/*
--------------------------------------------------------------------------------------------------------------------------------
DESCRIPTION
-----------
BP BDOC HL7 (MV)

VERSION
-------
CWY	24/07/2018	Initial Version
CWY	31/07/2018	Add comment

REQUEST
-------
	Ens.Request

SOURCE
------
	BDOC
		CHUBXL.MSG.HL7BDocFile
	ENDOBASE
		CHUBXL.MSG.HL7DPIFile	(ENDOBASE)
	
DESTINATION
-----------
	MV, BDOC
	
MESSAGES
--------
	CHUBXL.MSG.HL7AstraiaFile

PROCESS
-------
		reStatus="F"	
			BRUGMANN
			   CHUBXL.MSG.HL7BDocFile	=> BdocMvAllDocHl7FcpOut

			HUDERF
			    CHUBXL.MSG.HL7BDocFile	=> BdocMvAllDocHl7FcpOut				
				
				ENDOBASE :
				CHUBXL.MSG.HL7DPIFile	=> EndobaseBdocHudDocHl7FcpOut
				CHUBXL.DT.QHL7toQXML	=> EndobaseMvHudDocHl7FcpOut

OPTIMISATION
------------
- difference CHUBXL.MSG.HL7BDocFile & CHUBXL.MSG.HL7DPIFile ofr ENDOBASE ???
- Msg sent to BDoc Brugmann tentative
- Create BP for ENDOBASE

SOURCE
------
CHUBXL.BP.BDocRouting

--------------------------------------------------------------------------------------------------------------------------------
*/
/// Automatic Metric
Property AddToMetric As %Boolean [ InitialExpression = 1 ];

Parameter SETTINGS = "AddToMetric";

Method OnRequest(pRequest As Ens.Request, Output pResponse As Ens.Response) As %Status
{

	Set $ZT="Trap",tSC=$$$OK
	
	$$$TRACE("Start BP BdocHl7Routing")
	s tClassName=pRequest.%ClassName(1)
	
	$$$TRACE("ClassName : "_pRequest.%ClassName(1))
	$$$TRACE("SourceConfigName : "_..%PrimaryRequestHeader.SourceConfigName)
	$$$TRACE("TargetConfigName : "_..%PrimaryRequestHeader.TargetConfigName)
	
	//------------------------------
	// Test Source
	//------------------------------
	
	if (tClassName="CHUBXL.MSG.HL7BDocFile") ! (tClassName="CHUBXL.MSG.HL7DPIFile") ! (tClassName="CHUBXL.MSG.HL7EndobaseFile") {
		$$$TRACE("Routing Msg "_tClassName)
				
		s tHop=+pRequest.HL7.GetValueAt("MSH:SendingFacility.namespaceID",,.tSC)
		
		// =============> Medical Viewer ================================
		
		s reStatus="",reStatus2=""
		s reStatus=pRequest.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(1).OBR:ResultStatus",,.tSC)
	
		$$$TRACE("BDocRouting HL7 ResultStatus (1) : "_reStatus)
		$$$TRACE("BDocRouting HL7 ResultStatus (2) : "_reStatus2)
		$$$TRACE("BDocRouting SegCount : "_pRequest.HL7.SegCount)
		$$$TRACE("BDocRouting pHop : "_tHop)
		
		if (reStatus="F"){		
			if (tHop="26") {
			   $$$TRACE("Msg sent to BDoc Brugmann tentative")
			   i tClassName="CHUBXL.MSG.HL7BDocFile" s tSC = ..SendRequestAsync("BdocMvAllDocHl7FcpOut",pRequest)  Quit:$$$ISERR(tSC) tSC	
			   $$$TRACE("Msg sent to BDoc BRUGMANN")
			}
			if (tHop="27") {
			    $$$TRACE("Msg sent to BDoc HUDERF tentative")
				i tClassName="CHUBXL.MSG.HL7BDocFile" s tSC = ..SendRequestAsync("BdocMvAllDocHl7FcpOut",pRequest)  Quit:$$$ISERR(tSC) tSC
				$$$TRACE("Msg sent to BDoc HUDERF")
				
				
				// ====== ENDOBASE Processing ===============
				
				i tClassName="CHUBXL.MSG.HL7EndobaseFile" {
					s DteExam=$e(pRequest.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(1).OBR:ObservationDateTime.timeofanevent",,.tSC),1,12),NoAdm=""
					s NoDos=pRequest.HL7.GetValueAt("PIDgrpgrp(1).PIDgrp.PID:PatientIdentifierList().ID",,.tSC)
					s tSC1=pRequest.HL7.SetValueAt(pRequest.HL7.GetValueAt("PIDgrpgrp(1).PIDgrp.PV1grp.PV1:VisitNumber.ID",,.tSC),"PIDgrpgrp(1).ORCgrp(1).OBR:CollectorIdentifier().IDnumberST")
					$$$TRACE("Date examen : "_DteExam)
					$$$TRACE("Date N° Dos : "_NoDos)
					
					
					s %rsDB = ##class(%Library.ResultSet).%New()
					s %qDB = ""
    				s %qDB = %qDB_"select * from CHUBXL_db_wish.hosh where cbmrn="_NoDos_" and CBTYPE='I'"
    				s %qDB = %qDB_" and "_DteExam_" between CBADDT and CBDHDT"
    				$$$TRACE("%qDB : "_%qDB)
					s status=%rsDB.Prepare(%qDB)
    				s status=%rsDB.Execute()
    				While (%rsDB.Next()) {
 						s NoAdm=%rsDB.Data("NSEJ")
    				}
    				i NoAdm="" {
					  s %rsDB = ##class(%Library.ResultSet).%New()
					  s %qDB = ""
    				  s %qDB = %qDB_"select * from CHUBXL_db_wish.passageh where vimrn="_NoDos ;4908
					  s status=%rsDB.Prepare(%qDB)
    				  s status=%rsDB.Execute()
    				  While (%rsDB.Next()) {
	    				i $e(%rsDB.Data("VIDTHR"),1,8)=$e(DteExam,1,8) s NoAdm=%rsDB.Data("VINSEJ")_$tr($j(%rsDB.Data("VIPASS"),3)," ","0")
    				  }
    				}
					$$$TRACE("Date examen : "_DteExam)
					$$$TRACE("Date N° Dos : "_NoDos)
					$$$TRACE("Date N° Adm : "_NoAdm)
					i $tr(NoAdm," ")'="" {
						s tSC1=pRequest.HL7.SetValueAt(NoAdm,"PIDgrpgrp(1).PIDgrp.PV1grp.PV1:VisitNumber.ID")
						$$$TRACE("tSC1 : "_tSC1)
					}
					
					
					// ======== ENDOBASE to BDOC
					s tSC = ..SendRequestAsync("EndobaseBdocHudDocHl7FcpOut",pRequest)  Quit:$$$ISERR(tSC) tSC
					$$$TRACE("ENDOBASE Msg sent to Bdoc")
					
					
					s tSC=##class(CHUBXL.DT.QHL7toQXML).Transform(pRequest.HL7,.oMsgXML) Quit:$$$ISERR(tSC) tSC
					s oMsgXML.DocDate=$zd($h,8),oMsgXML.Batch="IFEndoBaseENS",oMsgXML.PrestationDate=$e(DteExam,1,8)
					i $l(NoAdm)<12 s oMsgXML.NumeroAdm=NoAdm,oMsgXML.PassageNr=""
					d pRequest.File.Rewind()	
					s stat = oMsgXML.Blob.CopyFrom(pRequest.File)
					
					// ======== ENDOBASE to MV
					s tSC($G(oMsgXML)'="") =..SendRequestAsync("EndobaseMvHudDocHl7FcpOut",oMsgXML)  Quit:$$$ISERR(tSC) tSC		
					$$$TRACE("ENDOBASE Msg sent to Medical Viewer")
				}
				
			}
			Else {
			}
		}
	}
	
	//-- Unknown message --------------------------------------------------------------------------------------	
	else {
		$$$LOGWARNING("Unsupported message received :"_tClassName)
	}
	
Exit
	Quit $$$OK
Trap
	Set $ZT="",tSC=$$$EnsSystemError Goto Exit
}

Method OnResponse(request As Ens.Request, ByRef response As Ens.Response, callrequest As Ens.Request, callresponse As Ens.Response, pCompletionKey As %String) As %Status
{
	Set response=##class(Ens.StringResponse).%New()
	Quit $$$OK
}

Storage Default
{
<Data name="BdocHl7RoutingDefaultData">
<Subscript>"BdocHl7Routing"</Subscript>
<Value name="1">
<Value>AddToMetric</Value>
</Value>
</Data>
<DefaultData>BdocHl7RoutingDefaultData</DefaultData>
<Type>%Library.CacheStorage</Type>
}

}
