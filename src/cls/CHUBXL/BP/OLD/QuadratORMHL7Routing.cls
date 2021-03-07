Class CHUBXL.BP.OLD.QuadratORMHL7Routing Extends Ens.BusinessProcess [ ClassType = persistent, ProcedureBlock ]
{

/// Automatic Metric
Property AddToMetric As %Boolean [ InitialExpression = 1 ];

Parameter SETTINGS = "AddToMetric";

Method OnRequest(pRequest As CHUBXL.DATA.RawMessageStream, Output pResponse As Ens.Response) As %Status
{
	
	Set $ZTrap = "ErrorTrap", tSC=$$$OK	

	$$$TRACE("Start BP AgfaAllImgRouting")

	s tClassName = pRequest.%ClassName(1)
	s tSourceConfigName = ..%PrimaryRequestHeader.SourceConfigName
	s tTargetConfigName = ..%PrimaryRequestHeader.TargetConfigName
	
	$$$TRACE("ClassName : "_tClassName)
	$$$TRACE("SourceConfigName : "_tSourceConfigName)
	$$$TRACE("TargetConfigName : "_tTargetConfigName)
	
	If (tSourceConfigName = "AgfaHudImgHl7TcpIn" ) ! (tSourceConfigName = "AgfaBruImgHl7TcpIn" ) ! (tSourceConfigName = "AgfaMultiAllDocXmlFcpIn" ) ! (tSourceConfigName = "AgfaeiBruImgHl7TcpIn" ) ! (tSourceConfigName = "AgfaBruImgHl7TcpInNew" ) {
		i tSourceConfigName '= "AgfaeiBruImgHl7TcpIn" {
		  d pRequest.payLoad.Rewind()
		  s tmp=pRequest.payLoad.Read(3500000)
		  s tmp=$tr(tmp,$c(13),$c(10))
		  s HL7Msg = ##class(EnsLib.HL7.Message).ImportFromString(tmp,.tSC)
		}
		else {
		  s tmp=pRequest.RawContent
		  s HL7Msg=##class(EnsLib.HL7.Message).ImportFromString(tmp,.tSC)
		}
		s HL7Msg.DocType=HL7Msg.TypeVersion_":"_HL7Msg.Name
		s msgtype=HL7Msg.GetValueAt("MSH:MessageType.messagetype",,.tSC)
		s VisitNr=HL7Msg.GetValueAt("PIDgrp.PV1grp.PV1:VisitNumber",,.tSC)
	    s NHop=##class(CHUBXL.DT.Utils).getNHop(HL7Msg.GetValueAt("PIDgrp.PID:PatientIDInternalID()",,.tSC))
	    $$$TRACE("NHop : "_NHop)
	    i tSourceConfigName = "AgfaeiBruImgHl7TcpIn" {
		  s x=HL7Msg.SetValueAt("F","ORCgrp(1).OBRuniongrp.OBRunion.OBR:ResultStatus") $$$TRACE("Statut : "_x)
		  s x=HL7Msg.SetValueAt("F","ORCgrp().ORC:25") $$$TRACE("Statut ORC : "_x_" : *"_HL7Msg.GetValueAt("ORCgrp().ORC:25",,.tSC)_"*")
		}
	    $$$TRACE("NumUrg : "_$p(VisitNr,"/",1))
		i $p(VisitNr,"/",1)'="",$d(^CHUBXL.FiltreUrg(+$p(VisitNr,"/",1))) {
		  s $p(VisitNr,"/",1)=+$p(VisitNr,"/",1)_"000"_$p($p(VisitNr,"/",1),+$p(VisitNr,"/",1),2,99)
		  $$$TRACE("New NumUrg : "_$p(VisitNr,"/",1))
		  ;s status0=HL7File.HL7.SetValueAt(NumUrg,"PIDgrpgrp(1).PIDgrp.PV1grp.PV1:VisitNumber.ID")
		}
	    
		d HL7Msg.SetValueAt($p(VisitNr,"/",1),"PIDgrp.PV1grp.PV1:VisitNumber")
		$$$TRACE("HL7 MessageType BP : "_msgtype)
		s Code=HL7Msg.GetValueAt("ORCgrp(1).OBRuniongrp.OBRunion.OBR:FillerOrderNumber.namespaceID")
		$$$TRACE("HL7 valeur 0 : *"_Code_"*")
		$$$TRACE("HL7 valeur 1 : *"_HL7Msg.GetValueAt("ORCgrp(1).OBRuniongrp.OBRunion.OBR:UniversalServiceIdentifier.identifier")_"*")
		s Code=HL7Msg.GetValueAt("ORCgrp(1).OBRuniongrp.OBRunion.OBR:ParentNumber")
		$$$TRACE("Code : **************************"_Code_"*")
		$$$TRACE("Code : **************************"_HL7Msg.GetValueAt("ORCgrp(1).ORC:OrderControl")_"*")
		$$$TRACE("Code : **************************"_HL7Msg.RawContent_"*")
		i HL7Msg.GetValueAt("ORCgrp(1).ORC:OrderControl") = "CA" {
		  $$$TRACE("OrderControl : *"_HL7Msg.GetValueAt("ORCgrp(1).ORC:OrderControl")_"*")
		  i NHop=26 {
			s tSC = ..SendRequestAsync("AgfaBdocBruImgHl7TcpOut",HL7Msg)  Quit:$$$ISERR(tSC) tSC
			s tSC = ..SendRequestAsync("AgfaBdocBruImgHl7TcpFwd",HL7Msg)  Quit:$$$ISERR(tSC) tSC
		  }
		  i NHop=27 {
			s tSC = ..SendRequestAsync("AgfaBdocHudImgHl7TcpOut",HL7Msg)  Quit:$$$ISERR(tSC) tSC
		    s tSC = ..SendRequestAsync("AgfaBdocHudImgHl7FcpFwd",HL7Msg)  Quit:$$$ISERR(tSC) tSC
		  }
		}
		i Code=1 {
			s TagAgfa=HL7Msg.GetValueAt("ORCgrp(1).OBRuniongrp.OBRunion.OBR:UniversalServiceIdentifier.identifier")
			s NomHop=$s(NHop=27:"Hôpital H.U.D.E.R.F.",1:"Hôpital Brugmann")
			s NumPat=HL7Msg.GetValueAt("PIDgrp.PID:PatientIDInternalID().ID")
			s NumID=HL7Msg.GetValueAt("ORCgrp(1).OBRuniongrp.OBRunion.OBR:FillerOrderNumber.entityidentifier")
			i $tr(TagAgfa," ")="" {
			  s CrLf=$c(10)_$c(13)
			  s MsgSend="Bonjour,"_CrLf_CrLf
			  s MsgSend=MsgSend_"Il n'y a pas de code de classification pour le record ORM reçu depuis Agfa."_CrLf
			  s MsgSend=MsgSend_"Ceci concerne le patient dont le numéro administratif est "_NumPat_CrLf
			  s MsgSend=MsgSend_"et le code OBR-3 est "_NumID_CrLf_CrLf
			  s MsgSend=MsgSend_"Merci de prendre les dispositions nécéssaires."_CrLf
			  s MsgSend=MsgSend_"Cordialement."_CrLf
			  s tSC=##class(CHUBXL.DT.Utils).SendEmail("Pas de classification pour l'"_NomHop,MsgSend,"youssef.elhathout@chu-brugmann.be")
			  s tSC=##class(CHUBXL.DT.Utils).SendEmail("Pas de classification pour l'"_NomHop,MsgSend,"jeremie.rossignon@chu-brugmann.be")
			  ;s tSC=##class(CHUBXL.DT.Utils).SendEmail("Pas de classification pour l'"_NomHop,MsgSend,"sebastien.delaide@chu-brugmann.be")
			}
			i $tr(TagAgfa," ")'="" {
				s rec=$g(^CHUBXL.ConvArboBDoc(NHop,TagAgfa))
			    i $tr(rec," ")="" {
			      s CrLf=$c(10)_$c(13)
			      s MsgSend="Bonjour,"_CrLf_CrLf
			      s MsgSend=MsgSend_"La classification pour le record ORM reçu depuis Agfa "_TagAgfa_CrLf
			      s MsgSend=MsgSend_"n'existe pas dans la table de convertion."_CrLf
			      s MsgSend=MsgSend_"Ceci concerne le patient dont le numéro administratif est "_NumPat_CrLf
			      s MsgSend=MsgSend_"et le code OBR-3 est "_NumID_CrLf_CrLf
			      s MsgSend=MsgSend_"Merci de prendre les dispositions nécéssaires."_CrLf
			      s MsgSend=MsgSend_"Cordialement."_CrLf
			  	  s tSC=##class(CHUBXL.DT.Utils).SendEmail("Pas de classification pour l'"_NomHop,MsgSend,"youssef.elhathout@chu-brugmann.be")
			  	  s tSC=##class(CHUBXL.DT.Utils).SendEmail("Pas de classification pour l'"_NomHop,MsgSend,"jeremie.rossignon@chu-brugmann.be")
			  	  ;s tSC=##class(CHUBXL.DT.Utils).SendEmail("Pas de classification pour l'"_NomHop,MsgSend,"sebastien.delaide@chu-brugmann.be")
			    }
				s NewRec="^"_TagAgfa_"^"_$tr($p(rec,"~",1,3),"~","^")
				$$$TRACE("TagAgfa : *"_TagAgfa_"*")
				$$$TRACE("TagAgfa rec : *"_rec_"*")
				$$$TRACE("TagAgfa NewRec : *"_"^"_TagAgfa_"^"_$tr($p(rec,"~",1,3),"~","^")_"*")
				d HL7Msg.SetValueAt(NewRec,"ORCgrp(1).OBRuniongrp.OBRunion.OBR:UniversalServiceIdentifier")
				d HL7Msg.SetValueAt($p(rec,"~",4),"ORCgrp().OBRuniongrp.OBRunion.OBR:PlacerField1")
				d HL7Msg.SetValueAt($p(rec,"~",5),"ORCgrp().OBRuniongrp.OBRunion.OBR:PlacerField2")
			}
		    i NHop=26 {
			  s tSC = ..SendRequestAsync("AgfaBdocBruImgHl7TcpOut",HL7Msg)  Quit:$$$ISERR(tSC) tSC
			  s tSC = ..SendRequestAsync("AgfaBdocBruImgHl7TcpFwd",HL7Msg)  Quit:$$$ISERR(tSC) tSC
		    }
			I NHop=27 {
			  s tSC = ..SendRequestAsync("AgfaBdocHudImgHl7TcpOut",HL7Msg)  Quit:$$$ISERR(tSC) tSC
  			  s tSC = ..SendRequestAsync("AgfaBdocHudImgHl7FcpFwd",HL7Msg)  Quit:$$$ISERR(tSC) tSC
			}
			$$$TRACE("HL7Msg : "_HL7Msg.RawContent)
		}
		$$$TRACE("Msg sent to DPI")
	}
	Else {
		$$$LOGWARNING("Unsupported message received :"_tSourceConfigName)
	}
					
Exit	
	Quit tSC

ErrorTrap
 
 	Set $ZTrap = ""
 	Write $ZError,!
 	$$$TRACE("Error BP - QuadratORMVToDPI : "_$ZError)
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
<Data name="QuadratORMHL7RoutingDefaultData">
<Subscript>"QuadratORMHL7Routing"</Subscript>
<Value name="1">
<Value>AddToMetric</Value>
</Value>
</Data>
<DefaultData>QuadratORMHL7RoutingDefaultData</DefaultData>
<Type>%Library.CacheStorage</Type>
}

}
