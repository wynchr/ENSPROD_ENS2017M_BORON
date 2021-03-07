Class CHUBXL.BP.OLD.GlimsHL7Routing Extends Ens.BusinessProcess [ ClassType = persistent, ProcedureBlock ]
{

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
	
	$$$TRACE("ClassName : "_tClassName)
	$$$TRACE("SourceConfigName : "_tSourceConfigName)
	$$$TRACE("TargetConfigName : "_tTargetConfigName)

	If (tSourceConfigName = "GlimsabruBruDocHl7FcpIn" ) ! (tSourceConfigName = "GlimsabruHudDocHl7FcpIn" ) {
		$$$TRACE("Phase 0"_MessageBodyClassName)
		i MessageBodyClassName = "CHUBXL.MSG.HL7GlimsFile" {
			s nHop=pRequest.HL7.GetValueAt("MSH:ReceivingApplication.namespaceID",,.tSC)
			$$$TRACE("Phase 1")
			i nHop=26 { 
			  s tSC = ..SendRequestAsync("GlimsBdocabruBruDocHl7FcpOut",pRequest)  Quit:$$$ISERR(tSC)
			  s tSC = ..SendRequestAsync("GlimsBdocabruBruDocHl7FcpFwd",pRequest)  Quit:$$$ISERR(tSC)
			}
			i nHop=27 s tSC = ..SendRequestAsync("GlimsBdocabruHudDocHl7FcpOut",pRequest)  Quit:$$$ISERR(tSC)
			$$$TRACE("Phase 2")
		}
		i MessageBodyClassName = "CHUBXL.MSG.ResultMv" {
			$$$TRACE("Phase 3")
			s tSC = ..SendRequestAsync("GlimsMvabruMvAllDocXmlFcpOut",pRequest)  Quit:$$$ISERR(tSC)
			$$$TRACE("Phase 4")
		}
	}
	ElseIf (tSourceConfigName = "GlimsAllLabHl7FcpIn" ) {
		;--- For Ensemble2007
		d pRequest.payLoad.Rewind()
		s tmp=pRequest.payLoad.Read(3500000)
		;s tmp=$tr(tmp,$c(13),$c(10))
		s tmp=$p(tmp,"|",1,17)_"|"_$e($p($p(tmp,"PID",1),"|",18),5,99)_"PID"_$p(tmp,"PID",2,99)
		s HL7Msg = ##class(EnsLib.HL7.Message).ImportFromString(tmp,.tSC)
		s HL7Msg.DocType=HL7Msg.TypeVersion_":"_HL7Msg.Name
		;---
		d HL7Msg.SetValueAt("ISO-8859-1","MSH:CharacterSet()")
		
		;s HL7Msg = ##class(EnsLib.HL7.Message).ImportFromOldStream(pRequest.payLoad,.tSC)
		$$$TRACE("HL7Msg : ***********"_HL7Msg.RawContent_"*****************")
		s tSC = ##class(CHUBXL.DT.ResultGlimsToQuadrat).Transform(HL7Msg,.HL7Msg2)  Quit:$$$ISERR(tSC) tSC
		$$$TRACE("Msg sent to Mediweb")
		
		s patloc=HL7Msg.GetValueAt("PV1grp.PV1:AssignedPatientLocation.pointofcare",,.tSC)
		
		// Convert and Send to DIALYSE
		if (patloc="BRA") ! (patloc="BsRA")  {
			d pRequest.payLoad.Rewind()
			s HL7String = pRequest.payLoad.Read(32000)
			$$$TRACE("************************************************ Start DIAHL7 : "_HL7String)
			
			d ##class(CHUBXL.DT.DIAHL7).Convert(HL7String)

			;S ptr="" F  S ptr=$O(^CHUBXL.TMPDIA(ptr)) Q:ptr=""  D
			;. $$$TRACE("DIAHL7 : "_ptr_"="_^CHUBXL.TMPDIA(ptr))
			;. s pMsg =  ##class(CHUBXL.MSG.HL7Dialyse).%New()
			;. s pMsg.Message = ^CHUBXL.TMPDIA(ptr)
			;. d pMsg.%Save()
			;. s tSC = ..SendRequestAsync("DiaHL7TcpOutTest",pMsg)
			
			s HL7String1="" f iii=1:1:$l(HL7String,$c(13)) s HL7String1=HL7String1_$p(HL7String,$c(13),iii)_"\r"
			;s HL7String1=$tr(HL7String1,$c(10),"r")
			
			s pMsg1 =  ##class(CHUBXL.MSG.HL7Dialyse).%New()
			s pMsg1.Message = HL7String1
			d pMsg1.%Save()
			s tSC = ..SendRequestAsync("GlimsDialyseAllLabHl7TcpOut",pMsg1)
			;s tSC = ..SendRequestAsync("DiaHL7TcpOutTest",pMsg)
			
			;S ptr="" F  S ptr=$O(^CHUBXL.TMPDIA(ptr)) Q:ptr=""  D
			. ;$$$TRACE("DIAHL7 : "_ptr_"="_^CHUBXL.TMPDIA(ptr))
			. ;s pMsg =  ##class(CHUBXL.MSG.HL7Dialyse).%New()
			. ;s pMsg.Message = ^CHUBXL.TMPDIA(ptr)
			. ;d pMsg.%Save()
			. ;s tSC = ..SendRequestAsync("DiaHL7TcpOut",pMsg)
		}
	}
	Elseif (tSourceConfigName = "GlimsBruLabHl7TcpIn" ) {
		;--- For Ensemble2007
		$$$TRACE("Brugmann")
		d pRequest.payLoad.Rewind()
		s tmp=pRequest.payLoad.Read(3500000)
		s tmp=$tr(tmp,$c(13),$c(10))
		$$$TRACE("Longeur : "_tmp)
		s tmp=$p(tmp,"|",1,17)_"|"_$e($p($p(tmp,"PID",1),"|",18),5,99)_"PID"_$p(tmp,"PID",2,99)
		s HL7Msg = ##class(EnsLib.HL7.Message).ImportFromString(tmp,.tSC)
		s HL7Msg.DocType=HL7Msg.TypeVersion_":"_HL7Msg.Name
		d HL7Msg.SetValueAt("ISO-8859-1","MSH:CharacterSet()")
		;s HL7Msg = ##class(EnsLib.HL7.Message).ImportFromOldStream(pRequest.payLoad,.tSC)
		$$$TRACE("HL7Msg : "_HL7Msg.RawContent)
		s tSC = ##class(CHUBXL.DT.ResultGlimsToQuadrat).Transform(HL7Msg,.HL7Msg2)  Quit:$$$ISERR(tSC) tSC
		;s tSC = ..SendRequestAsync("GlimsBRUHL7FileOut",HL7Msg2)  Quit:$$$ISERR(tSC) tSC
		;s tSC = ..SendRequestAsync("GlimsBRUHL7FileTestOut",HL7Msg2)  Quit:$$$ISERR(tSC) tSC
		$$$TRACE("Msg sent to Mediweb Brugmann")
		
		s tSC = ##class(CHUBXL.DT.GlimsToDBMotion).Transform(HL7Msg,.HL7Msg2)  Quit:$$$ISERR(tSC) tSC
		;s tSC = ..SendRequestAsync("GlimsDbmotionBRUHL7FileOut",HL7Msg2)  Quit:$$$ISERR(tSC) tSC
		s tSC = ..SendRequestAsync("GlimsBdocBruLabHl7TcpOut",HL7Msg2)  Quit:$$$ISERR(tSC) tSC
		s tSC = ..SendRequestAsync("GlimsBdocBruLabHl7TcpFwd",HL7Msg2)  Quit:$$$ISERR(tSC) tSC
		$$$TRACE("Msg sent to Dbmotion Brugmann")
		
		// Check for LAB temp patient
				
		s PID1=HL7Msg.GetValueAt("PIDgrp.PID:PatientIdentifierList(1).ID",,.tSC)
		$$$TRACE("**PID part1 : ["_PID1_"]")
		s PID2=HL7Msg2.GetValueAt("PIDgrp.PID:PatientIdentifierList(1).checkdigitST",,.tSC)
		$$$TRACE("**PID part2 : ["_PID2_"]")
		
		i ((PID1="") & (PID2="")) {
			s tSC = ##class(CHUBXL.DT.GlimsToA08).Transform(HL7Msg,.HL7Msg2)  Quit:$$$ISERR(tSC) tSC
			$$$TRACE("Msg sent to Initiate Brugmann")
		
		}
		// Convert and Send to DIALYSE
		s patloc=HL7Msg.GetValueAt("PV1grp.PV1:AssignedPatientLocation.pointofcare",,.tSC)
		$$$TRACE("patloc = "_patloc)
				
		if (patloc="BURG") ! (patloc="BsGA") {
		   s tSC = ..SendRequestAsync("GlimsEcareBruLabHl7FcpOut",HL7Msg2)  Quit:$$$ISERR(tSC) tSC
		   $$$TRACE("Msg sent to E-Care")
		}
		
		if (patloc="BRA") ! (patloc="BsRA")  {
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
			. ;s tSC = ..SendRequestAsync("DiaHL7TcpOutTest",pMsg)
		}
	}
	Elseif (tSourceConfigName = "GlimsHudLabHl7TcpIn" ) {
		;--- For Ensemble2007
		$$$TRACE("HUDERF")
		d pRequest.payLoad.Rewind()
		s tmp=pRequest.payLoad.Read(3500000)
		s tmp=$tr(tmp,$c(13),$c(10))
		s tmp=$p(tmp,"|",1,17)_"|"_$e($p($p(tmp,"PID",1),"|",18),5,99)_"PID"_$p(tmp,"PID",2,99)
		$$$TRACE("Longeur : "_tmp)
		s HL7Msg = ##class(EnsLib.HL7.Message).ImportFromString(tmp,.tSC)
		$$$TRACE("Step 1 : "_$l(tmp))
		s HL7Msg.DocType=HL7Msg.TypeVersion_":"_HL7Msg.Name
		$$$TRACE("Step 2 : "_$l(tmp))
		d HL7Msg.SetValueAt("ISO-8859-1","MSH:CharacterSet()")
		$$$TRACE("Step 3 : "_$l(tmp))
		;s HL7Msg = ##class(EnsLib.HL7.Message).ImportFromOldStream(pRequest.payLoad,.tSC)
		$$$TRACE("HL7Msg : "_HL7Msg.RawContent)
		s tSC = ##class(CHUBXL.DT.ResultGlimsToQuadrat).Transform(HL7Msg,.HL7Msg2)  Quit:$$$ISERR(tSC) tSC
		;s tSC = ..SendRequestAsync("GlimsHUDHL7FileOut",HL7Msg2)  Quit:$$$ISERR(tSC) tSC
		;s tSC = ..SendRequestAsync("GlimsHUDHL7FileTestOut",HL7Msg2)  Quit:$$$ISERR(tSC) tSC
		s tSC = ..SendRequestAsync("GlimsIcipHudLabHl7TcpOut",HL7Msg2)  Quit:$$$ISERR(tSC) tSC
		s tSC = ..SendRequestAsync("GlimsBdocHudLabHl7TcpFwd",HL7Msg2)  Quit:$$$ISERR(tSC) tSC
		s tSC = ..SendRequestAsync("GlimsBdocHudLabHl7TcpOut",HL7Msg2)  Quit:$$$ISERR(tSC) tSC
		$$$TRACE("Msg sent to Mediweb Huderf")
		
		s tSC = ##class(CHUBXL.DT.GlimsToDBMotion).Transform(HL7Msg,.HL7Msg2)  Quit:$$$ISERR(tSC) tSC
		$$$TRACE("Msg sent to Dbmotion Huderf")

		// Check for LAB temp patient
		s PID1=HL7Msg.GetValueAt("PIDgrp.PID:PatientIdentifierList(1).ID",,.tSC)
		$$$TRACE("**PID part1 : ["_PID1_"]")
		s PID2=HL7Msg2.GetValueAt("PIDgrp.PID:PatientIdentifierList(1).checkdigitST",,.tSC)
		$$$TRACE("**PID part2 : ["_PID2_"]")
		
		i ((PID1="") & (PID2="")) {
			s tSC = ##class(CHUBXL.DT.GlimsToA08).Transform(HL7Msg,.HL7Msg2)  Quit:$$$ISERR(tSC) tSC
			$$$TRACE("Msg sent to Initiate Huderf")
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
<Data name="GlimsHL7RoutingDefaultData">
<Subscript>"GlimsHL7Routing"</Subscript>
<Value name="1">
<Value>AddToMetric</Value>
</Value>
</Data>
<DefaultData>GlimsHL7RoutingDefaultData</DefaultData>
<Type>%Library.CacheStorage</Type>
}

}
