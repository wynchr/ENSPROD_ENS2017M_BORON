Class CHUBXL.BP.NEW.GlimsHl7Routing Extends Ens.BusinessProcess [ ClassType = persistent, ProcedureBlock ]
{

/*
--------------------------------------------------------------------------------------------------------------------------------
DESCRIPTION
-----------
BP GLIMS HL7 

VERSION
-------
CWY	24/07/2018	Initial Version
CWY	31/07/2018	Add comment
DAM	21/08/2018	Delete GlimsBdocabruBruDocHl7FcpFwd
DAM	13/09/2019	Add routing result other lab

REQUEST
-------
	CHUBXL.DATA.RawMessageStream

SOURCE
------
	GLIMS
		GlimsabruBruDocHl7FcpIn ! GlimsabruHudDocHl7FcpIn		=> BDOC, MV
		GlimsAllLabHl7FcpIn 									=> DIALYSE
		GlimsBruLabHl7TcpIn 
		GlimsHudLabHl7TcpIn 

DESTINATION
-----------
	ABRU,BDOC,MV,ECARE,DIALYSE,ICIP	

MESSAGES
--------
	CHUBXL.MSG.HL7GlimsFile

PROCESS
-------	
	GlimsabruBruDocHl7FcpIn ! GlimsabruHudDocHl7FcpIn
			BRUGMANN
				CHUBXL.MSG.HL7GlimsFile 	=> GlimsBdocabruBruDocHl7FcpOut
				CHUBXL.MSG.HL7GlimsFile		=> GlimsBdocabruBruDocHl7FcpFwd
			HUDERF
				CHUBXL.MSG.HL7GlimsFile		=> GlimsBdocabruHudDocHl7FcpOut
			ALL
				CHUBXL.MSG.ResultMv			=> GlimsMvabruMvAllDocXmlFcpOut
			
	GlimsAllLabHl7FcpIn 
		CHUBXL.DT.ResultGlimsToQuadrat	=> CHUBXL.DT.DIAHL7.Convert(HL7String)	=> CHUBXL.MSG.HL7Dialyse	=> GlimsDialyseAllLabHl7TcpOut		
			
	GlimsBruLabHl7TcpIn 
		CHUBXL.DT.ResultGlimsToQuadrat
		?CHUBXL.DT.GlimsToDBMotion?
											=> GlimsBdocBruLabHl7TcpOut
											=> GlimsBdocBruLabHl7TcpFwd
		ECARE
			patloc="BURG" ! patloc="BsGA"	
		   									=> GlimsEcareBruLabHl7FcpOut
		DIALYSE
			patloc="BURG" ! patloc="BsGA"
			CHUBXL.DT.DIAHL7).Convert(HL7String)
											=> GlimsDialyseAllLabHl7TcpOut
											
	GlimsHudLabHl7TcpIn 
		CHUBXL.DT.ResultGlimsToQuadrat	
											=> GlimsIcipHudLabHl7TcpOut
											=> GlimsBdocHudLabHl7TcpOut
											=> GlimsBdocHudLabHl7TcpFwd										
											
OPTIMISATION
------------
- Create BP for Abrumet
- For Ensemble2007 ???
- CHUBXL.DT.GlimsToDBMotion ??? no more used no SendAsync ???
- Normalement aucune conversion à faire !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

SOURCE
------
CHUBXL.BP.GlimsHL7Routing

--------------------------------------------------------------------------------------------------------------------------------
*/
/// Automatic Metric
Property AddToMetric As %Boolean [ InitialExpression = 1 ];

Parameter SETTINGS = "AddToMetric";

Method OnRequest(pRequest As CHUBXL.DATA.RawMessageStream, Output pResponse As Ens.Response) As %Status
{
	
	Set $ZTrap = "ErrorTrap", tSC=$$$OK	

	$$$TRACE("Start BP GlimsHL7Routing")

	s tClassName = pRequest.%ClassName(1)
	s tSourceConfigName = ..%PrimaryRequestHeader.SourceConfigName
	s tTargetConfigName = ..%PrimaryRequestHeader.TargetConfigName
	s MessageBodyClassName = ..%PrimaryRequestHeader.MessageBodyClassName
	s Instance=$p($SYSTEM,":",2)
	
	$$$TRACE("ClassName : "_tClassName)
	$$$TRACE("SourceConfigName : "_tSourceConfigName)
	$$$TRACE("TargetConfigName : "_tTargetConfigName)


	//------------------------------
	// Test Source
	//------------------------------
	
	// ====== GlimsabruBruDocHl7FcpIn ! GlimsabruHudDocHl7FcpIn (ABRU, BDOC, MV)
	
	If (tSourceConfigName = "GlimsabruBruDocHl7FcpIn" ) ! (tSourceConfigName = "GlimsabruHudDocHl7FcpIn" ) {
		$$$TRACE("Phase 0"_MessageBodyClassName)
		i MessageBodyClassName = "CHUBXL.MSG.HL7GlimsFile" {
			s nHop=pRequest.HL7.GetValueAt("MSH:ReceivingApplication.namespaceID",,.tSC)
			i nHop=26 { 
			  s tSC = ..SendRequestAsync("GlimsBdocabruBruDocHl7FcpOut",pRequest)  Quit:$$$ISERR(tSC)
			  i Instance'="ENS2017M" s tSC = ..SendRequestAsync("GlimsBdocabruBruDocHl7FcpFwd",pRequest)  Quit:$$$ISERR(tSC)
			}
			i nHop=27 s tSC = ..SendRequestAsync("GlimsBdocabruHudDocHl7FcpOut",pRequest)  Quit:$$$ISERR(tSC)
		}
		i MessageBodyClassName = "CHUBXL.MSG.ResultMv" {
			i Instance="ENS2017M" s tSC = ..SendRequestAsync("GlimsMvabruMvAllDocXmlFcpOut",pRequest)  Quit:$$$ISERR(tSC)
		}
	}
	
	// ====== GlimsAllLabHl7FcpIn (DIALYSE)
	
	ElseIf (tSourceConfigName = "GlimsAllLabHl7FcpIn" ) {
		
		$$$TRACE("BRUGMANN")
		d pRequest.payLoad.Rewind()
		s tmp=pRequest.payLoad.Read(3500000)
		s tmp=$tr(tmp,$c(13),$c(10))
		s tmp=$p(tmp,"|",1,17)_"|"_$e($p($p(tmp,"PID",1),"|",18),5,99)_"PID"_$p(tmp,"PID",2,99)
		$$$TRACE("Longeur : "_tmp)
		
		s HL7Msg = ##class(EnsLib.HL7.Message).ImportFromString(tmp,.tSC)
		s HL7Msg.DocType=HL7Msg.TypeVersion_":"_HL7Msg.Name
		d HL7Msg.SetValueAt("ISO-8859-1","MSH:CharacterSet()")
		$$$TRACE("HL7Msg : "_HL7Msg.RawContent)

		s patloc=HL7Msg.GetValueAt("PV1grp.PV1:AssignedPatientLocation.pointofcare",,.tSC)
		$$$TRACE("patloc = "_patloc)
		
		// BDOC
		// CWY Which conversion ?
		
		s ^CHUBXL.dulio(+$h,0)=HL7Msg.RawContent
		
		s tSC = ##class(CHUBXL.DT.ResultGlimsToQuadrat).Transform(HL7Msg,.HL7Msg1)  Quit:$$$ISERR(tSC) tSC
		
		s ^CHUBXL.dulio(+$h,1)=HL7Msg1.RawContent
		
		s tSC = ##class(CHUBXL.DT.GlimsToDBMotion).Transform(HL7Msg1,.HL7Msg2)  Quit:$$$ISERR(tSC) tSC
		
		s ^CHUBXL.dulio(+$h,2)=HL7Msg2.RawContent
		
		s tSC = ..SendRequestAsync("GlimsBdocBruLabHl7TcpOut",HL7Msg2)  Quit:$$$ISERR(tSC) tSC
		i Instance="ENS2017TEST" s tSC = ..SendRequestAsync("GlimsBdocBruLabHl7TcpFwd",HL7Msg2)  Quit:$$$ISERR(tSC) tSC
		i Instance="ENS2017M" s tSC = ..SendRequestAsync("GlimsBdocBruLabHl7TcpFwdPrep",HL7Msg2)  Quit:$$$ISERR(tSC) tSC
		i ((Instance="ENS2017M") & ((HL7Msg.RawContent["BIOLOGIE MOLECULAIRE") ! (HL7Msg.RawContent["VIROLOGIE") ! (HL7Msg.RawContent["BACTERIOLOGIE"))) s tSC = ..SendRequestAsync("GlimsInfoPartnerAllDocHl7FcpOut",HL7Msg2)  Quit:$$$ISERR(tSC) tSC
		;i (Instance="ENS2017M") s tSC = ..SendRequestAsync("GlimsInfoPartnerAllDocHl7FcpOut",HL7Msg2)  Quit:$$$ISERR(tSC) tSC
		$$$TRACE("Msg sent to Bdoc Brugmann")
		
		//d pRequest.payLoad.Rewind()
		//s tmp=pRequest.payLoad.Read(3500000)
		//s tmp=$p(tmp,"|",1,17)_"|"_$e($p($p(tmp,"PID",1),"|",18),5,99)_"PID"_$p(tmp,"PID",2,99)
		//s HL7Msg = ##class(EnsLib.HL7.Message).ImportFromString(tmp,.tSC)
		//s HL7Msg.DocType=HL7Msg.TypeVersion_":"_HL7Msg.Name
		//d HL7Msg.SetValueAt("ISO-8859-1","MSH:CharacterSet()")
		//s tSC = ##class(CHUBXL.DT.ResultGlimsToQuadrat).Transform(HL7Msg,.HL7Msg2)  Quit:$$$ISERR(tSC) tSC
		//s patloc=HL7Msg.GetValueAt("PV1grp.PV1:AssignedPatientLocation.pointofcare",,.tSC)
		// DIALYSE
		if ((patloc="BRA") ! (patloc="BsRA")) & (Instance="ENS2017M")  {
			d pRequest.payLoad.Rewind()
			s HL7String = pRequest.payLoad.Read(32000)
			$$$TRACE("************************************************ Start DIAHL7 : "_HL7String)
			d ##class(CHUBXL.DT.DIAHL7).Convert(HL7String)
			s HL7String1="" f iii=1:1:$l(HL7String,$c(13)) s HL7String1=HL7String1_$p(HL7String,$c(13),iii)_"\r"
			s pMsg1 =  ##class(CHUBXL.MSG.HL7Dialyse).%New()
			s pMsg1.Message = HL7String1
			d pMsg1.%Save()
			s tSC = ..SendRequestAsync("GlimsDialyseAllLabHl7TcpOut",pMsg1)
			$$$TRACE("Msg sent to Dialyse")
		}
	}
	
	// ====== GlimsBruLabHl7TcpIn (BDOC,ECARE,DIALYSE)
	
	Elseif (tSourceConfigName = "GlimsBruLabHl7TcpIn" ) {
		$$$TRACE("BRUGMANN")
		d pRequest.payLoad.Rewind()
		s tmp=pRequest.payLoad.Read(3500000)
		s tmp=$tr(tmp,$c(13),$c(10))
		s tmp=$p(tmp,"|",1,17)_"|"_$e($p($p(tmp,"PID",1),"|",18),5,99)_"PID"_$p(tmp,"PID",2,99)
		$$$TRACE("Longeur : "_tmp)
		
		s HL7Msg = ##class(EnsLib.HL7.Message).ImportFromString(tmp,.tSC)
		s HL7Msg.DocType=HL7Msg.TypeVersion_":"_HL7Msg.Name
		d HL7Msg.SetValueAt("ISO-8859-1","MSH:CharacterSet()")
		$$$TRACE("HL7Msg : "_HL7Msg.RawContent)

		s patloc=HL7Msg.GetValueAt("PV1grp.PV1:AssignedPatientLocation.pointofcare",,.tSC)
		$$$TRACE("patloc = "_patloc)
		
		// BDOC
		// CWY Which conversion ?
		
		s tSC = ##class(CHUBXL.DT.ResultGlimsToQuadrat).Transform(HL7Msg,.HL7Msg1)  Quit:$$$ISERR(tSC) tSC
		s tSC = ##class(CHUBXL.DT.GlimsToDBMotion).Transform(HL7Msg1,.HL7Msg2)  Quit:$$$ISERR(tSC) tSC
		
		s tSC = ..SendRequestAsync("GlimsBdocBruLabHl7TcpOut",HL7Msg2)  Quit:$$$ISERR(tSC) tSC
		i Instance="ENS2017TEST" s tSC = ..SendRequestAsync("GlimsBdocBruLabHl7TcpFwd",HL7Msg2)  Quit:$$$ISERR(tSC) tSC
		i Instance="ENS2017M" s tSC = ..SendRequestAsync("GlimsBdocBruLabHl7TcpFwdPrep",HL7Msg2)  Quit:$$$ISERR(tSC) tSC
		i ((Instance="ENS2017M") & ((HL7Msg.RawContent["BIOLOGIE MOLECULAIRE") ! (HL7Msg.RawContent["VIROLOGIE") ! (HL7Msg.RawContent["BACTERIOLOGIE"))) s tSC = ..SendRequestAsync("GlimsInfoPartnerAllDocHl7FcpOut",HL7Msg2)  Quit:$$$ISERR(tSC) tSC
		;i (Instance="ENS2017M") s tSC = ..SendRequestAsync("GlimsInfoPartnerAllDocHl7FcpOut",HL7Msg2)  Quit:$$$ISERR(tSC) tSC
		$$$TRACE("Msg sent to Bdoc Brugmann")
		
		// ECARE
		if (patloc="BURG") ! (patloc="BsGA") {
		   i Instance="ENS2017M" s tSC = ..SendRequestAsync("GlimsEcareBruLabHl7FcpOut",HL7Msg2)  Quit:$$$ISERR(tSC) tSC
		   $$$TRACE("Msg sent to E-Care")
		}
		
		// DIALYSE
		if ((patloc="BRA") ! (patloc="BsRA")) & (Instance="ENS2017M")  {
			d pRequest.payLoad.Rewind()
			s HL7String = pRequest.payLoad.Read(3500000)
			$$$TRACE("Start DIAHL7 : "_HL7String)
			d ##class(CHUBXL.DT.DIAHL7).Convert(HL7String)
			S ptr="" F  S ptr=$O(^CHUBXL.TMPDIA(ptr)) Q:ptr=""  D
			. $$$TRACE("DIAHL7 : "_ptr_"="_^CHUBXL.TMPDIA(ptr))
			. s pMsg =  ##class(CHUBXL.MSG.HL7Dialyse).%New()
			. s pMsg.Message = ^CHUBXL.TMPDIA(ptr)
			. d pMsg.%Save()
			. s tSC = ..SendRequestAsync("GlimsDialyseAllLabHl7TcpOut",pMsg)
			$$$TRACE("Msg sent to Dialyse")
		}
	}
	
	// ====== GlimsHudLabHl7TcpIn (ICIP,BDOC)
	
	Elseif (tSourceConfigName = "GlimsHudLabHl7TcpIn" ) {
		$$$TRACE("HUDERF")
		d pRequest.payLoad.Rewind()
		s tmp=pRequest.payLoad.Read(3500000)
		s tmp=$tr(tmp,$c(13),$c(10))
		s tmp=$p(tmp,"|",1,17)_"|"_$e($p($p(tmp,"PID",1),"|",18),5,99)_"PID"_$p(tmp,"PID",2,99)
		$$$TRACE("Longeur : "_tmp)
		
		s HL7Msg = ##class(EnsLib.HL7.Message).ImportFromString(tmp,.tSC)
		s HL7Msg.DocType=HL7Msg.TypeVersion_":"_HL7Msg.Name
		d HL7Msg.SetValueAt("ISO-8859-1","MSH:CharacterSet()")
		$$$TRACE("HL7Msg : "_HL7Msg.RawContent)
		
		// BDOC & ICIP
		s tSC = ##class(CHUBXL.DT.ResultGlimsToQuadrat).Transform(HL7Msg,.HL7Msg2)  Quit:$$$ISERR(tSC) tSC
		i Instance="ENS2017M" s tSC = ..SendRequestAsync("GlimsIcipHudLabHl7TcpOut",HL7Msg2)  Quit:$$$ISERR(tSC) tSC
		i Instance="ENS2017M" s tSC = ..SendRequestAsync("GlimsBdocHudLabHl7TcpOut",HL7Msg2)  Quit:$$$ISERR(tSC) tSC
		i Instance="ENS2017M" s tSC = ..SendRequestAsync("GlimsBdocHudLabHl7TcpFwdPrep",HL7Msg2)  Quit:$$$ISERR(tSC) tSC
		i ((Instance="ENS2017M") & ((HL7Msg.RawContent["BIOLOGIE MOLECULAIRE") ! (HL7Msg.RawContent["VIROLOGIE") ! (HL7Msg.RawContent["BACTERIOLOGIE"))) s tSC = ..SendRequestAsync("GlimsInfoPartnerAllDocHl7FcpOut",HL7Msg2)  Quit:$$$ISERR(tSC) tSC
		;i (Instance="ENS2017M") s tSC = ..SendRequestAsync("GlimsInfoPartnerAllDocHl7FcpOut",HL7Msg2)  Quit:$$$ISERR(tSC) tSC
		i Instance="ENS2017TEST" s tSC = ..SendRequestAsync("GlimsBdocHudLabHl7TcpFwd",HL7Msg2)  Quit:$$$ISERR(tSC) tSC
		
		$$$TRACE("Msg sent to Icip & Bdoc Huderf")
	}
	
	Elseif (tSourceConfigName = "GlimsBruDocFilesFcpIn" ) {
		
		s tSC = ..SendRequestAsync("GlimsAllDocFilesFcpOut",pRequest)  Quit:$$$ISERR(tSC) tSC
		
		$$$TRACE("Msg sent to \\brpostfiles01\p$\Laboratoire Médecine foetale")
	}
	
	Else {
		$$$LOGWARNING("Unsupported message received :"_tSourceConfigName)
	}
					
Exit	
	Quit tSC

ErrorTrap
 
 	Set $ZTrap = ""
 	Write $ZError,!
 	$$$TRACE("Error BP - GlimsMB : "_$ZError)
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
<Data name="GlimsHl7RoutingDefaultData">
<Subscript>"GlimsHl7Routing"</Subscript>
<Value name="1">
<Value>AddToMetric</Value>
</Value>
</Data>
<DefaultData>GlimsHl7RoutingDefaultData</DefaultData>
<Type>%Library.CacheStorage</Type>
}

}
