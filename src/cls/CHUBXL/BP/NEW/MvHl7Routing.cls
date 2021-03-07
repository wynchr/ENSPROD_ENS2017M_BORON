Class CHUBXL.BP.NEW.MvHl7Routing Extends Ens.BusinessProcess [ ClassType = persistent, ProcedureBlock ]
{

/*
--------------------------------------------------------------------------------------------------------------------------------
DESCRIPTION
-----------
BP MV HL7 (BDOC)
VERSION
-------
CWY	24/07/2018	Initial Version
CWY	01/08/2018	Add comment

REQUEST
-------
	EnsLib.HL7.Message

SOURCE
------
	MV

DESTINATION
-----------
	BDOC

MESSAGES
--------
	CHUBXL.MSG.HL7MOSOSFile

PROCESS
-------	
	MvAllArcHl7TcpIn
		BRUGMANN
			Tree'=10,Tree0'=202009,Tree0'=202209,Tree0'=202008709,Tree0'=955109 
			  		=> MvBdocBruArcHl7TcpOut
			  		=> MvBdocBruArcHl7TcpFwd
		
		HUDERF
			Tree'=10,Tree0'=202009,Tree0'=202209,Tree0'=202008709,Tree0'=955109 
			  		=> MvBdocHudArcHl7TcpOut
			  		=> MvBdocHudArcHl7TcpFwd					
											
OPTIMISATION
------------
- conversion ^CHUBXL.ConvArboBDoc
- Quid Tree'=10,Tree0'=202009,Tree0'=202209,Tree0'=202008709,Tree0'=955109 

SOURCE
------
CHUBXL.BP.MVHL7Routing

--------------------------------------------------------------------------------------------------------------------------------
*/
Property AddToMetric As %Boolean [ InitialExpression = 1 ];

Parameter SETTINGS = "AddToMetric";

Method OnRequest(pRequest As EnsLib.HL7.Message, Output pResponse As Ens.Response) As %Status
{
	Set $ZTrap = "ErrorTrap", tSC=$$$OK	

	$$$TRACE("Start BP MvHl7Routing")

	s tClassName = pRequest.%ClassName(1)
	s tSourceConfigName = ..%PrimaryRequestHeader.SourceConfigName
	s tTargetConfigName = ..%PrimaryRequestHeader.TargetConfigName
	
	$$$TRACE("ClassName : "_tClassName)
	$$$TRACE("SourceConfigName : "_tSourceConfigName)
	$$$TRACE("TargetConfigName : "_tTargetConfigName)

	//------------------------------
	// Test Source
	//------------------------------
	
	If (tSourceConfigName = "MvAllArcHl7TcpIn" ) {
		
		s tSC = ..SendRequestAsync("MvBdocAllArcHl7TcpFwdPrep",pRequest)  Quit:$$$ISERR(tSC) tSC
		
    	s NewMessHL7Out=##class(EnsLib.HL7.Message).%New(),NewMessHL7Out.DocType="2.3:ORU_R01"
    	
    	s MSH=pRequest.FindSegmentValues("MSH") $$$TRACE("MSH : "_MSH)
		s PID=pRequest.FindSegmentValues("PID") $$$TRACE("PID : "_PID)
		s PV1=pRequest.FindSegmentValues("PV1") $$$TRACE("PV1 : "_PV1)
		s ORC=pRequest.FindSegmentValues("ORC") $$$TRACE("ORC : "_ORC)
		s OBR=pRequest.FindSegmentValues("OBR") $$$TRACE("OBR : "_OBR)
		s OBX=pRequest.FindSegmentValues("OBX") $$$TRACE("OBX : "_OBX)
		
		i MSH'="" s tSC1=NewMessHL7Out.SetValueAt(MSH,"MSH")
		i PID'="" s tSC1=NewMessHL7Out.SetValueAt(PID,"PIDgrpgrp(1).PIDgrp.PID")
		i $tr($p(PV1,"|",20)," ")'="" s tSC1=NewMessHL7Out.SetValueAt(PV1,"PIDgrpgrp(1).PIDgrp.PV1grp.PV1")
		i ORC'="" s tSC1=NewMessHL7Out.SetValueAt(ORC,"PIDgrpgrp(1).ORCgrp(1).ORC")
		i OBR'="" s tSC1=NewMessHL7Out.SetValueAt(OBR,"PIDgrpgrp(1).ORCgrp(1).OBR")
		i OBX'="" s tSC1=NewMessHL7Out.SetValueAt(OBX,"PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX")
		
		s NHop=##class(CHUBXL.DT.Utils).getNHop(pRequest.FindSegmentValues("PID:3"))
		
		s Tree0=pRequest.FindSegmentValues("OBR:21.1.1")
		s Tree=$e(pRequest.FindSegmentValues("OBR:21.1.1"),1,2)
		s Doc=pRequest.FindSegmentValues("OBR:4")
		i $tr(Doc," ")'="",'$d(^CHUBXL.ConvArboBDoc(NHop,Doc)) {
		  s Doc=$p(pRequest.FindSegmentValues("OBR:21"),"~",1)
		}
		i $tr(Doc," ")="" {
		  s Doc=$p(pRequest.FindSegmentValues("OBR:21"),"~",1)
		}
		s Scan=pRequest.FindSegmentValues("OBR:19")
		s obr20=pRequest.FindSegmentValues("OBR:20")
		
	    i $tr(Doc," ")'="" {
		  ;$$$TRACE("HL7Msg : "_pRequest.RawContent)
		  ;$$$TRACE("Groupe 1 : "_Tree)
		  ;$$$TRACE("Doc : "_Doc)
	      ;$$$TRACE("NHop : "_NHop)
		  s rec=$g(^CHUBXL.ConvArboBDoc(NHop,Doc))
		  s NewRec="^"_$tr(Doc,"^","°")_"^"_$tr($p(rec,"~",1,3),"~","^")
		  ;$$$TRACE("TagAgfa : *"_Doc_"*")
		  ;$$$TRACE("TagAgfa rec : *"_rec_"*")
		  ;$$$TRACE("TagAgfa NewRec : *"_"^"_Doc_"^"_$tr($p(rec,"~",1,3),"~","^")_"*")
		  d NewMessHL7Out.SetValueAt(NewRec,"PIDgrpgrp(1).ORCgrp(1).OBR:4")
		  d NewMessHL7Out.SetValueAt($p(rec,"~",4),"PIDgrpgrp(1).ORCgrp(1).OBR:18")
		  d NewMessHL7Out.SetValueAt($p(rec,"~",5),"PIDgrpgrp(1).ORCgrp(1).OBR:19")
		  d NewMessHL7Out.SetValueAt(Scan_"~"_obr20,"PIDgrpgrp(1).ORCgrp(1).OBR:20")
		  $$$TRACE("HL7Msg : "_NewMessHL7Out.RawContent)
	    }
	    i $tr(pRequest.FindSegmentValues("OBR:3")," ")="" {
		  d NewMessHL7Out.SetValueAt(pRequest.FindSegmentValues("OBX:5"),"PIDgrpgrp(1).ORCgrp(1).OBR:3")
		}
		s statut=pRequest.FindSegmentValues("OBR:25")
		s dtedoc=pRequest.FindSegmentValues("OBR:7")
		$$$TRACE("statut : "_statut_"*"_NHop_"*"_pRequest.FindSegmentValues("OBR:7")_"*")
		
		// BRUGMANN
		i NHop=26,Tree'=10,Tree0'=202009,Tree0'=202209,Tree0'=202008709,Tree0'=955109 {
		  s NoDos=pRequest.FindSegmentValues("PID:3")
		  i $l(NoDos)<9 d NewMessHL7Out.SetValueAt($tr($j(NoDos,9)," ","0"),"PIDgrpgrp().PIDgrp.PID:PatientIDInternalID()")
		  i Doc=407459,dtedoc=19010101 d NewMessHL7Out.SetValueAt("Ancien dossier papier","PIDgrpgrp(1).ORCgrp(1).OBR:4.5")
		  s tSC = ..SendRequestAsync("MvBdocBruArcHl7TcpOut",NewMessHL7Out)  Quit:$$$ISERR(tSC) tSC
		  ;s tSC = ..SendRequestAsync("MvBdocBruArcHl7TcpFwd",NewMessHL7Out)  Quit:$$$ISERR(tSC) tSC
		  $$$TRACE("Msg sent to DPI")
		}
		
		// HUDERF
		i NHop=27,Tree'=10,Tree0'=202009,Tree0'=202209,Tree0'=202008709,Tree0'=955109 {
		  s tSC = ..SendRequestAsync("MvBdocHudArcHl7TcpOut",NewMessHL7Out)  Quit:$$$ISERR(tSC) tSC
		  ;s tSC = ..SendRequestAsync("MvBdocHudArcHl7TcpFwd",NewMessHL7Out)  Quit:$$$ISERR(tSC) tSC
		  $$$TRACE("Msg sent to DPI")
		}		
	}
	Else {
		$$$LOGWARNING("Unsupported message received :"_tSourceConfigName)
	}
					
Exit	
	Quit tSC

ErrorTrap
 
 	Set $ZTrap = ""
 	Write $ZError,!
 	$$$TRACE("Error BP - MVMB : "_$ZError)
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
<Data name="MvHl7RoutingDefaultData">
<Subscript>"MvHl7Routing"</Subscript>
<Value name="1">
<Value>AddToMetric</Value>
</Value>
</Data>
<DefaultData>MvHl7RoutingDefaultData</DefaultData>
<Type>%Library.CacheStorage</Type>
}

}
