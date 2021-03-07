Class CHUBXL.BP.NEW.DiamicHl7Routing Extends Ens.BusinessProcess [ ClassType = persistent, ProcedureBlock ]
{

/*
--------------------------------------------------------------------------------------------------------------------------------
DESCRIPTION
-----------
BP DIAMIC HL7

VERSION
-------
CWY	24/07/2018	Initial Version
CWY	31/07/2018	Add comment
DAM	18/10/2018	Add DiamicAgfaTestV6BruDocHl7FcpOut

REQUEST
-------
	Ens.Request

SOURCE
------
	DIAMIC
		CHUBXL.MSG.HL7DiamicFile 
	
DESTINATION
-----------
	AGFA, BDOC
	
MESSAGES
--------
	CHUBXL.MSG.HL7DiamicFile

PROCESS
-------
        
		CHUBXL.DT.ResultDiamicToHL7FILE).Transform(pRequest.HL7,.HL7Msg) 

		BRUGMANN
			pRequest	=> DiamicAgfaBruDocHl7FcpOut
			pRequest	=> DiamicAgfaTestV6BruDocHl7FcpOut
			NewMsgDPI	=> DiamicBdocBruDocHl7FcpOut
			NewMsgDPI	=> DiamicBdocBruDocHl7FcpOutPrep (PROD)
			NewMsgDPI	=> DiamicBdocBruDocHl7FcpFwd	 (PREP)

		HUDERF
			pRequest 	=> DiamicAgfaHudDocHl7FcpOut
			NewMsgDPI1 	=> DiamicBdocHudDocHl7FcpOut
			NewMsgDPI1 	=> DiamicBdocHudDocHl7FcpOutPrep (PROD)
			NewMsgDPI1 	=> DiamicBdocHudDocHl7FcpFwd	 (PREP)
		
		Medical Viewer
	
		reStatus="F"			
			CHUBXL.DT.ResultDiamicToMv	=> DiamicMvAllDocHl7FcpOut
		
		reStatus2="F" 
			CHUBXL.DT.ResultDiamicToMv	=> DiamicMvAllDocHl7FcpOut

OPTIMISATION
------------
- Conversion ^CHUBXL.ConvArboBDoc
- msg CHUBXL.MSG.HL7EcareFile ????

SOURCE
------
CHUBXL.BP.DiamicRouting

--------------------------------------------------------------------------------------------------------------------------------
*/
/// Automatic Metric
Property AddToMetric As %Boolean [ InitialExpression = 1 ];

Parameter SETTINGS = "AddToMetric";

Method OnRequest(pRequest As Ens.Request, Output pResponse As Ens.Response) As %Status
{

	Set $ZT="Trap",tSC=$$$OK
	
	$$$TRACE("Start BP DiamicRouting")
	s tClassName=pRequest.%ClassName(1)
	
	$$$TRACE("ClassName : "_pRequest.%ClassName(1))
	$$$TRACE("SourceConfigName : "_..%PrimaryRequestHeader.SourceConfigName)
	$$$TRACE("TargetConfigName : "_..%PrimaryRequestHeader.TargetConfigName)
	s Instance=$p($SYSTEM,":",2)
	
	//------------------------------
	// Test Source
	//------------------------------
	
	if (tClassName="CHUBXL.MSG.HL7DiamicFile") {
		$$$TRACE("Routing Msg "_tClassName)
		K NewMsgDPI,NewMsgDPI0,NewMsgDPI1
		;=> Quadrat Mediweb
        ;$$$TRACE("RawContent : "_pRequest.HL7.RawContent)
        s NewMsgDPI0=##class(CHUBXL.MSG.HL7EcareFile).%New()
		s NewMsgDPI0.File=pRequest.File
		s NewMsgDPI0.HL7=pRequest.HL7
        
		$$$TRACE("DiamicRouting n° dossier         : "_pRequest.HL7.GetValueAt("PIDgrpgrp(1).PIDgrp.PID:PatientIDInternalID(1).ID",,.tSC))
		$$$TRACE("DiamicRouting SegCount           : "_pRequest.HL7.SegCount)
		$$$TRACE("DiamicRouting OrderingProvider   : "_pRequest.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(1).OBR:OrderingProvider(1).IDnumberST",,.tSC))
		s ResCopTo=NewMsgDPI0.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(1).OBR:ResultCopiesTo(1).IDnumberST",,.tSC)
		s OrdPro=NewMsgDPI0.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(1).OBR:OrderingProvider(1).IDnumberST",,.tSC)
		s PriResInt=NewMsgDPI0.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(1).OBR:PrincipalResultInterpreter.name.IDnumberST",,.tSC)
		s ResObs1=NewMsgDPI0.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:ResponsibleObserver.IDnumberST",,.tSC)
		s ResObs2=NewMsgDPI0.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(1).OBXgrp(2).OBX:ResponsibleObserver.IDnumberST",,.tSC)
		s ResObs3=NewMsgDPI0.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(1).OBXgrp(3).OBX:ResponsibleObserver.IDnumberST",,.tSC)
		s ResCopTo2=NewMsgDPI0.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(2).OBR:ResultCopiesTo(1).IDnumberST",,.tSC)
		s OrdPro2=NewMsgDPI0.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(2).OBR:OrderingProvider(1).IDnumberST",,.tSC)
		s PriResInt2=NewMsgDPI0.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(2).OBR:PrincipalResultInterpreter.name.IDnumberST",,.tSC)
		s ResObs21=NewMsgDPI0.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(2).OBXgrp(1).OBX:ResponsibleObserver.IDnumberST",,.tSC)
		s ResObs22=NewMsgDPI0.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(2).OBXgrp(2).OBX:ResponsibleObserver.IDnumberST",,.tSC)
		s ResObs23=NewMsgDPI0.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(2).OBXgrp(3).OBX:ResponsibleObserver.IDnumberST",,.tSC)
		$$$TRACE("DiamicRouting SegCount   : "_ResCopTo_"*"_OrdPro_"*"_PriResInt_"*"_ResObs1_"*"_ResObs2_"*"_ResObs3_"*"_ResCopTo2_"*"_PriResInt2_"*"_ResObs21_"*"_ResObs22_"*"_ResObs23)
        
		s tSC = ##class(CHUBXL.DT.ResultDiamicToHL7FILE).Transform(pRequest.HL7,.HL7Msg)  Quit:$$$ISERR(tSC) tSC
		s pRequest.HL7=HL7Msg
		
		s tHop=pRequest.HL7.GetValueAt("PIDgrpgrp(1).PIDgrp.PV1grp.PV1:HospitalService",,.tSC)
		
		s reStatus="",reStatus2=""
		s reStatus=pRequest.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(1).OBR:ResultStatus",,.tSC)
		i (pRequest.HL7.SegCount > 7 ) 	s reStatus2=pRequest.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(2).OBR:ResultStatus",,.tSC)


		// BRUGMANN
		if (tHop="26") {
			// To AGFA
			i Instance="ENS2017M" s tSC = ..SendRequestAsync("DiamicAgfaBruDocHl7FcpOut",pRequest)  Quit:$$$ISERR(tSC) tSC
			;i Instance="ENS2017M" s tSC = ..SendRequestAsync("DiamicAgfaTestV6HudDocHl7FcpOut",pRequest)  Quit:$$$ISERR(tSC) tSC
			$$$TRACE("Diamic Msg sent to Agfa Brugmann")
			
			// To BDOC
			s %TREEFID="DIAMIC"
  		    s %TREEFID2="^"_%TREEFID_"^"_$tr($p(^CHUBXL.ConvArboBDoc(tHop,%TREEFID),"~",1,3),"~","^")
	        s %TREEFID3=$p(^CHUBXL.ConvArboBDoc(tHop,%TREEFID),"~",4)
	        s %TREEFID4=$p(^CHUBXL.ConvArboBDoc(tHop,%TREEFID),"~",5)
	        s tSC1=HL7Msg.SetValueAt(%TREEFID2,"PIDgrpgrp().ORCgrp().OBR:UniversalServiceIdentifier")
	        $$$TRACE("Status 1 : "_tSC1)
	        s tSC1=HL7Msg.SetValueAt(%TREEFID3,"PIDgrpgrp().ORCgrp().OBR:PlacerField1")
	        $$$TRACE("Status 2 : "_tSC1)
	        s tSC1=HL7Msg.SetValueAt(%TREEFID4,"PIDgrpgrp().ORCgrp().OBR:PlacerField2")
	        $$$TRACE("Status 3 : "_tSC1)
	        s tSC1=HL7Msg.SetValueAt(%TREEFID,"PIDgrpgrp().ORCgrp().OBXgrp().OBX:ObservationIdentifier.text")
	        $$$TRACE("Status 4 : "_tSC1)
	        s pRequest.HL7=HL7Msg
	        ;$$$TRACE("RawContent : "_pRequest.HL7.RawContent)
	        // CWY whyHL7EcareFile ???
			s NewMsgDPI=##class(CHUBXL.MSG.HL7EcareFile).%New()
			s NewMsgDPI.File=pRequest.File
			s NewMsgDPI.HL7=pRequest.HL7
			
			i ResCopTo'="" s tSC1=NewMsgDPI.HL7.SetValueAt(ResCopTo,"PIDgrpgrp(1).ORCgrp(1).OBR:ResultCopiesTo(1).IDnumberST")
			i OrdPro'="" s tSC1=NewMsgDPI.HL7.SetValueAt(OrdPro,"PIDgrpgrp(1).ORCgrp(1).OBR:OrderingProvider(1).IDnumberST")
			i PriResInt'="" s tSC1=NewMsgDPI.HL7.SetValueAt(PriResInt,"PIDgrpgrp(1).ORCgrp(1).OBR:PrincipalResultInterpreter.name.IDnumberST")
			i ResObs1'="" s tSC1=NewMsgDPI.HL7.SetValueAt(ResObs1,"PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:ResponsibleObserver.IDnumberST")
			i ResObs2'="" s tSC1=NewMsgDPI.HL7.SetValueAt(ResObs2,"PIDgrpgrp(1).ORCgrp(1).OBXgrp(2).OBX:ResponsibleObserver.IDnumberST")
			i ResObs3'="" s tSC1=NewMsgDPI.HL7.SetValueAt(ResObs3,"PIDgrpgrp(1).ORCgrp(1).OBXgrp(3).OBX:ResponsibleObserver.IDnumberST")
			i ResCopTo2'="" s tSC1=NewMsgDPI.HL7.SetValueAt(ResCopTo2,"PIDgrpgrp(1).ORCgrp(2).OBR:ResultCopiesTo(1).IDnumberST")
			i OrdPro2'="" s tSC1=NewMsgDPI.HL7.SetValueAt(OrdPro2,"PIDgrpgrp(1).ORCgrp(2).OBR:OrderingProvider(1).IDnumberST")
			i PriResInt2'="" s tSC1=NewMsgDPI.HL7.SetValueAt(PriResInt2,"PIDgrpgrp(1).ORCgrp(2).OBR:PrincipalResultInterpreter.name.IDnumberST")
			i ResObs21'="" s tSC1=NewMsgDPI.HL7.SetValueAt(ResObs21,"PIDgrpgrp(1).ORCgrp(2).OBXgrp(1).OBX:ResponsibleObserver.IDnumberST")
			i ResObs22'="" s tSC1=NewMsgDPI.HL7.SetValueAt(ResObs22,"PIDgrpgrp(1).ORCgrp(2).OBXgrp(2).OBX:ResponsibleObserver.IDnumberST")
			i ResObs23'="" s tSC1=NewMsgDPI.HL7.SetValueAt(ResObs23,"PIDgrpgrp(1).ORCgrp(2).OBXgrp(3).OBX:ResponsibleObserver.IDnumberST")

			i (reStatus="X") & (reStatus2="F") {
			  s tSC1=NewMsgDPI.HL7.SetValueAt(NewMsgDPI.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(2).OBR",,.tSC),"PIDgrpgrp(1).ORCgrp(1).OBR")
			  s tSC1=NewMsgDPI.HL7.SetValueAt(NewMsgDPI.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(2).OBXgrp(1).OBX",,.tSC),"PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX")
			  s tSC1=NewMsgDPI.HL7.SetValueAt(NewMsgDPI.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(2).OBXgrp(2).OBX",,.tSC),"PIDgrpgrp(1).ORCgrp(1).OBXgrp(2).OBX")
			  s tSC1=NewMsgDPI.HL7.SetValueAt(NewMsgDPI.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(2).OBXgrp(3).OBX",,.tSC),"PIDgrpgrp(1).ORCgrp(1).OBXgrp(3).OBX")
			  s tSC1=NewMsgDPI.HL7.SetValueAt("","PIDgrpgrp(1).ORCgrp(2).OBR")
			  s tSC1=NewMsgDPI.HL7.SetValueAt("","PIDgrpgrp(1).ORCgrp(2).OBXgrp(1).OBX")
			  s tSC1=NewMsgDPI.HL7.SetValueAt("","PIDgrpgrp(1).ORCgrp(2).OBXgrp(2).OBX")
			  s tSC1=NewMsgDPI.HL7.SetValueAt("","PIDgrpgrp(1).ORCgrp(2).OBXgrp(3).OBX")
			}

			i Instance="ENS2017M" s tSC = ..SendRequestAsync("DiamicBdocBruDocHl7FcpOut",NewMsgDPI)  Quit:$$$ISERR(tSC) tSC
			i Instance="ENS2017M" s tSC = ..SendRequestAsync("DiamicBdocAllDocHl7FcpOutPrep",NewMsgDPI)  Quit:$$$ISERR(tSC) tSC
			i Instance="ENS2017PREP" s tSC = ..SendRequestAsync("DiamicBdocBruDocHl7FcpFwd",NewMsgDPI)  Quit:$$$ISERR(tSC) tSC
			$$$TRACE("Diamic Msg sent to Bdoc Brugmann")
		}
		Else {
		// HUDERF
			// To AGFA
			i Instance="ENS2017M" s tSC = ..SendRequestAsync("DiamicAgfaHudDocHl7FcpOut",pRequest)  Quit:$$$ISERR(tSC) tSC
	        ;$$$TRACE("RawContent : "_pRequest.HL7.RawContent)
	        
	        
	        // To BDOC
			s %TREEFID="DIAMIC"
	  		s %TREEFID2="^"_%TREEFID_"^"_$tr($p(^CHUBXL.ConvArboBDoc(tHop,%TREEFID),"~",1,3),"~","^")
	        s %TREEFID3=$p(^CHUBXL.ConvArboBDoc(tHop,%TREEFID),"~",4)
	        s %TREEFID4=$p(^CHUBXL.ConvArboBDoc(tHop,%TREEFID),"~",5)
	        s tSC1=HL7Msg.SetValueAt(%TREEFID2,"PIDgrpgrp().ORCgrp().OBR:UniversalServiceIdentifier")
	        $$$TRACE("Status 1 : "_tSC1)
	        s tSC1=HL7Msg.SetValueAt(%TREEFID3,"PIDgrpgrp().ORCgrp().OBR:PlacerField1")
	        $$$TRACE("Status 2 : "_tSC1)
	        s tSC1=HL7Msg.SetValueAt(%TREEFID4,"PIDgrpgrp().ORCgrp().OBR:PlacerField2")
	        $$$TRACE("Status 3 : "_tSC1)
	        s tSC1=HL7Msg.SetValueAt(%TREEFID,"PIDgrpgrp().ORCgrp().OBXgrp().OBX:ObservationIdentifier.text")
	        $$$TRACE("Status 4 : "_tSC1)
	        s pRequest.HL7=HL7Msg
	        ;$$$TRACE("RawContent : "_pRequest.HL7.RawContent)
	        
			// CWY whyHL7EcareFile ???
			s NewMsgDPI1=##class(CHUBXL.MSG.HL7EcareFile).%New()
			s NewMsgDPI1.File=pRequest.File
			s NewMsgDPI1.HL7=pRequest.HL7

			i ResCopTo'="" s tSC1=NewMsgDPI1.HL7.SetValueAt(ResCopTo,"PIDgrpgrp(1).ORCgrp(1).OBR:ResultCopiesTo(1).IDnumberST")
			i OrdPro'="" s tSC1=NewMsgDPI1.HL7.SetValueAt(OrdPro,"PIDgrpgrp(1).ORCgrp(1).OBR:OrderingProvider(1).IDnumberST")
			i PriResInt'="" s tSC1=NewMsgDPI1.HL7.SetValueAt(PriResInt,"PIDgrpgrp(1).ORCgrp(1).OBR:PrincipalResultInterpreter.name.IDnumberST")
			i ResObs1'="" s tSC1=NewMsgDPI1.HL7.SetValueAt(ResObs1,"PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:ResponsibleObserver.IDnumberST")
			i ResObs2'="" s tSC1=NewMsgDPI1.HL7.SetValueAt(ResObs2,"PIDgrpgrp(1).ORCgrp(1).OBXgrp(2).OBX:ResponsibleObserver.IDnumberST")
			i ResObs3'="" s tSC1=NewMsgDPI1.HL7.SetValueAt(ResObs3,"PIDgrpgrp(1).ORCgrp(1).OBXgrp(3).OBX:ResponsibleObserver.IDnumberST")
			i ResCopTo2'="" s tSC1=NewMsgDPI1.HL7.SetValueAt(ResCopTo2,"PIDgrpgrp(1).ORCgrp(2).OBR:ResultCopiesTo(1).IDnumberST")
			i OrdPro2'="" s tSC1=NewMsgDPI1.HL7.SetValueAt(OrdPro2,"PIDgrpgrp(1).ORCgrp(2).OBR:OrderingProvider(1).IDnumberST")
			i PriResInt2'="" s tSC1=NewMsgDPI1.HL7.SetValueAt(PriResInt2,"PIDgrpgrp(1).ORCgrp(2).OBR:PrincipalResultInterpreter.name.IDnumberST")
			i ResObs21'="" s tSC1=NewMsgDPI1.HL7.SetValueAt(ResObs21,"PIDgrpgrp(1).ORCgrp(2).OBXgrp(1).OBX:ResponsibleObserver.IDnumberST")
			i ResObs22'="" s tSC1=NewMsgDPI1.HL7.SetValueAt(ResObs22,"PIDgrpgrp(1).ORCgrp(2).OBXgrp(2).OBX:ResponsibleObserver.IDnumberST")
			i ResObs23'="" s tSC1=NewMsgDPI1.HL7.SetValueAt(ResObs23,"PIDgrpgrp(1).ORCgrp(2).OBXgrp(3).OBX:ResponsibleObserver.IDnumberST")
			$$$TRACE("DiamicRouting SegCount   : "_ResCopTo_"*"_OrdPro_"*"_PriResInt_"*"_ResObs1_"*"_ResObs2_"*"_ResObs3_"*"_ResCopTo2_"*"_PriResInt2_"*"_ResObs21_"*"_ResObs22_"*"_ResObs23)
			
			i (reStatus="X") & (reStatus2="F") {
			  s tSC1=NewMsgDPI1.HL7.SetValueAt(NewMsgDPI1.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(2).OBR",,.tSC),"PIDgrpgrp(1).ORCgrp(1).OBR")
			  s tSC1=NewMsgDPI1.HL7.SetValueAt(NewMsgDPI1.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(2).OBXgrp(1).OBX",,.tSC),"PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX")
			  s tSC1=NewMsgDPI1.HL7.SetValueAt(NewMsgDPI1.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(2).OBXgrp(2).OBX",,.tSC),"PIDgrpgrp(1).ORCgrp(1).OBXgrp(2).OBX")
			  s tSC1=NewMsgDPI1.HL7.SetValueAt(NewMsgDPI1.HL7.GetValueAt("PIDgrpgrp(1).ORCgrp(2).OBXgrp(3).OBX",,.tSC),"PIDgrpgrp(1).ORCgrp(1).OBXgrp(3).OBX")
			  s tSC1=NewMsgDPI1.HL7.SetValueAt("","PIDgrpgrp(1).ORCgrp(2).OBR")
			  s tSC1=NewMsgDPI1.HL7.SetValueAt("","PIDgrpgrp(1).ORCgrp(2).OBXgrp(1).OBX")
			  s tSC1=NewMsgDPI1.HL7.SetValueAt("","PIDgrpgrp(1).ORCgrp(2).OBXgrp(2).OBX")
			  s tSC1=NewMsgDPI1.HL7.SetValueAt("","PIDgrpgrp(1).ORCgrp(2).OBXgrp(3).OBX")
			}
			
			i Instance="ENS2017M" s tSC = ..SendRequestAsync("DiamicBdocHudDocHl7FcpOut",NewMsgDPI1)  Quit:$$$ISERR(tSC) tSC
			i Instance="ENS2017M" s tSC = ..SendRequestAsync("DiamicBdocAllDocHl7FcpOutPrep",NewMsgDPI1)  Quit:$$$ISERR(tSC) tSC
			i Instance="ENS2017PREP" s tSC = ..SendRequestAsync("DiamicBdocHudDocHl7FcpFwd",NewMsgDPI1)  Quit:$$$ISERR(tSC) tSC
			$$$TRACE("Diamic Msg sent to Bdoc Huderf")
		}
		
		// To Medical Viewer
	
		$$$TRACE("DiamicRouting HL7 ResultStatus (1): "_reStatus)
		$$$TRACE("DiamicRouting HL7 ResultStatus (2): "_reStatus2)
		$$$TRACE("DiamicRouting SegCount: "_pRequest.HL7.SegCount)
		
		if (reStatus="F"){			
			$$$TRACE("DiamicRouting reStatus :"_reStatus)
			s tSC=##class(CHUBXL.DT.ResultDiamicToMv).Transform(pRequest.HL7,.MvMsg)  Quit:$$$ISERR(tSC) tSC
			d pRequest.File.Rewind()	
			s stat = MvMsg.Blob.CopyFrom(pRequest.File)
			i Instance="ENS2017M" s tSC($G(MvMsg)'="") =..SendRequestAsync("DiamicMvAllDocHl7FcpOut",MvMsg)  Quit:$$$ISERR(tSC) tSC		
			$$$TRACE("Diamic Msg sent to Medical Viewer")
		}
		
		if (reStatus2)="F" {			
			$$$TRACE("DiamicRouting reStatus2 :"_reStatus2)
			s tSC=##class(CHUBXL.DT.ResultDiamicToMv).Transform(pRequest.HL7,.MvMsg)  Quit:$$$ISERR(tSC) tSC
			d pRequest.File.Rewind()	
			s stat = MvMsg.Blob.CopyFrom(pRequest.File)
			i Instance="ENS2017M" s tSC($G(MvMsg)'="") =..SendRequestAsync("DiamicMvAllDocHl7FcpOut",MvMsg)  Quit:$$$ISERR(tSC) tSC		
			$$$TRACE("Diamic Msg sent to Medical Viewer")
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
<Data name="DiamicHl7RoutingDefaultData">
<Subscript>"DiamicHl7Routing"</Subscript>
<Value name="1">
<Value>AddToMetric</Value>
</Value>
</Data>
<DefaultData>DiamicHl7RoutingDefaultData</DefaultData>
<Type>%Library.CacheStorage</Type>
}

}
